#! /usr/bin/perl
use Modern::Perl;
use YAML;
use List::AllUtils qw/ sum /;

sub make_fib {
    my $x = shift;
    sub {
	push @$x, sum @$x;
	shift @$x;
    }
}

my @seq = map { make_fib $_ }
( [1,1]
, [2,4]
, [2,16]
);

for (1..15) {
    say join "\t"
    , map { $_->() } @seq 
}
