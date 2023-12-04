#!/usr/bin/perl

use strict;
use warnings FATAL => 'all';
use feature 'say';
use utf8;
use open qw(:std :utf8);

use Test::More;
use Data::Dumper;

sub get_points {
    my ($win_count) = @_;
    return 0 if $win_count==0;

    return  2**($win_count-1);
}

sub main {

#foreach my $i (0..20) {
#    say $i, ' ', get_points($i);
#}

#die;

    my $sum = 0;

    my $file = 'input';
    #my $file = 'i2';
    open(my $fh, '<', $file) or die "Could not open file '$file' $!";


# a list of winning numbers and then a list of numbers you have.
#
my $i = 0;

    while (my $line = <$fh>) {
        chomp($line);
# Card 3:  1 21 53 59 44 | 69 82 63 72 16 21 14  1

        if ($line =~ /^Card\s+\d+:\s*(.*)\s*\|\s*(.*)\z/a) {
            my $winning_numbers = $1;
            my $my_numbers = $2;

            my %w;
            my %m;

            foreach my $el (split /\s+/, $winning_numbers) {
                $w{$el}++;
if ($w{$el} > 1) {
warn "w $line";
}
            }

            foreach my $el (split /\s+/, $my_numbers) {
                $m{$el}++;

if ($m{$el} > 1) {
warn "m $line";
}
            }

#warn Dumper \%w;
#warn Dumper \%m;

            my $win_count = 0;
            foreach my $number (sort keys %m) {
                if (exists $w{$number}) {
                    $win_count++;
                }
            }


            my $local_sum = 0;

            if ($win_count > 0) {
                $local_sum = 2**($win_count-1);
            }

            $sum+=$local_sum;

#warn Dumper $win_count;
#warn Dumper $local_sum;

            $i++;
        } else {
            die "a+1 $line";
        }

    }

    close($fh);

#    is($sum, 13);

    say $i;
    say $sum;

}
main();
__END__
