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
    my ($field) = @_;

    my @lines = split /\n/, $field;

    foreach my $i (1..(scalar(@lines)- 1)) {

        my $is_symmetrical = 1;
        my $row_above = $i;
        my $row_below = $i + 1;

        my $n = 0;
        while ( ($row_above>=1) && ( $row_below<= scalar(@lines) ) ) {

            if ($lines[$row_above-1] eq $lines[$row_below-1]) {
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

        if ($is_symmetrical) {
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

    return field_has_horizontal_mirror(join "\n", @new);
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

    my @h_mirrors;
    my @v_mirrors;

    foreach my $f (@fields) {

        my $h = field_has_horizontal_mirror($f);
        if ($h) {
            push @h_mirrors, $h;
        }

        my $v = field_has_vertical_mirror($f);
        if ($v) {
            push @v_mirrors, $v;
        }

        if ($h && $v) {
            die 'field has both horizontal & vertical mirrors';
        }

        if (!$h && !$v) {
            die 'no mirrors found';
        }

    }

    say sum(@v_mirrors) + 100 * sum(@h_mirrors);


}
main();
__END__
