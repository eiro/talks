#!/usr/bin/perl
use Modern::Perl;
use YAML;
use C4::Context;
use Devel::DumpSizes qw/dump_sizes/;

my @dates; my $i=0;
my $grammar = qr{
    ^
    (?:
	(?: NODATE |PAS \s DE \s DATE ) 
	| (?&date)*
    ) 
    (?<message> .* )

    (?(DEFINE)
	(?<date>
	    (\d{4})   (?{ $dates[$i]   {year}  = $^N })
	    - (\d{2}) (?{ $dates[$i]   {month} = $^N })
	    - (\d{2}) (?{ $dates[$i++] {day}   = $^N })
	    \s
	)+
    )
}x;


for
( "NODATE toto again"
, "PAS DE DATE toto again"
, "2314-23-34 2341-34-23 toto again"
) {
    if ( /$grammar/ ) { say Dump \@dates }
    else { say "grammar failed for $_" }
}

dump_sizes('sssx');




