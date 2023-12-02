#!/usr/bin/perl

use strict;
use warnings FATAL => 'all';
use feature 'say';
use utf8;
use open qw(:std :utf8);

use Test::More;
use Data::Dumper;

sub max {
    my ($one, $two) = @_;

    $one //= 0;
    $two //= 0;

    return $one > $two ? $one : $two;
}

sub get_power {
    my ($line) = @_;

    my $original_line = $line;

    my %max = (
        red => 0,
        green => 0,
        blue => 0,
    );

    $line =~ s/^Game (\d+):\s*//a;

    my @parts = split /;\s*/, $line;

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

        foreach my $color (sort keys %h) {
            $max{$color} = max($max{$color}, $h{$color});
        }

#        return 0 if ($h{red} //0)> 12;
#        return 0 if ($h{green} //0)> 13;
#        return 0 if ($h{blue} //0)> 14;
#
##warn Dumper \@color_count;
##warn Dumper \%h;

    }

    die "a+3 red == 0 $original_line" if $max{red} == 0;
    die "a+4 green == 0 $original_line" if $max{green} == 0;
    die "a+5 blue == 0 $original_line" if $max{blue} == 0;

    my $power = $max{red} * $max{green} * $max{blue};

    return $power;
}

sub main {

    my $sum = 0;

    my $file = 'input';
    #my $file = 'i';
    open(my $fh, '<', $file) or die "Could not open file '$file' $!";


    while (my $line = <$fh>) {
        chomp($line);

        $sum += get_power($line);

    }

    close($fh);

#    is($sum, 2286);

    say $sum;

}
main();
__END__
