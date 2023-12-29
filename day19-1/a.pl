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

sub write_file {
    my ($file_name, $content) = @_;

    open(my $fh, '>', $file_name) or die "Could not open file '$file_name' $!";

    print $fh $content;

    close($fh);
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

sub get_value_from_part {
    my ($part) = @_;

    my $value = 0;

    $part =~ s/{//;
    $part =~ s/}//;

    my @elements = split /,/, $part;
    foreach my $el (@elements) {
        if ($el =~ /^\w=(\d+)\z/) {
            $value += $1;
        } else {
            die 'cant parse part';
        }
    }

    return $value;
}

sub generate_file {
    my ($file_name, $workflows) = @_;

	my $content = '';

	$content .= '#!/usr/bin/perl

use strict;
use warnings;
use feature qw(say);

my $part = $ARGV[0];

$part =~ s/{//;
$part =~ s/}//;

my $x;
my $m;
my $a;
my $s;

my @elements = split /,/, $part;
foreach my $el (@elements) {
	if ($el =~ /^x=(\d+)\z/) {
		$x = $1;
	} elsif ($el =~ /^m=(\d+)\z/) {
		$m = $1;
	} elsif ($el =~ /^a=(\d+)\z/) {
		$a = $1;
	} elsif ($el =~ /^s=(\d+)\z/) {
		$s = $1;
	} else {
		die "cant parse part";
	}
}

goto LABEL_in;

';

	foreach my $w (@{$workflows}) {
		my $label;
		my $commands;
		if ($w =~ /^(\w+)\{(.*)\}\z/) {
			$label = $1;
			$commands = $2;
		} else {
			die 'invalid line' . $w;
		}
		$content .= "LABEL_$label:\n";
		$content .= "# $commands\n";

		foreach my $command (split /,/, $commands) {
			if ($command =~ /^([xmas])([><])(\d+):(\w+)\z/) {
				my $var = $1;
				my $op = $2;
				my $number = $3;
				my $label = $4;

				if (
					($label eq 'A')
					or ($label eq 'R')
				) {

				$content .= "if ( \$$var $op $number ) {
	say '$label';
	exit;
}
";

				} else {

				$content .= "if ( \$$var $op $number ) {
	goto LABEL_$label;
}
";

				}

			} elsif ($command eq 'A') {
				$content .= "say 'A';\n";
				$content .= "exit;\n";
			} elsif ($command eq 'R') {
				$content .= "say 'R';\n";
				$content .= "exit;\n";
			} else {
				$content .= "goto LABEL_$command;\n";
			}
		}

		$content .= "\n";
	}

	write_file($file_name, $content);
	`chmod a+x $file_name`;
}

sub main {

    my $file_name = $ARGV[0];
    my $content = read_file($file_name);

    my @workflows;
    my @parts;

    foreach my $line (split /\n/, $content) {
        if ($line =~ /^\w/) {
            push @workflows, $line;
        } elsif ($line =~ /^\s*\z/) {
            # emtpy line
        } elsif ($line =~ /^{/) {
            push @parts, $line;
        }
    }

    generate_file($file_name . '.pl', \@workflows);

    my $sum = 0;

    foreach my $part (@parts) {
        my $cmd = qq(./${file_name}.pl "$part");
        my $output = `$cmd`;
        chomp($output);
say $output;
        if ($output eq 'A') {
            $sum += get_value_from_part($part);
        }
    }

    say $sum;

}
main();
__END__
