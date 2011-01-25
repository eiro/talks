#! /usr/bin/perl
use Modern::Perl;
use YAML;

sub compteur {
    my ( $v ) = @_;
    state $counter = 0;

    $v
    ? $counter = $v
    : $counter++

}

compteur(3);
say compteur for 1..5;
say compteur(3) for 1..5;

