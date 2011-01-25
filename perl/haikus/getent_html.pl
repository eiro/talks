#! /usr/bin/perl
use Modern::Perl;
use YAML;
my @fields = qw/ login passwd uid gid gecos home shell  /;
my @F;

print "<html><body><table>"
, map( {"<th>$_</th>"}  @fields )
, map( { my %user;
	chomp;
	@user{@fields} = split ':';
	if ( $user{login} eq "mc" ) { map { "<td>$_</td>" } @user{@fields} }
	else { () }
    } qx/getent passwd mc/ ) 
, "</table></body></html>";
