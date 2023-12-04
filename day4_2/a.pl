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

    return $one > $two ? $one : $two;
}

sub main {

$Data::Dumper::Sortkeys  = 1;

    my $max_win_number = 0;
    my $max_my_number = 0;

#foreach my $i (0..20) {
#    say $i, ' ', get_points($i);
#}

#die;

    my $sum = 0;

    my $file = $ARGV[0];
    open(my $fh, '<', $file) or die "Could not open file '$file' $!";


# a list of winning numbers and then a list of numbers you have.

my $i = 0;

    my %card2wins;

    while (my $line = <$fh>) {
        chomp($line);

        # Card 3:  1 21 53 59 44 | 69 82 63 72 16 21 14  1

        if ($line =~ /^Card\s+(\d+):\s*(.*)\s*\|\s*(.*)\z/a) {
            my $card_id = $1;
            my $winning_numbers = $2;
            my $my_numbers = $3;

            my %w;
            my %m;

            foreach my $el (split /\s+/, $winning_numbers) {
                $w{$el}++;

                if ($w{$el} > 1) {
                    die "w $line";
                }

                $max_win_number = max($max_win_number, $el);
            }

            foreach my $el (split /\s+/, $my_numbers) {
                $m{$el}++;

                if ($m{$el} > 1) {
                    die "m $line";
                }

                $max_my_number = max($max_my_number, $el);
            }

            my $win_count = 0;
            foreach my $number (sort keys %m) {
                if (exists $w{$number}) {
                    $win_count++;
                }
            }



#warn Dumper $win_count;
#warn Dumper $local_sum;

            $i++;

            $card2wins{$card_id} = $win_count;
        } else {
            die "a+1 $line";
        }

    }

    close($fh);

    is($sum, 30);

    my $max_card_number = 220;
    my %card2count;

    foreach my $card_id (sort { $a <=> $b } keys %card2wins) {
        $card2count{$card_id}++;

        foreach $i (1..$card2count{$card_id}) {
            my $tmp_card_id = $card_id;
            foreach my $w (1..$card2wins{$card_id}) {
                $tmp_card_id++;
                if ($tmp_card_id <= $max_card_number) {
                    $card2count{$tmp_card_id}++;
                }
            }
        }
#        say $card_id, ' - ', $card2wins{$card_id};
    }

warn Dumper \%card2wins;
warn Dumper \%card2count;

    my $total_count = 0;
    foreach my $v (sort keys %card2count) {
        $total_count += $card2count{$v};
    }

    say "total scratchcards: $total_count";


}
main();
__END__
