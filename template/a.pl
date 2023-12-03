#!/usr/bin/perl

use strict;
use warnings FATAL => 'all';
use feature 'say';
use utf8;
use open qw(:std :utf8);

use Test::More;
use Data::Dumper;


sub main {

    my $sum = 0;

    my $file = 'input';
    #my $file = 'i';
    open(my $fh, '<', $file) or die "Could not open file '$file' $!";


    while (my $line = <$fh>) {
        chomp($line);

    }

    close($fh);

#    is($sum, );

    say $sum;

}
main();
__END__
