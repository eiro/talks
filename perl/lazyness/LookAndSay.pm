package LookAndSay;
use Modern::Perl;
use parent 'Exporter';
our @EXPORT_OK = qw/ say_me look_and_say /;
our %EXPORT_TAGS = ( all => \@EXPORT_OK );

sub say_me {
    s/  ( (.)  # a symbol $2
	  \2*  # that can be repeated in $1 
	)
    /length($1).$2/gex
}

sub look_and_say {
    my ( $look ) = @_;
    sub {
	my $r = $look;
	say_me for $look;
	$r;
    }
}

1;
