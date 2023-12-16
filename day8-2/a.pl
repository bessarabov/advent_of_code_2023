#!/usr/bin/perl

use strict;
use warnings FATAL => 'all';
use feature 'say';
use utf8;
use open qw(:std :utf8);

use Test::More;
use Data::Dumper;
use Moment;

sub is_at_end {
    my (@points) = @_;

    foreach my $p (@points) {
        return 0 if $p !~ /Z\z/;
    }

    return 1;
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

#    warn scalar @points;
#warn Dumper \@points;
#
#warn Dumper is_at_end('AAZ', 'BBZ');



    my @instructions = split //, $instructions_string;

    my $point = 'AAA';

    my $count = 0;
    while (!is_at_end(@points)) {
        if (scalar @instructions == 0) {
            @instructions = split //, $instructions_string;
        }

        my $instruction = shift @instructions;

        foreach my $p (@points) {
            $p = $h{$p}->{$instruction};
        }

        $count++;

#warn Dumper \@points;

        if ($count % 100_000 == 0) {
            say sprintf "%s %s",
                Moment->now()->get_iso_string(),
                $count,
                ;
        }

    }

    say $count;

}
main();
__END__
