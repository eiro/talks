#! /usr/bin/perl
use Modern::Perl;
use YAML;
use List::AllUtils qw/ sum /;

sub fibonacci {
    state $x = [1,1];
    push @$x, sum @$x;
    # [1,1, 1 + 1] => [1, 1, 2]
    shift @$x;
    # [1,2]
}

say fibonacci for 1..15;

for (1..15)
