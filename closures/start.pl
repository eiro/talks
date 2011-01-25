#! /usr/bin/perl
use Modern::Perl;
use YAML;

# add est un générateur: il crée une closure
sub add {
    
    # start et step sont déclarés 
    # dans le générateur. pas dans la closure

    my ( $start, $step ) = @_;

    $start //= 1;
    $step  //= 1;
    $start -= $step;

    sub { $start += $step }
}

# génération d'une nouvelle closure
my $plus3 = add 4,3;

# appels de la closure
say $plus3->() for 1..3;

