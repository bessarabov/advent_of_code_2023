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

sub main {

    $Data::Dumper::Sortkeys = 1;

    my $answer = 0;

    my $file_name = $ARGV[0];
    my $content = read_file($file_name);


    say $answer;

}
main();
__END__
