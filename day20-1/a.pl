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

sub get_modules {
    my ($content) = @_;

# * Flip-flop modules (prefix %) are either on or off; they are initially off.
# * Conjunction modules (prefix &)
#       initially default to remembering a low pulse

    my %h;

    my %c_inputs;
    my %from_to;


    foreach my $line (split /\n/, $content) {
        if ($line =~ /^%(\w+) -> (.+)\z/) {
            my @next = split(/, /, $2);
            $h{$1} = {
                value => !1,
                type => 'f', # flip
                next => \@next,
            };
            foreach my $n (@next) {
                $from_to{$1}->{$n} = 1;
            }
        } elsif ($line =~ /^&(\w+) -> (.+)\z/) {
            my @next = split(/, /, $2);
            $h{$1} = {
                most_recent => {},
                type => 'c', # conjunction
                next => \@next,
            };
            $c_inputs{$1} = {};
            foreach my $n (@next) {
                $from_to{$1}->{$n} = 1;
            }
        } elsif ($line =~ /^(broadcaster) -> (.+)\z/) {
            my @next = split(/, /, $2);
            $h{$1} = {
                type => 'b',
                next => \@next,
            };
            foreach my $n (@next) {
                $from_to{$1}->{$n} = 1;
            }
        } else {
            die 'invalid line';
        }
    }

    my @c_inputs = sort keys %c_inputs;

    foreach my $c (@c_inputs) {
        foreach my $from (sort keys %from_to) {
            foreach my $to (sort keys %{$from_to{$from}}) {
                if ($to eq $c) {
                    $c_inputs{$c}->{$from} = 1;
                }
            }
        }
    }

    foreach my $c (@c_inputs) {
        foreach my $input (sort keys %{$c_inputs{$c}}) {
            $h{$c}->{most_recent}->{$input} = 'low';
        }
    };

    return %h;
}

sub main {

    my $file_name = $ARGV[0];
    my $content = read_file($file_name);

    my %modules = get_modules($content);
    my @pulses;

    my $low_count = 0;
    my $high_count = 0;


foreach (1..1000) {

    push @pulses, { from => 'button', to => 'broadcaster', what => 'low' };

    my $i = 0;
    while (@pulses) {
        my $current = shift @pulses;
        say sprintf '%s -%s-> %s',
            $current->{from},
            $current->{what},
            $current->{to},
            ;

        if ($current->{what} eq 'low') {
            $low_count++;
        } elsif ($current->{what} eq 'high') {
            $high_count++;
        } else {
            die 'invalid what';
        }

        my $module = $modules{$current->{to}};

        next if not defined $module;

        if ($module->{type} eq 'b') {
            foreach my $n (@{$module->{next}}) {
                push @pulses, {
                    from => $current->{to},
                    to => $n,
                    what => $current->{what},
                };
            }
        } elsif ($module->{type} eq 'f') {
            if ($current->{what} eq 'high') {
                # If a flip-flop module receives a high pulse, it is ignored
                # and nothing happens.
            } elsif ($current->{what} eq 'low') {
                # However, if a flip-flop module receives a low pulse, it flips between on and
                # off. If it was off, it turns on and sends a high pulse. If it was on, it turns
                # off and sends a low pulse.
                my $new_what;
                if ($module->{value}) {
                    $new_what = 'low';
                } else {
                    $new_what = 'high';
                }

                foreach my $n (@{$module->{next}}) {
                    push @pulses, {
                        from => $current->{to},
                        to => $n,
                        what => $new_what,
                    };
                }

                $module->{value} = !$module->{value};
            } else {
                die 'invalid what';
            }
        } elsif ($module->{type} eq 'c') {
# When a pulse is received, the conjunction module first updates its memory for that input.
# Then, if it remembers high pulses for all inputs, it sends a low pulse;
# otherwise, it sends a high pulse.

            $module->{most_recent}->{$current->{from}} = $current->{what};

            my $new_what;
            if (join('', values %{$module->{most_recent}}) =~ /low/) {
                # has low pulse
                $new_what = 'high';
            } else {
                # only remeber high pulses
                $new_what = 'low';
            }


            foreach my $n (@{$module->{next}}) {
                push @pulses, {
                    from => $current->{to},
                    to => $n,
                    what => $new_what,
                };
            }

        } else {
            die 'invalid type';
        }


        #p $module;

        $i++;
        die 'too many loops' if $i > 10_000;
    }
}

    say '';
    say 'low:  ' . $low_count;
    say 'high: ' . $high_count;
    say '-'x78;
    say 'answer: ' . $low_count * $high_count;

}
main();
__END__
