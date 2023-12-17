#!/usr/bin/perl

use strict;
use warnings FATAL => 'all';
use feature 'say';
use utf8;
use open qw(:std :utf8);

use Moment;
use Test::More;
use Data::Dumper;

our $MAX_X;
our $MAX_Y;

#
#     north
# west        east
#     south
#
#
#     N
#   W   E
#     S
#


our %REVERSE_DIRECTIONS = (
    n => 's',
    e => 'w',
    s => 'n',
    w => 'e',
);

#    '|' is a vertical pipe connecting north and south.
#    '-' is a horizontal pipe connecting east and west.
#    'L' is a 90-degree bend connecting north and east.
#    'J' is a 90-degree bend connecting north and west.
#    '7' is a 90-degree bend connecting south and west.
#    'F' is a 90-degree bend connecting south and east.
#    . is ground; there is no pipe in this tile.


our %PIPES = (
    '|' => 'ns',
    '-' => 'ew',
    'L' => 'ne',
    'J' => 'nw',
    '7' => 'sw',
    'F' => 'se',
);

# pipe to hash with directions
my %P2H;

# pipe to arr with directions;
my %P2A;




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

sub is_valid_pipe {
    my ($s_x, $s_y, $field) = @_;

    my @field = @{$field};

    my %visited;

    my $pipe_id = $field[$s_y]->[$s_x];

    my $d1 = $P2A{$pipe_id}->[0];
    my $d2 = $P2A{$pipe_id}->[1];

    my $p1_x = $s_x;
    my $p1_y = $s_y;

    my $p2_x = $s_x;
    my $p2_y = $s_y;

    $visited{ $s_x . '_' . $s_y } = 1;

#     north
# west        east
#     south
#
#
#     N
#   W   E
#     S

    my $i = 0;
    while (1) {

        # move point 1 to direction 1
        my ($new_p1_x, $new_p1_y) = move($p1_x, $p1_y, $d1);

#warn $d1;

#warn Dumper [$new_p1_x, $new_p1_y];

        return 0 if $new_p1_x < 0;
        return 0 if $new_p1_y < 0;

        return 0 if $new_p1_x > $MAX_X;
        return 0 if $new_p1_y > $MAX_Y;

        my $p1_new_pipe_id = $field[$new_p1_y]->[$new_p1_x];
#warn $p1_new_pipe_id;

        return 0 if $p1_new_pipe_id eq '.';
        return 0 if not are_connected($pipe_id, $p1_new_pipe_id, $d1);

        ($p1_x, $p1_y) = ($new_p1_x, $new_p1_y);
        $d1 = get_new_direction($p1_new_pipe_id, $d1);

        return 1 if $visited{$p1_x . '_' . $p1_y};

#warn $p1_new_pipe_id;
#die;


        $i++;
        die 'too many' if $i > 1_000_000;
    }

    return 0;
}

sub get_new_direction {
    my ($p, $d) = @_;

    my $new_d;
    foreach my $tmp (@{$P2A{$p}}) {
        next if $tmp eq $REVERSE_DIRECTIONS{$d};
        $new_d = $tmp;
    }

    die 'no new d' if not defined $new_d;

    return $new_d;
}

sub move {
    my ($x, $y, $d) = @_;

#warn 'move';

#     north
# west        east
#     south
#
#
#     N
#   W   E
#     S

    if ($d eq 'n') {
        return ($x, $y-1);
    } elsif ($d eq 'e') {
        return ($x+1, $y);
    } elsif ($d eq 's') {
        return ($x, $y+1);
    } elsif ($d eq 'w') {
        return ($x-1, $y);
    } else {
        die 'invalid direction';
    }

}

sub are_connected {
    my ($p1, $p2, $d) = @_;


    # $d is the direction that moved from $p1, p1 always has that direction

    foreach my $p2_d (@{$P2A{ $p2 }}) {
        return 1 if $d eq $REVERSE_DIRECTIONS{$p2_d};
    }

    return 0;
}

sub main {

    $Data::Dumper::Sortkeys = 1;

    my $file_name = $ARGV[0];
    my $content = read_file($file_name);

    foreach my $pipe_id (sort keys %PIPES) {
        my @d = split //, $PIPES{$pipe_id};

        $P2H{$pipe_id} = { map { $_ => 1 } @d };
        $P2A{$pipe_id} = \@d;
    }

    my @field = get_field($content);

    $MAX_X = scalar(@{$field[0]})-1;
    $MAX_Y = scalar(@field)-1;

    my $s_x;
    my $s_y;

    LOOP: foreach my $x (0..$MAX_X) {
        foreach my $y (0..$MAX_Y) {
            if ($field[$y]->[$x] eq 'S') {
                $s_x = $x;
                $s_y = $y;
                last LOOP;
            }
        }
    }

    foreach my $pipe_id (sort keys %PIPES) {
        say "## $pipe_id";

        my $content = read_file($file_name);
        $content =~ s/S/$pipe_id/;
#        say $content;

        my @field = get_field($content);

        my %visited;

        my $cur_x = $s_x;
        my $cur_y = $s_y;

        my $is_valid_pipe = is_valid_pipe($s_x, $s_y, \@field);
        say $is_valid_pipe;

    }

#say $content;
#
#say $s_x;
#say $s_y;
#

}
main();
__END__
