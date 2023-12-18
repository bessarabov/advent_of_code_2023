#!/usr/bin/perl

use strict;
use warnings FATAL => 'all';
use feature 'say';
use utf8;
use open qw(:std :utf8);

use Moment;
use Test::More;
use Data::Dumper;

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

sub output_field {
    my (@field) = @_;

    my $max_x = scalar(@{$field[0]})-1;
    my $max_y = scalar(@field)-1;

    foreach my $y (0..$max_y) {
        foreach my $x (0..$max_x) {
            print $field[$y]->[$x];
        }
        say '';
    }

}

sub fill_field {
    my ($x, $y, $field) = @_;
    my @field = @{$field};

    my $max_x = scalar(@{$field[0]})-1;
    my $max_y = scalar(@field)-1;

    my %todo;

    $todo{$x . '_' . $y} = 1;

    my $i = 0;

    my @directions = (
        [0,-1],
        [1,-1],
        [1,0],
        [1,1],
        [0,1],
        [-1,1],
        [-1,0],
        [-1,-1],
    );

    while (%todo) {
        my $cur = [keys %todo]->[0];

        delete $todo{$cur};

        my ($cur_x, $cur_y) = $cur =~ /^(\d+)_(\d+)\z/a;
        $field[$cur_y]->[$cur_x] = 'x';

        foreach my $d (@directions) {
            my $x = $cur_x + $d->[0];
            my $y = $cur_y + $d->[1];

            if (
                ($x < 0)
                || ($y < 0)
                || ($x > $max_x)
                || ($y > $max_y)
            ) {
                # invalid poisition, doing nothign
            } elsif ($field[$y]->[$x] eq '.') {
                $todo{$x . '_' . $y} = 1;
            }

        }

        $i++;
        die "too many loops" if $i > 1_000_000;
    }
}

sub get_field_elements_count {
    my ($field) = @_;

    my %h;

    my @field = @{$field};

    my $max_x = scalar(@{$field[0]})-1;
    my $max_y = scalar(@field)-1;

    foreach my $y (0..$max_y) {
        foreach my $x (0..$max_x) {
            $h{ $field[$y]->[$x] }++;
        }
    }

    return %h;
}

sub min {
    my ($one, $two) = @_;

    return $two if not defined $one;
    return $one if not defined $two;

    return $one < $two ? $one : $two;
}

sub max {
    my ($one, $two) = @_;

    return $two if not defined $one;
    return $one if not defined $two;

    return $one > $two ? $one : $two;
}

sub main {

    $Data::Dumper::Sortkeys = 1;

    my $answer = 0;

    my $file_name = $ARGV[0];
    my $content = read_file($file_name);

    my $max_x = 600;
    my $max_y = 300;

    my @field;

say 'a+1';

    foreach my $x (0..$max_x) {
        foreach my $y (0..$max_y) {
            $field[$y]->[$x] = '.';
        }
    }

    my $cur_x = int($max_x / 2);
    my $cur_y = int($max_y / 2);

    $field[$cur_y]->[$cur_x] = 'S';

say 'a+2';
    foreach my $line (split /\n/, $content) {
        if ($line =~ /^([URDL])\s+(\d+)\s+\(#([a-f0-9]{6})\)\z/a) {
            my $direction = $1;
            my $number = $2;
            my $color = $3;

            foreach my $i (1..$number) {
                if ($direction eq 'U') {
                    $cur_y--;
                } elsif ($direction eq 'R') {
                    $cur_x++;
                } elsif ($direction eq 'D') {
                    $cur_y++;
                } elsif ($direction eq 'L') {
                    $cur_x--;
                } else {
                    die 'invalid direction';
                }

                $field[$cur_y]->[$cur_x] = $direction;
            }

        } else {
            die "unexpected line '$line'";
        }

    }

say 'a+3';

    fill_field(0, 0, \@field);

#    output_field(@field);
say 'a+4';

    my %count = get_field_elements_count(\@field);

    warn Dumper \%count;

    die 'S' if exists $count{S};

    say "trench: " . (
        $count{U} +
        $count{R} +
        $count{D} +
        $count{L}
        )
    ;

    say "full: " . (
        $count{U} +
        $count{R} +
        $count{D} +
        $count{L} +
        $count{'.'}
        )
    ;

    say $answer;

}
main();
__END__
