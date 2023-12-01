#!/usr/bin/perl

use strict;
use warnings FATAL => 'all';
use feature 'say';
use utf8;
use open qw(:std :utf8);

use Test::More;

sub get_number_invalid {
    my ($str) = @_;

    $str =~ s/one/1/g;
    $str =~ s/two/2/g;
    $str =~ s/three/3/g;
    $str =~ s/four/4/g;
    $str =~ s/five/5/g;
    $str =~ s/six/6/g;
    $str =~ s/seven/7/g;
    $str =~ s/eight/8/g;
    $str =~ s/nine/9/g;

    if ($str =~ /^\D*(\d)\D*\z/) {
        return $1 . $1;
    } elsif ($str =~ /^\D*(\d).*(\d)\D*\z/) {
        return $1 . $2;
    } else {
        die "NO $str";
    }

}


sub get_digit {
    my ($str) = @_;

    $str =~ s/one/1/;
    $str =~ s/two/2/;
    $str =~ s/three/3/;
    $str =~ s/four/4/;
    $str =~ s/five/5/;
    $str =~ s/six/6/;
    $str =~ s/seven/7/;
    $str =~ s/eight/8/;
    $str =~ s/nine/9/;


    $str =~ s/eno/1/;
    $str =~ s/owt/2/;
    $str =~ s/eerht/3/;
    $str =~ s/ruof/4/;
    $str =~ s/evif/5/;
    $str =~ s/xis/6/;
    $str =~ s/neves/7/;
    $str =~ s/thgie/8/;
    $str =~ s/enin/9/;

    die "a+3 $str" if length($str) != 1;

    return $str;
}


sub get_number {
    my ($str) = @_;

    my $first;
    my $second;

    if ($str =~ /^.*?(one|two|three|four|five|six|seven|eight|nine|1|2|3|4|5|6|7|8|9)/) {
        $first = get_digit($1);
    } else {
        die "a+1 $str";
    }

    if (reverse($str) =~ /^.*?(enin|thgie|neves|xis|evif|ruof|eerht|owt|eno|1|2|3|4|5|6|7|8|9)/) {
        $second = get_digit($1);
    } else {
        die "a+2 $str";
    }

    return $first . $second;

#    if ($str =~ /^\D*(\d)\D*\z/) {
#        return $1 . $1;
#    } elsif ($str =~ /^\D*(\d).*(\d)\D*\z/) {
#        return $1 . $2;
#    } else {
#        die "NO $str";
#    }

}

is(get_number('two1nine'), 29);
is(get_number('eightwothree'), 83);
is(get_number('abcone2threexyz'), 13);
is(get_number('xtwone3four'), 24);
is(get_number('4nineeightseven2'), 42);
is(get_number('zoneight234'), 14);
is(get_number('7pqrstsixteen'), 76);


my $file = 'input';
open(my $fh, '<', $file) or die "Could not open file '$file' $!";

my $sum = 0;

while (my $line = <$fh>) {
    chomp $line;

	$sum += get_number($line);
}

close($fh);

say $sum;
