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

sub get_hash_value {
    my ($str) = @_;

    my $i = 0;
    foreach my $char (split //, $str) {
        $i += ord($char);
        $i *= 17;
        $i = $i % 256;
    }

    return $i;
}

sub add_or_replace_focal {
    my ($box, $label, $focal) = @_;

    my $replaced = 0;
    foreach my $el (@{$box}) {
        if ($el->{label} eq $label) {
            $el->{focal} = $focal;
            $replaced = 1;
            last;
        }
    }

    if (!$replaced) {
        push @{$box}, {
            label => $label,
            focal => $focal,
        };
    }

    return $box;
}

sub remove {
    my ($box, $label, $focal) = @_;
    my @new_box;

    foreach my $el (@{$box}) {
        if ($el->{label} ne $label) {
            push @new_box, $el;
        }
    }

    return \@new_box;
}

sub main {

    my $file_name = $ARGV[0];
    my $content = read_file($file_name);
    chomp($content);

    my @elements = split /,/, $content;

    my %boxes;

    foreach my $el (@elements) {
        if ($el =~ /^([^=-]+)=([1-9])\z/) {
            my $label = $1;
            my $focal = $2;

            my $box_id = get_hash_value($label);

            $boxes{$box_id} = add_or_replace_focal($boxes{$box_id}, $label, $focal);

        } elsif ($el =~ /^([^=-]+)-\z/) {
            my $label = $1;

            my $box_id = get_hash_value($label);

            $boxes{$box_id} = remove($boxes{$box_id}, $label);

        } else {
            die $el;
        }
    }

    my $total = 0;

    foreach my $box_id (sort keys %boxes) {
        my $i = 1;
        foreach my $el (@{$boxes{$box_id}}) {

            my $result = ($box_id+1) * $i * $el->{focal};
            $total += $result;

            $i++;
        }
    }

    say $total;


}
main();
__END__
