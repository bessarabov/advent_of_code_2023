#!/usr/bin/perl

use strict;
use warnings FATAL => 'all';
use feature 'say';
use utf8;
use open qw(:std :utf8);

use Moment;
use Test::More;
use Data::Dumper;
use List::Util qw(sum);

$Data::Dumper::Sortkeys = 1;

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

sub min {
    my ($one, $two) = @_;

    return $one < $two ? $one : $two;
}

sub max {
    my ($one, $two) = @_;

    return $one > $two ? $one : $two;
}

=h

number of rows above mirror: 4

1 #...##..# 1
2 #....#..# 2
3 ..##..### 3
4v#####.##.v4
5^#####.##.^5
6 ..##..### 6
7 #....#..# 7

=cut

sub field_has_horizontal_mirror {
    my ($field, $smudge_y) = @_;

#say $field;

    my @lines = split /\n/, $field;

    my $smudge_is_in_reflection = 0;

    foreach my $i (1..(scalar(@lines) - 1)) {

        $smudge_is_in_reflection = 0;

        my $is_symmetrical = 1;
        my $row_above = $i;
        my $row_below = $i + 1;

        my $n = 0;
        while ( ($row_above>=1) && ( $row_below<= scalar(@lines) ) ) {

            my $line_1 = $lines[$row_above-1];
            my $line_2 = $lines[$row_below-1];

            if ($line_1 =~ /D/ || $line_1 =~ /N/ || $line_2 =~ /D/ || $line_2 =~ /N/) {
                $smudge_is_in_reflection = 1;
                $line_1 =~ tr/DN/.#/;
                $line_2 =~ tr/DN/.#/;
            }

            if ($line_1 eq $line_2) {
                # mirror
            } else {
                $is_symmetrical = 0;
                last;
            }

            $row_above--;
            $row_below++;

            $n++;
            die 'too many' if $n > 10_000;
        }

        if ($is_symmetrical && $smudge_is_in_reflection) {
            return $i;
        }
    }

    return undef;
}

sub field_has_vertical_mirror {
    my ($field) = @_;

    my @lines = split /\n/, $field;

    my @new;

    foreach my $line (@lines) {
        my $i = 0;
        foreach my $char (split //, $line) {
            $new[$i] .= $char;
            $i++;
        }
    }

    return field_has_horizontal_mirror(join("\n", @new));
}

sub get_number_of_squares {
    my ($field) = @_;

    my @lines = split /\n/, $field;
    my @col = split //, $lines[0];

    return scalar(@lines) * scalar(@col);
}

sub flip {
    my ($field, $smudge_position) = @_;

    my $new_field = '';

    my %h = (
        '.' => 'N', # number sign
        '#' => 'D', # dot
    );

    my $i = 1;

    my @lines = split /\n/, $field;

    foreach my $line (@lines) {
        foreach my $char (split //, $line) {
            if ($smudge_position == $i) {
                $char = $h{$char};
            }
            $new_field .= $char;
            $i++;
        }

        $new_field .= "\n";
    }

    return $new_field;
}

sub main {

    my $file_name = $ARGV[0];
    my $content = read_file($file_name);

    my @fields;
    my $field = '';

    foreach my $line (split /\n/, $content) {
        if ($line =~ /\S+/) {
            $field .= $line . "\n";
        } elsif ($line =~ /^\z/) {
            push @fields, $field;
            $field = '';
        } else {
            die $line
        }
    }

    push @fields, $field;

    say 'Number of fields: ', scalar(@fields);

    my @h_mirrors;
    my @v_mirrors;

    my $f_id = 0;
    LOOP:
    foreach my $f (@fields) {
        say "## $f_id";

        $f_id++;

        foreach my $smudge_position (1..get_number_of_squares($f)) {

#say '';
#say $smudge_position;

            my $new_f = flip($f, $smudge_position);

#say $new_f;
            my $h = field_has_horizontal_mirror($new_f);
            my $v = field_has_vertical_mirror($new_f);

            if (
                (defined($h) && !defined($v))
                || (defined($v) && !defined($h))
            ) {

                if ($h) {
                    push @h_mirrors, $h;
                }

                if ($v) {
                    push @v_mirrors, $v;
                }

                next LOOP;
            }

        }

        die 'no mirrors found';

    }

    push @v_mirrors, 0;
    push @h_mirrors, 0;

#p \@v_mirrors;
#p \@h_mirrors;

    say sum(@v_mirrors) + 100 * sum(@h_mirrors);


}
main();
__END__
