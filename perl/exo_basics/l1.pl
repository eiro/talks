#! /usr/bin/perl
use Modern::Perl;
use YAML;

my %pkg = map {
    open my $module,$_ or die "$! opening $_";
    $_ => [
	map
	{
	    if ( /(?: use | require ) \s+  ([^\s;]+ ) /x ) {
		$1 ~~ [qw/ strict warnings /] ? () : $1  
	    } else { () }
	}
	<$module>
    ]
} </home/mc/src/koha_biblibre/C4/*.pm>;

say Dump \%pkg;
