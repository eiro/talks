#! /usr/bin/perl
use Modern::Perl;
use YAML;

sub mon_parser {
    state $grammar = qr{
	(\d+)
	# plus plein de trucs super compliqués
    }x;
    
    my $content = shift;
    $grammar ~~ $content;
}

for (<>) {
    say Dump
    { line   => $_
    , values => [parser $_]
    }
}
