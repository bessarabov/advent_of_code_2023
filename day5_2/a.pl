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

die "no data in get_location()" if not defined $data;

	my $prev_name;

	while (my $map_name = get_map_name($prev_name)) {
        #print "### map $map_name ";
		$prev_name = $map_name;

		my $destination;

		foreach my $el (@{$data->{maps}->{$map_name}}) {
			$destination = get_destination($seed, $el);
			last if $destination;
		}

		if (not defined $destination) {
            #print 'NOT FOUND, using ';
			$destination = $seed;
		}

		#warn $destination;

		$seed = $destination;

        #print $seed;
        #say '';
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

sub get_layers {
    my ($data) = @_;

    my @layers;

	my $prev_name;

	while (my $map_name = get_map_name($prev_name)) {

        my @one_layer;
        my %tmp;
        #print "### map $map_name ";
		$prev_name = $map_name;

#          'maps' => {
#          #                      'seed-to-soil' => [
#          #                                          {
#          #                                            'destination_start' => '50',
#          #                                            'range_length' => '2',
#          #                                            'source_start' => '98'
#          #                                          },
#
		foreach my $el (@{$data->{maps}->{$map_name}}) {
            die "Unexpected source_start" if exists $tmp{$el->{source_start}};
            my $offcet = $el->{destination_start} - $el->{source_start};
#            if ($offcet =~ /^\d/a) {
#                $offcet = "+$offcet";
#            }
            $tmp{$el->{source_start}} = {
                start => $el->{source_start},
                end => $el->{source_start} + $el->{range_length} - 1,
                function => $offcet,
                raw => $el,
            };
		}

        foreach my $start (sort { $a <=> $b } keys %tmp) {
            push @one_layer, [ $start, $tmp{$start}->{end}, $tmp{$start}->{function}];
        }

        # fill empty
        if ($one_layer[0][0] != 0) {
            unshift @one_layer, [0, $one_layer[0][0]-1, 'as-is'];
        }

        push @layers, \@one_layer;

        #say '';
    }


    return @layers;
}

sub output_layers {
    my (@layers) = @_;

    foreach my $one_layer (@layers) {
        my @v;
        foreach my $l (@{$one_layer}) {
            push @v, @{$l};
        }
        say join "\t", @v;
    }
}

sub is_valid_seed {
    my ($maybe_a_seed, $data) = @_;

die "no data in is_valid_seed()" if not defined $data;

    #warn "is_valid_seed";

    foreach my $seed_data (@{$data->{seeds}}) {
        if ($maybe_a_seed >= $seed_data->{start} && $maybe_a_seed < $seed_data->{start}+$seed_data->{length}) {
            return 1;
        }
    }

#warn Dumper $maybe_a_seed;
#warn Dumper $data->{seeds};

    return 0;
}

sub get_plus_minus {
    my ($p, $count) = @_;

die 'no count in get_plus_minus' if not defined $count;

    my @arr;
    foreach ($p - $count .. $p + $count) {
        push @arr, $_;
    }
    return @arr;
}

sub main {

    $Data::Dumper::Sortkeys = 1;

    my $file_name = $ARGV[0];
    say sprintf '# File name %s', $file_name;

    my $data = get_data($file_name);
    #warn Dumper $data;

    if ($file_name eq 'i') {
        is(get_destination(98, { 'destination_start' => '50', 'range_length' => '2', 'source_start' => '98' }), 50);
        is(get_destination(99, { 'destination_start' => '50', 'range_length' => '2', 'source_start' => '98' }), 51);

        is(get_location(79, $data), 82); # for test data 5-1
        is(get_location(14, $data), 43); # for test data 5-1
        is(get_location(55, $data), 86); # for test data 5-1
        is(get_location(13, $data), 35); # for test data 5-1

        is(get_location(82, $data), 46); # for test data 5-2
    }

    my $check = 0;

    if ($check) {
        my @seeds_to_check = qw(
            0
            79
            82
            1600060423
            1603960466
            2243431569
            2243490990
            2243500990
            2243500992
            2243501080
            2244111481
            2244120481
            2244121381
            2244121471
            2243422641
            2243428207
            2243425388
            2243426820
            2243426693
        );

        say '';
        my $min;

        foreach my $sss (@seeds_to_check) {
            #foreach my $s (get_plus_minus($sss, 100_000)) {
            foreach my $s ($sss) {
                my $l = get_location($s, $data);

                if (is_valid_seed($s, $data)) {
                    $min = min($min, $l);
                }

                say sprintf "seed %s %s - answer: %s",
                    $s,
                    (is_valid_seed($s, $data) ? 'valid' : 'NOT VALID'),
                    $l,

            }

        }

        say '';
        say 'min: ' . $min;
        say '';

        exit;
    }


    my @layers = get_layers($data);
    #output_layers(@layers);

    my %uniq_offcets;
    my %uniq_points;

    foreach my $one_layer (@layers) {
        foreach my $l (@{$one_layer}) {
            $uniq_points{$l->[0]} = 1;
            $uniq_points{$l->[1]} = 1;

            next if $l->[2] eq 'as-is';
            $uniq_points{$l->[2]} = 1;
#            $uniq_offcets{$l->[2]} = 1;
        }
    }

    my %points_1;

    my %us;
#    foreach my $p (sort keys %uniq_points) {
#
#        $points_1{$p} = 1;
#
#        foreach my $o (sort keys %uniq_offcets) {
#            $points_1{$p+$o} = 1;
#            $points_1{$p-$o} = 1;
#        }
#
#        foreach my $tmp (get_plus_minus($p)) {
#            if (is_valid_seed($tmp, $data)) {
#                $us{$tmp} = 1;
#            }
#        }

#        foreach my $o (sort keys %uniq_points) {
#            my $maybe_a_seed_1 = $p + $o;
#            my $maybe_a_seed_2 = $p - $o;
#
#            foreach my $tmp (get_plus_minus($maybe_a_seed_1)) {
#                if (is_valid_seed($tmp, $data)) {
#                    $us{$tmp} = 1;
#                }
#            }
#
#            foreach my $tmp (get_plus_minus($maybe_a_seed_2)) {
#                if (is_valid_seed($tmp, $data)) {
#                    $us{$tmp} = 1;
#                }
#            }
#        }
#    }
#
#    say 'point 1 count: ' . scalar keys %points_1;
#
#    my %points_2;
#    foreach my $s (sort keys %points_1) {
#        $points_2{$s} = 1;
#        foreach my $tmp (get_plus_minus($s)) {
#            $points_2{$tmp} = 1;
#        }
#    }
#
#    say 'point 2 count: ' . scalar keys %points_2;


    my %points_2;
    foreach my $el (@{$data->{seeds}}) {

        my $minimum = $el->{start} - 1000;
        my $maximum = $el->{start} + $el->{length} + 1000;

        foreach (1..100_000) {
            my $x = $minimum + int(rand($maximum - $minimum));
            $points_2{$x} = 1;
        }
    }

    my @seeds;

    foreach my $s (sort keys %points_2) {
        if (is_valid_seed($s, $data)) {
            push @seeds, $s;
        }
    }

    say 'Seeds count: ' . scalar @seeds;



	my $min;
    my $seed_for_min;

    my $i;
    foreach my $seed (@seeds) {
        #say "## Seed $seed";
        my $location = get_location($seed, $data);

        if (not defined $min) {
            $min = $location;
            $seed_for_min = $seed;
        } else {
            if ($location < $min) {
                $min = $location;
                $seed_for_min = $seed;
            }
        }

        $i++;
        if ($i % 10_000 == 0) {
            say sprintf "%s %s min: %s (for seed %s)",
                Moment->now()->get_iso_string(),
                $i,
                ($min // 'undef'),
                ($seed_for_min // 'undef'),
                ;
        }
    }

	die 'a+3 min is undef' if not defined $min;

	say '-'x78;
	say 'min location: ' . $min;
    say 'this location is for seed: ' . $seed_for_min;
	say '-'x78;

    done_testing();

}
main();
__END__
