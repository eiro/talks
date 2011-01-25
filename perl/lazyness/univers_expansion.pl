#! /usr/bin/perl
use Modern::Perl;
use LookAndSay ':all';

my $classic_conway = look_and_say 1;

# say $classic_conway->() for 1..6;

my @univers_expansion =
map { length $classic_conway->() } 1..10;
say for @univers_expansion;
