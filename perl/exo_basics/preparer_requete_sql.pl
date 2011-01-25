#! /usr/bin/perl
use Modern::Perl;
use YAML;

# préparer une requete sql
my @fields = qw( firstname lastname birthdate );
 
my $query = do {
 
    my $values = join ',', ('?') x @fields;
    # nombre d'elements dans @fields: 3 
    # => my $values = join ',', ('?') x 3; 
    # => my $values = join ',', ('?','?','?');
    # => my $values = '?,?,?';
 
    local $" = ',';
    # le séparateur utilisé a l'interpolation des tableaux dans les chaines est ','
    # donc "@fields" == 'firstname,lastname,birthdate'
 
    "insert into foo (@fields) values ($values)";
 
}
