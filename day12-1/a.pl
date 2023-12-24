#!/usr/bin/perl

use strict;
use warnings FATAL => 'all';
use feature 'say';
use utf8;
use open qw(:std :utf8);

use Moment;
use Test::More;
use Data::Dumper;

sub p {
    say Dumper $_[0];
}

sub read_file {
    my ($file_name) = @_;

    my $content = '';

    open(my $fh, '<', $file_name) or die "Could not open file '$file_name' $!";

    while (my $line = <$fh>) {
        $content .= $line;
    }

    close($fh);

    return $content;
}

=head2 get_field

$field[0] - first row
$field[0]->[2] - 3rd element if 1st row

$field[$y]->[$x]

(x,y)

0,0     1,0     2,0     # $field[0]
0,1     1,1     2,1     # $field[1]

    my $max_x = scalar(@{$field[0]})-1;
    my $max_y = scalar(@field)-1;

    foreach my $x (0..$max_x) {
        foreach my $y (0..$max_y) {
            #
        }
    }

=cut

sub get_field {
    my ($content) = @_;

    my @field;

    foreach my $row (split /\n/, $content) {
        my @elements = split //, $row;
        push @field, \@elements;
    }

    return @field;
}

sub get_diffrent_arrangements_count {
    my ($line) = @_;

    my $count = 0;

    my $str;
    my $n;

    if ($line =~ /(\S+) (\S+)\z/) {
        $str = $1;
        $n = join '_', split /,/, $2;

        my $questions = get_questions_count($str);

        foreach my $i (0..2**$questions-1) {
            my $bit_string = sprintf '%0' . $questions . 'b', $i;
            my $checking_string = get_string($str, $bit_string);

            if ($n eq get_n_from_str($checking_string)) {
                $count++;
            }

        }

    } else {
        die $line;
    }

    return $count;
}

sub get_string {
    my ($str, $bit_string) = @_;

    $bit_string =~ s/0/#/g;
    $bit_string =~ s/1/./g;

    my @bits = split //, $bit_string;

    my $new_str = '';

    foreach my $char (split //, $str) {
        if ($char eq '?') {
            $new_str .= shift @bits;
        } else {
            $new_str .= $char;
        }
    }

    return $new_str;
}

sub get_questions_count {
    my ($str) = @_;
    my $q = 0;
    foreach my $char (split //, $str) {
        $q++ if $char eq '?';
    }

    return $q;
}

sub get_n_from_str {
    my ($str) = @_;

    my @n;

    # operational (.) or damaged (#)
    my $is_in_damanged = 0;

    my $n = 0;
    foreach my $char (split //, $str) {

        if ($char eq '.') {
            if ($is_in_damanged) {
                push @n, $n;
            }

            $n = 0;
            $is_in_damanged = 0;
        } elsif ($char eq '#') {
            $n++;
            $is_in_damanged = 1;
        } else {
            die $str;
        }
    }

    if ($n != 0) {
        push @n, $n;
    }

    return join '_', @n;
}

sub min {
    my ($one, $two) = @_;

    return $one < $two ? $one : $two;
}

sub max {
    my ($one, $two) = @_;

    return $one > $two ? $one : $two;
}

sub main {

    $Data::Dumper::Sortkeys = 1;

#    is(get_diffrent_arrangements_count('???.### 1,1,3'), 1);
#    is(get_diffrent_arrangements_count('.??..??...?##. 1,1,3'), 4);
#    is(get_diffrent_arrangements_count('?#?#?#?#?#?#?#? 1,3,1,6'), 1);
#    is(get_diffrent_arrangements_count('????.#...#... 4,1,1'), 1);
#    is(get_diffrent_arrangements_count('????.######..#####. 1,6,5'), 4);
#    is(get_diffrent_arrangements_count('?###???????? 3,2,1'), 10);

    my $answer = 0;

    my $file_name = $ARGV[0];
    my $content = read_file($file_name);

    my $i = 0;
    foreach my $line (split /\n/, $content) {
        say $i;
        $answer += get_diffrent_arrangements_count($line);
        $i++;
    }

    say $answer;

}
main();
__END__
