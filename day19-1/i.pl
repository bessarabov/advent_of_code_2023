#!/usr/bin/perl

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

LABEL_px:
# a<2006:qkq,m>2090:A,rfg
if ( $a < 2006 ) {
	goto LABEL_qkq;
}
if ( $m > 2090 ) {
	say 'A';
	exit;
}
goto LABEL_rfg;

LABEL_pv:
# a>1716:R,A
if ( $a > 1716 ) {
	say 'R';
	exit;
}
say 'A';
exit;

LABEL_lnx:
# m>1548:A,A
if ( $m > 1548 ) {
	say 'A';
	exit;
}
say 'A';
exit;

LABEL_rfg:
# s<537:gd,x>2440:R,A
if ( $s < 537 ) {
	goto LABEL_gd;
}
if ( $x > 2440 ) {
	say 'R';
	exit;
}
say 'A';
exit;

LABEL_qs:
# s>3448:A,lnx
if ( $s > 3448 ) {
	say 'A';
	exit;
}
goto LABEL_lnx;

LABEL_qkq:
# x<1416:A,crn
if ( $x < 1416 ) {
	say 'A';
	exit;
}
goto LABEL_crn;

LABEL_crn:
# x>2662:A,R
if ( $x > 2662 ) {
	say 'A';
	exit;
}
say 'R';
exit;

LABEL_in:
# s<1351:px,qqz
if ( $s < 1351 ) {
	goto LABEL_px;
}
goto LABEL_qqz;

LABEL_qqz:
# s>2770:qs,m<1801:hdj,R
if ( $s > 2770 ) {
	goto LABEL_qs;
}
if ( $m < 1801 ) {
	goto LABEL_hdj;
}
say 'R';
exit;

LABEL_gd:
# a>3333:R,R
if ( $a > 3333 ) {
	say 'R';
	exit;
}
say 'R';
exit;

LABEL_hdj:
# m>838:A,pv
if ( $m > 838 ) {
	say 'A';
	exit;
}
goto LABEL_pv;

