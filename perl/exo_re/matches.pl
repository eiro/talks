#! /usr/bin/perl
use Modern::Perl;
use YAML;

$_="
    Passenger: Doe / John
    Fly AF3453 From SXB To ZZF
";

m{
^ \s+ Passenger: \s+ Doe \s+ / \s+ John \s*
^ \s+ Fly \s+ AF3453 \s+ From \s+ SXB \s+ To \s+ MRS \s*
}xms and say $&;

m{  Passenger: \s+ (?<lastname> .* ) \s/\s (?<firstname> \V+ ) $
\s+ Fly # (?<fly>) From (?<from> MRS | TFS | TFN ) To (?<to> MRS | TFS | TFN )
}smx and say Dump \%+;

m{ (?(DEFINE)
	(?<name> .*? )
	(?<operator>  AF | AB | RA )
	(?<flynumber> \d{4} )
	(?<fly> (?&operator)(?&flynumber) )
	(?<airport> MRS | TFS | TFN | SXB
	            | [A-Z]{3,} (?{ print "unknown airport" })
	)
    ) 

    \s+ Passenger: \s+ (?<lastname>(?&name)) \s+ / \s+ (?<firstname>(?&name)) \s* $
    \s+ Fly \s+ (?<fly>(?&fly)) \s+ From \s+ (?<from>(?&airport)) \s+ To \s+ (?<to>(?&airport)) \s* $

}xms and say Dump \%+;
