getent passwd mc | perl -F: -lanE '
    BEGIN {
	@fields = qw/ login passwd uid gid gecos /;
	print "<html><body><table>"
	, map {  "<th>$_</th>" }  @fields 
    }
    
    @user{@fields} = @F;

    if ( ($user{uid} > 1000)
	&& ($user{gecos})
    ) { print map { "<td>$_</td>" } @F }

    END { print "</table></body></html>" }
'
