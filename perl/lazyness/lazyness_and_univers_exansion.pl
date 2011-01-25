#! /usr/bin/perl
use Modern::Perl;
use LookAndSay ':all';
use Lazyness ':all';

sub length_of { fold mapM { length } shift }

my @univers_expansion = length_of take 20, look_and_say 1;

sub les_trois_dans_les_n_premiers {
    my ( $n, $seed ) = @_;
    filter { /3/ } take $n, look_and_say $seed;
}

sub les_n_premiers_qui_contiennent_des_trois {
    my ( $n, $seed ) = @_;
    take $n, filter { /3/ } look_and_say $seed 
}

say for fold take 20, look_and_say 1;
say for length_of les_n_premiers_qui_contiennent_des_trois 2, 1;
