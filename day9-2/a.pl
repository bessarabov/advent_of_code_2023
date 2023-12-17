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

sub get_next_value {
    my (@arr) = @_;

    my @last_elements_in_arr;
    push @last_elements_in_arr, $arr[-1];

    my $i = 0;
    while (!are_all_the_same(@arr)) {
        @arr = get_new_seq(@arr);
        push @last_elements_in_arr, $arr[-1];

        $i++;
        die 'too deep' if $i > 10_000;
    }

    my $s = 0;
    foreach my $el (@last_elements_in_arr) {
        $s += $el;
    }

    return $s;

}

sub get_new_seq {
    my (@arr) = @_;

    my @new;

    for (my $i = 0; $i < scalar(@arr) - 1; $i++)  {
        push @new, $arr[$i+1] - $arr[$i];
    }

    return @new;
}

sub is_all_zeros {
    my (@arr) = @_;

    foreach my $el (@arr) {
        return 0 if $el != 0;
    }

    return 1;
}

sub are_all_the_same {
    my (@arr) = @_;

    die 'empty arr' if scalar(@arr) == 0;

    my $first = $arr[0];

    foreach my $el (@arr) {
        return 0 if $el != $first;
    }

    return 1;
}



sub main {

    $Data::Dumper::Sortkeys = 1;

    my $answer = 0;

    my $file_name = $ARGV[0];
    my $content = read_file($file_name);

    foreach my $line (split /\n/, $content) {
#next if $line =~ /^0/;
        my @elements = split /\s+/, $line;

        my $value = get_next_value(reverse @elements);
        $answer += $value;
#die;
    }

    say $answer;

}
main();
__END__
