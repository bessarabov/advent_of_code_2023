use strict;
use warnings;
use feature qw(say);

my $x = 7;

LABEL_asdf:
if ($x < 10) {
    goto LABEL_3;
}

LABEL_2:
say 'R';
exit;

LABEL_3:
say 'A';
exit;
