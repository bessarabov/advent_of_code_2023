#!/usr/bin/perl

use strict;
use warnings FATAL => 'all';
use feature 'say';
use utf8;
use open qw(:std :utf8);

use Test::More;
use Data::Dumper;
use Moment;


sub gcd {
    my ($a, $b) = @_;
    while ($b != 0) {
        my $temp = $b;
        $b = $a % $b;
        $a = $temp;
    }
    return $a;
}

sub lcm {
    my @numbers = @_;
    my $result = $numbers[0];

    foreach my $i (1 .. $#numbers) {
        $result = ($result * $numbers[$i]) / gcd($result, $numbers[$i]);
    }

    return $result;
}


sub main {

    my $file = $ARGV[0];
    open(my $fh, '<', $file) or die "Could not open file '$file' $!";

    my $instructions_string = '';
    my %h;

    while (my $line = <$fh>) {
        chomp($line);

        if ($instructions_string eq '') {
            $instructions_string = $line;
            next;
        }

        next if $line eq '';

        if ($line =~ /^(.{3}) = \((.{3}), (.{3})\)\z/) {
            if (exists $h{$1}) {
                die "exists"
            }

            $h{$1} = {
                L => $2,
                R => $3,
            };

        } else {
            die $line;
        }

    }

    close($fh);

    my @points;

    foreach my $p (sort keys %h) {
        if ($p =~ /A\z/) {
            push @points, $p;
        }
    }

    my @counts;

    foreach my $p (@points) {
        my @instructions = split //, $instructions_string;

        my $count = 0;
        while ($p !~ /Z\z/) {
            if (scalar @instructions == 0) {
                @instructions = split //, $instructions_string;
            }

            my $instruction = shift @instructions;

            $p = $h{$p}->{$instruction};
            $count++;
        }

        push @counts, $count;
    }

warn Dumper lcm(@counts);


}
main();
__END__
