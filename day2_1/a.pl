#!/usr/bin/perl

use strict;
use warnings FATAL => 'all';
use feature 'say';
use utf8;
use open qw(:std :utf8);

use Test::More;
use Data::Dumper;

sub get_game_id {
    my ($line) = @_;

    if ($line =~ /^Game (\d+):/a) {
        return $1;
    } else {
        die "a+1 $line";
    }
}

sub is_valid {
    my ($line) = @_;

    $line =~ s/^Game (\d+):\s*//a;

    my @parts = split /;\s*/, $line;

#warn $line;
#warn Dumper \@parts;

    foreach my $part (@parts) {
        my %h;
        my @color_count = split /,\s*/, $part;
        foreach my $el (@color_count) {
            if ($el =~ /^(\d+) (red|green|blue)\z/a) {
                $h{$2} = $1;
            } else {
                die "a+2 $el -- $line";
            }
        }

        # the bag contained only 12 red cubes, 13 green cubes, and 14 blue cubes
        return 0 if ($h{red} //0)> 12;
        return 0 if ($h{green} //0)> 13;
        return 0 if ($h{blue} //0)> 14;
#warn Dumper \@color_count;
#warn Dumper \%h;

    }

    return 1;
}

sub main {

    my $sum = 0;

    my $file = 'input';
    #my $file = 'i';
    open(my $fh, '<', $file) or die "Could not open file '$file' $!";


    while (my $line = <$fh>) {
        chomp($line);
        my $game_id = get_game_id($line);

        if (is_valid($line)) {
            $sum += $game_id;
        }

    }

    close($fh);

#    is($sum, 8);

    say $sum;

}
main();
__END__
