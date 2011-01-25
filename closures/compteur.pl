#! /usr/bin/perl
use Modern::Perl;
use YAML;

sub compteur {
    state $counter = shift || 0;
    $counter++;
}

say compteur(3) for 1..5;
say compteur(3) for 1..5;

# /!\ pas de retour a 3 !!!
# voir compteur2.pl

