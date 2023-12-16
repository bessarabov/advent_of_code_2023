#!/usr/bin/perl

use strict;
use warnings FATAL => 'all';
use feature 'say';
use utf8;
use open qw(:std :utf8);

use Test::More;
use Data::Dumper;
use Moment;

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

sub get_field {
    my ($content) = @_;

    my @field;

    foreach my $row (split /\n/, $content) {
        my @elements = split //, $row;
        push @field, \@elements;
    }

    return @field;
}

sub get_energized_count {
    my (@energized) = @_;


    my $sum = 0;
    foreach my $row (@energized) {
        foreach my $el (@{$row}) {
            if (($el // 0) > 0) {
                $sum++;
            }
        }
    }

    return $sum;
}

sub output_energized {
    my (@energized) = @_;

    foreach my $row (@energized) {
        foreach my $el (@{$row}) {
            print( (($el // 0) > 0) ? '#' : '.' );
        }

        say '';
    }
}

sub max {
    my (@el) = @_;

    my $max;

    foreach my $el (@el) {
        if (not defined $max) {
            $max = $el;
        } else {
            if ($el > $max) {
                $max = $el;
            }
        }
    }

    die 'no max' if not defined $max;

    return $max;
}

sub is_valid_beam {
    my ($beam, $max_x, $max_y) = @_;

    die if not defined $max_x;
    die if not defined $max_y;

    if (
        ($beam->{x} < 0)
        or ($beam->{y} < 0)
        or ($beam->{x} > $max_x)
        or ($beam->{y} > $max_y)
    ) {
        return 0;
    } else {
        return 1;
    }

}

sub get_answer_for_one_position {
    my ($field, $max_x, $max_y, $original_beam) = @_;

    my @field = @{$field};

    my @energized;

    my @was_here;

    my %beams = (
        1 => {
            is_moving => 1,
            x => $original_beam->{x},
            y => $original_beam->{y},
            d => $original_beam->{d},
        },
    );

    my $i = 0;
    while (1) {

        foreach my $beam_id (sort keys %beams) {
            my $beam = $beams{$beam_id};

            next if not $beam->{is_moving};

            if ($was_here[$beam->{y}]->[$beam->{x}]->{$beam->{d}}) {
                $beam->{is_moving} = 0;
                next;
            }

            $was_here[$beam->{y}]->[$beam->{x}]->{$beam->{d}} = 1;

            $energized[$beam->{y}]->[$beam->{x}]++;
            my $value = $field[$beam->{y}]->[$beam->{x}];

            if (
                ($value eq '.')
                or (($value eq '-') and (grep {$_ eq $beam->{d}} qw(r l)))
                or (($value eq '|') and (grep {$_ eq $beam->{d}} qw(u d)))
            ) {
                if ($beam->{d} eq 'u') {
                    $beam->{y}--;
                } elsif ($beam->{d} eq 'r') {
                    $beam->{x}++;
                } elsif ($beam->{d} eq 'd') {
                    $beam->{y}++;
                } elsif ($beam->{d} eq 'l') {
                    $beam->{x}--;
                } else {
                    die 'incorrect d';
                }
            } elsif ($value eq '-') {

                if ( ($beam->{d} eq 'u') or ($beam->{d} eq 'd') ) {

                    $beam->{x}--;
                    $beam->{d} = 'l';

                    my $new_beam = {
                        x => $beam->{x}+2,
                        y => $beam->{y},
                        d => 'r',
                        is_moving => 1,
                    };

                    if (is_valid_beam($new_beam, $max_x, $max_y)) {
                        my $new_beam_id = max(keys %beams) + 1;
                        $beams{$new_beam_id} = $new_beam;
                    }

                } else {
                    die;
                }

            } elsif ($value eq '|') {

                if ( ($beam->{d} eq 'r') or ($beam->{d} eq 'l') ) {

                    $beam->{y}--;
                    $beam->{d} = 'u';

                    my $new_beam = {
                        x => $beam->{x},
                        y => $beam->{y}+2,
                        d => 'd',
                        is_moving => 1,
                    };

                    if (is_valid_beam($new_beam, $max_x, $max_y)) {
                        my $new_beam_id = max(keys %beams) + 1;
                        $beams{$new_beam_id} = $new_beam;
                    }

                } else {
                    die;
                }


            } elsif ($value eq '/') {

                if ($beam->{d} eq 'u') {
                    $beam->{d} = 'r';
                    $beam->{x}++;
                } elsif ($beam->{d} eq 'r') {
                    $beam->{d} = 'u';
                    $beam->{y}--;
                } elsif ($beam->{d} eq 'd') {
                    $beam->{d} = 'l';
                    $beam->{x}--;
                } elsif ($beam->{d} eq 'l') {
                    $beam->{d} = 'd';
                    $beam->{y}++;
                } else {
                    die 'incorrect d';
                }

            } elsif ($value eq '\\') {

                if ($beam->{d} eq 'u') {
                    $beam->{d} = 'l';
                    $beam->{x}--;
                } elsif ($beam->{d} eq 'r') {
                    $beam->{d} = 'd';
                    $beam->{y}++;
                } elsif ($beam->{d} eq 'd') {
                    $beam->{d} = 'r';
                    $beam->{x}++;
                } elsif ($beam->{d} eq 'l') {
                    $beam->{d} = 'u';
                    $beam->{y}--;
                } else {
                    die 'incorrect d';
                }

            } else {
                die 'incorrect value';
            }

            if (not is_valid_beam($beam, $max_x, $max_y)) {
                $beam->{is_moving} = 0;
            }

        }

        my $at_least_one_is_moving = 0;

        foreach my $beam_id (sort keys %beams) {
            if ($beams{$beam_id}->{is_moving}) {
                $at_least_one_is_moving = 1;
            }
        }

        if ($at_least_one_is_moving == 0) {
            last;
        }

        $i++;
        die 'too many loops' if $i > 10_000;


#        say '';
#        output_energized(@energized);
#        my $sum = get_energized_count(@energized);
#        say $sum;
#        say '';
#
#        sleep 1;

    }

    #warn Dumper \@energized;

#    if (0) {
#        say '';
#        print $content;
#        say '';
#        output_energized(@energized);
#        say '';
#    }

    my $sum = get_energized_count(@energized);

    return $sum;
}

sub log_message {
    my ($msg) = @_;

    say sprintf "%s - %s",
        Moment->now()->get_iso_string(),
        $msg,
        ;

}

sub main {

    my $content = read_file($ARGV[0]);
    my @field = get_field($content);

    my $max_x = scalar(@{$field[0]})-1;
    my $max_y = scalar(@field)-1;

    my @answers;

    my $i = 0;

    # from top
    foreach my $x (0..$max_x) {
        $i++;
        my $answer = get_answer_for_one_position( \@field, $max_x, $max_y, { x => $x, y => 0, d => 'd' });
        push @answers, $answer;
        log_message('from top ' . $i);
    }
    log_message('from top done');

    # from bottom
    foreach my $x (0..$max_x) {
        $i++;
        my $answer = get_answer_for_one_position( \@field, $max_x, $max_y, { x => $x, y => $max_y, d => 'u' });
        push @answers, $answer;
        log_message('from bottom ' . $i);
    }
    log_message('from bottom done');

    # from left
    foreach my $y (0..$max_y) {
        $i++;
        my $answer = get_answer_for_one_position( \@field, $max_x, $max_y, { x => 0, y => $y, d => 'r' });
        push @answers, $answer;
        log_message('from left ' . $i);
    }
    log_message('from left done');

    # from right
    foreach my $y (0..$max_y) {
        $i++;
        my $answer = get_answer_for_one_position( \@field, $max_x, $max_y, { x => $max_x, y => $y, d => 'l' });
        push @answers, $answer;
        log_message('from right ' . $i);
    }
    log_message('from right done');

    say max(@answers);

}
main();
__END__
