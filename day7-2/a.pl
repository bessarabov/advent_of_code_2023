#!/usr/bin/perl

use strict;
use warnings FATAL => 'all';
use feature 'say';
use utf8;
use open qw(:std :utf8);

use Test::More;
use Data::Dumper;

sub get_type {
    my ($cards_string) = @_;

    if ($cards_string =~ /^.{5}\z/) {
        my %cards;
        foreach my $card (split //, $cards_string) {
            $cards{$card}++;
        }

        my @values = sort { $a <=> $b } values %cards;
        if (grep { $_ == 5 } @values ) {
            return 'five_of_a_kind';
        } elsif (grep { $_ == 4 } @values ) {
            return 'four_of_a_kind';
        } elsif ( (grep { $_ == 3 } @values) && (grep { $_ == 2 } @values) ) {
            return 'full_house';
        } elsif (grep { $_ == 3 } @values ) {
            return 'three_of_a_kind';
        } elsif (join('', @values) =~ /2.*2/ ) {
            return 'two_pair';
        } elsif (grep { $_ == 2 } @values ) {
            return 'one_pair';
        } elsif (scalar(@values) == 5) {
            return 'high_card';
        } else {
            die "can't find out type";
        }

    } else {
        die;
    }

}

sub max_type {
    my ($one, $two) = @_;

    $one //= '';
    $two //= '';

    return 'five_of_a_kind' if ( ($one eq 'five_of_a_kind') or ($two eq 'five_of_a_kind') );
    return 'four_of_a_kind' if ( ($one eq 'four_of_a_kind') or ($two eq 'four_of_a_kind') );
    return 'full_house' if ( ($one eq 'full_house') or ($two eq 'full_house') );
    return 'three_of_a_kind' if ( ($one eq 'three_of_a_kind') or ($two eq 'three_of_a_kind') );
    return 'two_pair' if ( ($one eq 'two_pair') or ($two eq 'two_pair') );
    return 'one_pair' if ( ($one eq 'one_pair') or ($two eq 'one_pair') );
    return 'high_card' if ( ($one eq 'high_card') or ($two eq 'high_card') );

    die 'this should not happen';
}

sub get_type_j {
    my ($cards_string) = @_;

    if ($cards_string !~ /J/) {
        die;
    }

    if ($cards_string eq 'JJJJJ') {
        # 5 J's
        return 'five_of_a_kind';
    } elsif ($cards_string =~ 'J.*J.*J.*J') {
        # 4 J's - can create five_of_a_kind
        return 'five_of_a_kind';
    } elsif ($cards_string =~ 'J.*J.*J') {
        # 3 J's

        $cards_string =~ s/J/X/;
        $cards_string =~ s/J/Y/;
        $cards_string =~ s/J/Z/;

        my $type;

        foreach my $x (get_chars()) {
            foreach my $y (get_chars()) {
                foreach my $z (get_chars()) {
                    my ($new_cards_string) = $cards_string =~ s/X/$x/r;
                    $new_cards_string =~ s/Y/$y/;
                    $new_cards_string =~ s/Z/$z/;

                    my $tmp_type = get_type($new_cards_string);
                    $type = max_type($type, $tmp_type);
                }
            }
        }

        return $type;

    } elsif ($cards_string =~ 'J.*J') {
        # 2 J's

        $cards_string =~ s/J/X/;
        $cards_string =~ s/J/Y/;

        my $type;

        foreach my $x (get_chars()) {
            foreach my $y (get_chars()) {
                my ($new_cards_string) = $cards_string =~ s/X/$x/r;
                $new_cards_string =~ s/Y/$y/;

                my $tmp_type = get_type($new_cards_string);
                $type = max_type($type, $tmp_type);
            }
        }

        return $type;

    } elsif ($cards_string =~ 'J') {
        # 1 J's

        my $type;

        $cards_string =~ s/J/X/;
        foreach my $char (get_chars()) {
            my ($new_cards_string) = $cards_string =~ s/X/$char/r;
            my $tmp_type = get_type($new_cards_string);

            $type = max_type($type, $tmp_type);
        }

        return $type;
    }

    # X Y Z

    die 'this should not happen';
}

sub get_chars {
    my @chars = qw(A K Q T 9 8 7 6 5 4 3 2 J);
    return @chars;
}

sub my_compare {
    my ($one, $two) = @_;

    return 0 if $one eq $two;

    my @chars = qw(A K Q T 9 8 7 6 5 4 3 2 J);
    my %char2index;
    my $i = 0;
    foreach my $c (@chars) {
        $char2index{$c} = $i;
        $i++;
    }

    my @one = split //, $one;
    my @two = split //, $two;

    foreach (0..4) {
        my $index1 = $char2index{$one[$_]};
        my $index2 = $char2index{$two[$_]};

        next if $index1 == $index2;
        return $index2 <=> $index1;
    }

    die 'this should not happen';

}


sub main {

    my @hands;

    my $sum = 0;

    my $file_name = $ARGV[0];

    open(my $fh, '<', $file_name) or die "Could not open file '$file_name' $!";

    while (my $line = <$fh>) {
        chomp($line);

        if ($line =~ /^(.{5}) (\d+)\z/a) {

            my $cards_string = $1;
            my $bet = $2;

            my $type;
            if ($cards_string =~ /J/) {
                $type = get_type_j($cards_string);
            } else {
                $type = get_type($cards_string);
            }

            push @hands, {
                cards_string => $cards_string,
                bet => $bet,
                type => $type,
            };

        } else {
            die $line;
        }

    }

    close($fh);

    my @sorted = sort {
        ( ($a->{type} eq 'five_of_a_kind') <=> ($b->{type} eq 'five_of_a_kind') )
        || ( ($a->{type} eq 'four_of_a_kind') <=> ($b->{type} eq 'four_of_a_kind') )
        || ( ($a->{type} eq 'full_house') <=> ($b->{type} eq 'full_house') )
        || ( ($a->{type} eq 'three_of_a_kind') <=> ($b->{type} eq 'three_of_a_kind') )
        || ( ($a->{type} eq 'two_pair') <=> ($b->{type} eq 'two_pair') )
        || ( ($a->{type} eq 'one_pair') <=> ($b->{type} eq 'one_pair') )
        || ( ($a->{type} eq 'high_card') <=> ($b->{type} eq 'high_card') )
        || my_compare($a->{cards_string}, $b->{cards_string})
    } @hands;

    my $i = 1;
    foreach my $el (@sorted) {
        $el->{rank} = $i;
        $i++;
    }

    my $answer = 0;

    foreach my $el (@sorted) {
        $answer += $el->{rank} * $el->{bet};
    }

    say $answer;

}
main();
__END__
