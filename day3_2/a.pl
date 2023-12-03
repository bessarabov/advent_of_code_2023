#!/usr/bin/perl

use strict;
use warnings FATAL => 'all';
use feature 'say';
use utf8;
use open qw(:std :utf8);

use Test::More;
use Data::Dumper;

sub get_arr {
    my ($file) = @_;

    my @arr;

    open(my $fh, '<', $file) or die "Could not open file '$file' $!";


    while (my $line = <$fh>) {
        chomp($line);
        my @row = split //, $line;
        push @arr, \@row;
    }

    close($fh);

    return @arr;
}

sub is_char_a_number {
    my ($char) = @_;

    die "a+1 $char" if length $char != 1;

    return $char =~ /^\d\z/a;
}

sub is_char_a_symbol {
    my ($char) = @_;

    die "a+2 $char" if length $char != 1;
    die "a+3 $char" if $char =~ /^\d\z/a;

    return 0 if $char eq '.';
    return 1;
}

sub is_char_a_gear_symbol {
    my ($char) = @_;

    die "b+2 $char" if length $char != 1;
    die "b+3 $char" if $char =~ /^\d\z/a;

    return 1 if $char eq '*';
    return 0;
}

sub number_has_symbols_around {
    my (%h) = @_;
#warn 'number_has_symbols_around';

    my @arr = @{delete $h{arr}};
    my $num_row = delete $h{num_row};
    my $num_start_col= delete $h{num_start_col};
    my $num_length = delete $h{num_length};

    die "a+4" if %h;

#    warn 'checking left';
    if (is_symbol_at(\@arr, $num_row, $num_start_col-1)) {
        # symbol to the left of number
        return 1;
    }

#    warn 'checking right';
    if (is_symbol_at(\@arr, $num_row, $num_start_col+$num_length)) {
        # symbol to the right of number
        return 1;
    }

    # above the number
#    warn 'checking above';
    foreach my $i ($num_start_col-1 .. $num_start_col+$num_length) {
        if (is_symbol_at(\@arr, $num_row-1, $i)) {
            return 1;
        }
    }

    # below the number
#    warn 'checking below';
    foreach my $i ($num_start_col-1 .. $num_start_col+$num_length) {
        if (is_symbol_at(\@arr, $num_row+1, $i)) {
            return 1;
        }
    }

    return 0;
}

sub get_gears {
    my (%h) = @_;

    my @arr = @{delete $h{arr}};
    my $num_row = delete $h{num_row};
    my $num_start_col= delete $h{num_start_col};
    my $num_length = delete $h{num_length};

    die "a+5" if %h;

    my @gears;

#    warn 'checking left';
    if (is_gear_symbol_at(\@arr, $num_row, $num_start_col-1)) {
        # symbol to the left of number
        push @gears, [$num_row, $num_start_col-1];
    }

#    warn 'checking right';
    if (is_gear_symbol_at(\@arr, $num_row, $num_start_col+$num_length)) {
        # symbol to the right of number
        push @gears, [$num_row, $num_start_col+$num_length];
    }

    # above the number
#    warn 'checking above';
    foreach my $i ($num_start_col-1 .. $num_start_col+$num_length) {
        if (is_gear_symbol_at(\@arr, $num_row-1, $i)) {
            push @gears, [$num_row-1, $i];
        }
    }

    # below the number
#    warn 'checking below';
    foreach my $i ($num_start_col-1 .. $num_start_col+$num_length) {
        if (is_gear_symbol_at(\@arr, $num_row+1, $i)) {
            push @gears, [$num_row+1, $i];
        }
    }

    return @gears;
}

sub is_symbol_at {
    my ($arr, $row, $col) = @_;

    return 0 if $row < 0;
    return 0 if $col < 0;

    my $full_rows_num = scalar @{$arr};
    return 0 if $row >= $full_rows_num;

    my $full_cols_num = scalar @{$arr->[0]};
    return 0 if $col >= $full_cols_num;

#warn Dumper {
#    row => $row,
#    col => $col,
#    char => $arr->[$row]->[$col]
#};

    if (is_char_a_symbol($arr->[$row]->[$col])) {
        return 1;
    } else {
        return 0;
    }

}

sub is_gear_symbol_at {
    my ($arr, $row, $col) = @_;

    return 0 if $row < 0;
    return 0 if $col < 0;

    my $full_rows_num = scalar @{$arr};
    return 0 if $row >= $full_rows_num;

    my $full_cols_num = scalar @{$arr->[0]};
    return 0 if $col >= $full_cols_num;

    if (is_char_a_gear_symbol($arr->[$row]->[$col])) {
        return 1;
    } else {
        return 0;
    }

}

sub main {

    my @numbers;

    my $file = 'input';
    #my $file = 'i';

    my @arr = get_arr($file);

#is_symbol_at(\@arr,10,0);
#exit 1;

    my $number = '';
    my $is_in_number = 0;
    my $num_row = -1;
    my $num_start_col = -1;
    my $num_length = 0;

    for (my $row_number = 0; $row_number < scalar @arr; $row_number++) {
        my @row = @{$arr[$row_number]};
        for (my $col_number = 0; $col_number < scalar @row; $col_number++) {
#            print $row[$col_number];

            if (is_char_a_number($row[$col_number])) {
                $number .= $row[$col_number];
                $num_length++;
                if (!$is_in_number) {
                    $is_in_number = 1;

                    $num_row = $row_number;
                    $num_start_col = $col_number;
                }
            } else {
                if ($is_in_number) {

                    # number is over
                    #warn "Found $number";

                    if (number_has_symbols_around(
                        arr => \@arr,
                        num_row => $num_row,
                        num_start_col => $num_start_col,
                        num_length => $num_length,
                    )) {

                        my @gears = get_gears(
                            arr => \@arr,
                            num_row => $num_row,
                            num_start_col => $num_start_col,
                            num_length => $num_length,
                        );

                        if (@gears) {
                            push @numbers, {
                                number => $number,
                                gears => \@gears,
                            };
                        }

                    }

                    $number = '';
                    $is_in_number = 0;
                    $num_row = -1;
                    $num_start_col = -1;
                    $num_length = 0;
                } else {
                    # just symbol or '.' after other symbor or '.'
                    # not interesting, doing nothing;
                }
            }

        }
#        say '';
    }

#          {
#            'number' => '755',
#            'gears' => [
#                         8,
#                         5
#                       ]
#          },

    #warn Dumper \@numbers;

    my %gears;

    foreach my $el (@numbers) {
        foreach my $g (@{$el->{gears}}) {
            my $gear_id = $g->[0] . '_' . $g->[1];
            push @{$gears{$gear_id}}, $el->{number};
        }
    }

    #warn Dumper \%gears;
    my $sum = 0;

    foreach my $gear_id (sort keys %gears) {
        if (scalar @{$gears{$gear_id}} == 2) {
            my $gear_ratio = $gears{$gear_id}->[0] * $gears{$gear_id}->[1];
            $sum += $gear_ratio;
        }
        #say $gear_id . ' ' . scalar @{$gears{$gear_id}};
        #say scalar @{$gears{$gear_id}};
    }

    #is($sum, 467835);
    say $sum;


}
main();
__END__
