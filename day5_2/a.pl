#!/usr/bin/perl

use strict;
use warnings FATAL => 'all';
use feature 'say';
use utf8;
use open qw(:std :utf8);

use Test::More;
use Data::Dumper;
use Moment;

sub get_content {
    my ($file_name) = @_;

    my $content = '';

    open(my $fh, '<', $file_name) or die "Could not open file '$file_name' $!";

    while (my $line = <$fh>) {
        $content .= $line;
    }

    close($fh);

    return $content;
}

sub get_data {
    my ($file_name) = @_;

    my %h;

    my $content = get_content($file_name);

    my $is_in_map = 0;
    my $map_name = '';

    foreach my $line (split /\n/, $content) {
        if ($line =~ /^seeds: (.*)/) {
            say $line;
            my @values = map { $_+0 } split /\s+/, $1;

            die "Incorrect number of seeds in input data" if scalar(@values) % 2 != 0;
            while (@values) {
                my $start = shift @values;
                my $length = shift @values;

                push @{$h{seeds}}, {
                    start => $start,
                    length => $length,
                };
            }

        } elsif ($line =~ /^(.*?) map:\z/) {
            $is_in_map = 1;
            $map_name = $1;
        } elsif ($line =~ /^(\d+)\s+(\d+)\s+(\d+)\z/a) {
            # three numbers: the destination range start, the source range start, and the range length.
            # * a soil number (the destination)
            # * seed number (the source)
            push @{$h{maps}->{$map_name}}, {
                destination_start => $1,
                source_start => $2,
                range_length => $3,
            };
        } elsif ($line =~ /^\z/) {
            $is_in_map = 0;
            $map_name = '';
        } else {
            die "a+1 $line";
        }
    }

    return \%h;
}

sub get_location {
    my ($seed, $data) = @_;

	my $prev_name;

	while (my $map_name = get_map_name($prev_name)) {
#say "## map $map_name";
		$prev_name = $map_name;

		my $destination;

		foreach my $el (@{$data->{maps}->{$map_name}}) {
			$destination = get_destination($seed, $el);
			last if $destination;
		}

		if (not defined $destination) {
			$destination = $seed;
		}

		#warn $destination;

		$seed = $destination;
	}

	return $seed;
}

sub get_destination {
	my ($seed, $el) = @_;

	my $destination;

	# * a soil number (the destination)
	# * seed number (the source)
	if (
		($seed >= $el->{source_start})
		&& ($seed <= $el->{source_start} + $el->{range_length})
	) {
		my $offcet = $seed - $el->{source_start};
		$destination = $el->{destination_start} + $offcet;
	}

	return $destination;
}

sub get_map_name {
	my ($prev_name, $data) = @_;

    return 'seed-to-soil' if not defined $prev_name;

    return 'soil-to-fertilizer' if $prev_name eq 'seed-to-soil';
    return 'fertilizer-to-water' if $prev_name eq 'soil-to-fertilizer';
    return 'water-to-light' if $prev_name eq 'fertilizer-to-water';
    return 'light-to-temperature' if $prev_name eq 'water-to-light';
    return 'temperature-to-humidity' if $prev_name eq 'light-to-temperature';
    return 'humidity-to-location' if $prev_name eq 'temperature-to-humidity';

    return undef;
}

sub min {
	my ($one, $two) = @_;

	return $two if not defined $one;

	return $one < $two ? $one : $two;
}

sub main {

    $Data::Dumper::Sortkeys = 1;

is(get_destination(98, { 'destination_start' => '50', 'range_length' => '2', 'source_start' => '98' }), 50);
is(get_destination(99, { 'destination_start' => '50', 'range_length' => '2', 'source_start' => '98' }), 51);



    my $data = get_data($ARGV[0]);

    warn Dumper $data;

#$VAR1 = {
#          'maps' => {
#                      'seed-to-soil' => [
#                                          {
#                                            'destination_start' => '50',
#                                            'range_length' => '2',
#                                            'source_start' => '98'
#                                          },

	my $min;

#          'seeds' => [
#                       {
#                         'length' => 14,
#                         'start' => 79
#                       },
#                       {
#                         'length' => 13,
#                         'start' => 55
#                       }
#                     ]

    my $seeds_count = 0;
    foreach my $seed_data (@{$data->{seeds}}) {
        $seeds_count += 1;
        $seeds_count += $seed_data->{length};
    }

    say 'Seeds count: ' . $seeds_count;

    my $i;
    foreach my $seed_data (@{$data->{seeds}}) {
        foreach my $seed ($seed_data->{start} .. $seed_data->{start}+$seed_data->{length}) {
            my $location = get_location($seed, $data);
            $min = min($min, $location);
            $i++;
            say (Moment->now()->get_iso_string() . " $i, min " . ($min // 'undef')) if $i % 100_000 == 0;
        }
    }

	die 'a+3 min is undef' if not defined $min;

	say '-'x78;
	say $min;

}
main();
__END__
