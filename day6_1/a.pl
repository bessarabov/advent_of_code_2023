#!/usr/bin/perl

use strict;
use warnings FATAL => 'all';
use feature 'say';
use utf8;
use open qw(:std :utf8);

use Test::More;
use Data::Dumper;
use List::Util qw(product);

sub get_number_of_ways {
    my ($t, $d) = @_;

    my $n;

warn Dumper $t;
warn Dumper $d;


    foreach (1..$t-1) {
say "## $_";
my $distance = $_ * ($t-$_);
say "distance: $distance";
        if ($distance > $d) {
            $n++;
        }

    }

    return $n;
}

sub main {

    my $sum = 0;

    my @times;
    my @distances;

    my $file = $ARGV[0];

    open(my $fh, '<', $file) or die "Could not open file '$file' $!";

    while (my $line = <$fh>) {
        chomp($line);

        if ($line =~ /^Time:\s+(.*)\z/) {
            @times = split /\s+/, $1;
        } elsif ($line =~ /^Distance:\s+(.*)\z/){
            @distances = split /\s+/, $1;
        } else {
            die;
        }

    }

    close($fh);

    my @r;

    my $i = 0;
    foreach my $t (@times) {
        my $n = get_number_of_ways($t, $distances[$i]);
        push @r, $n;

        $i++;
    }


warn Dumper \@r;
    my $answer = product(@r);

    is ($answer, 288);
    say $answer;



#    is($sum, );

    say $sum;

}
main();
__END__
