#!/usr/bin/perl

use strict;
use warnings FATAL => 'all';
use feature 'say';
use utf8;
use open qw(:std :utf8);

use Moment;
use Test::More;
use Data::Dumper;

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

=head2 get_field_from_content

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

sub get_field_from_content {
    my ($content) = @_;

    my @field;

    foreach my $row (split /\n/, $content) {
        my @elements = split //, $row;
        push @field, \@elements;
    }

    return @field;
}

sub get_field_from_array {
    my (@field) = @_;

    my $field = '';

    my $max_x = scalar(@{$field[0]})-1;
    my $max_y = scalar(@field)-1;

    foreach my $y (0..$max_y) {
        foreach my $x (0..$max_x) {
            $field .= $field[$y]->[$x];
        }
        $field .= "\n";
    }

    return $field;

}

sub min {
    my ($one, $two) = @_;

    return $one < $two ? $one : $two;
}

sub max {
    my ($one, $two) = @_;

    return $one > $two ? $one : $two;
}

sub get_load {
    my ($field) = @_;

    my $load = 0;

    my $i = 0;
    foreach my $line (split /\n/, $field) {
        $i++;
    }

    foreach my $line (split /\n/, $field) {
        foreach my $el (split //, $line) {
            if ($el eq 'O') {
                $load += $i;
            }
        }
        $i--;
    }

    return $load;
}

sub move_north {
    my ($field) = @_;

    my $moved = 0;

    my @field = @{$field};

    my $y = 0;
    foreach my $row (@field) {
        if ($y > 0) {
            my $x = 0;
            foreach my $el (@{$row}) {
                if ($el eq 'O' && $field[$y-1]->[$x] eq '.') {
                    $field[$y-1]->[$x] = 'O';
                    $field[$y]->[$x] = '.';
                    $moved = 1;
                }
                $x++;
            }
        }
        $y++;
    }

    return $moved;
}

sub main {

    my $file_name = $ARGV[0];
    my $content = read_file($file_name);

    my @field = get_field_from_content($content);

    my $i = 0;

    while (move_north(\@field)) {
        $i++;
        die 'too many loops' if $i > 10_000;
    }

    my $f = get_field_from_array(@field);

    say $f;

    say get_load($f);

}
main();
__END__
