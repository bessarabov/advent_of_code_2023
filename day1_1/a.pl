#!/usr/bin/perl

use strict;
use warnings FATAL => 'all';
use feature 'say';
use utf8;
use open qw(:std :utf8);

sub get_number {
    my ($str) = @_;

    if ($str =~ /^\D*(\d)\D*\z/) {
        return $1 . $1;
    } elsif ($str =~ /^\D*(\d).*(\d)\D*\z/) {
        return $1 . $2;
    } else {
        die "NO $str";
    }

}

say get_number('1abc2');
say get_number('pqr3stu8vwx');
say get_number('a1b2c3d4e5f');
say get_number('treb7uchet');

my $file = 'input';
open(my $fh, '<', $file) or die "Could not open file '$file' $!";

my $sum = 0;

while (my $line = <$fh>) {
	$sum += get_number($line);
}

close($fh);

say $sum;
