#!/usr/bin/perl

use strict;
use warnings FATAL => 'all';
use feature 'say';
use utf8;
use open qw(:std :utf8);

use Test::More;
use Data::Dumper;


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

    my @instructions = split //, $instructions_string;

    my $point = 'AAA';

    my $count = 0;
    while ($point ne 'ZZZ') {
say $point;
        if (scalar @instructions == 0) {
            @instructions = split //, $instructions_string;
        }

        my $instruction = shift @instructions;

        $point = $h{$point}->{$instruction};

        $count++;
    }



    say $count;

}
main();
__END__
