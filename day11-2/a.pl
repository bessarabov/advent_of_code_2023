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

sub p {
    say Dumper $_[0];
}

sub min {
    my ($one, $two) = @_;

    return $one < $two ? $one : $two;
}

sub max {
    my ($one, $two) = @_;

    return $one > $two ? $one : $two;
}

sub get_galaxies {
    my ($field) = @_;

    my @field = @{$field};

    my @g;

    my $max_x = scalar(@{$field[0]})-1;
    my $max_y = scalar(@field)-1;

    my $i = 1;

    foreach my $y (0..$max_y) {
        foreach my $x (0..$max_x) {
            if ($field[$y]->[$x] eq '#') {
                push @g, {
                    x => $x,
                    y => $y,
                    galaxy_id => $i,
                };
                $i++;
            }
        }
    }

    return @g;
}

sub get_empty {
    my ($field) = @_;

    my @field = @{$field};

    my $max_x = scalar(@{$field[0]})-1;
    my $max_y = scalar(@field)-1;

    my $i = 1;

    my @columns;
    my @rows;

    LOOP_X:
    foreach my $x (0..$max_x) {
        foreach my $y (0..$max_y) {
            if ($field[$y]->[$x] eq '#') {
                next LOOP_X;
            }
        }
        push @columns, $x;
    }

    LOOP_Y:
    foreach my $y (0..$max_y) {
        foreach my $x (0..$max_x) {
            if ($field[$y]->[$x] eq '#') {
                next LOOP_Y;
            }
        }
        push @rows, $y;
    }

    return \@columns, \@rows;
}

sub get_distance {
    my ($g1, $g2, $galaxies, $empty_columns, $empty_rows) = @_;

    my @galaxies = @{$galaxies};

    my @x = sort { $a <=> $b } $g1->{x}, $g2->{x};
    my @y = sort { $a <=> $b } $g1->{y}, $g2->{y};

    my $x_distance = $x[1] - $x[0];
    my $y_distance = $y[1] - $y[0];

    my $distance =
        $x_distance
        + $y_distance
        + get_empty_count(@x, $empty_columns)
        + get_empty_count(@y, $empty_rows)
        ;

#    say sprintf "%s %s => %s",
#        $g1->{galaxy_id},
#        $g2->{galaxy_id},
#        $distance,
#        ;

    return $distance;
}

sub get_empty_count {
    my ($p1, $p2, $empty) = @_;

    my $count = 0;

    foreach my $e (@{$empty}) {
        if ($e > $p1 && $e < $p2) {
            #$count += 10 - 1;
            #$count += 100 - 1;
            $count += 1000000 - 1;
        }
    }

    return $count;
}

sub main {

    $Data::Dumper::Sortkeys = 1;

    my $file_name = $ARGV[0];
    my $content = read_file($file_name);

    my @field = get_field($content);

    my @galaxies = get_galaxies(\@field);

    my ($empty_columns, $empty_rows) = get_empty(\@field);

    my %distance;

    foreach my $g1 (@galaxies) {
        foreach my $g2 (@galaxies) {
            next if $g1->{galaxy_id} == $g2->{galaxy_id};
            my $key = join '_', sort { $a <=> $b } $g1->{galaxy_id}, $g2->{galaxy_id};
            next if exists $distance{$key};

            $distance{$key} = get_distance($g1, $g2, \@galaxies, $empty_columns, $empty_rows);
        }
    }

    my $answer = 0;

    foreach my $k (keys %distance) {
        $answer += $distance{$k};
    }

    say $answer;

}
main();
__END__
