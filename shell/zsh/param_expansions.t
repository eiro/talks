#! /usr/bin/perl
use Modern::Perl;
# use Test::More;

for my $test
( [ '${foo#*:}'   , sub { s/^.*?:// }     , "x:1000:1000:Marc Chantreux,,,:/home/mc:/bin/zsh"  ]
, [ '${foo#*:*:}' , sub { s/^.*?:.*?:// } , "1000:1000:Marc Chantreux,,,:/home/mc:/bin/zsh"    ]
, [ '${foo##*:}'  , sub { s/^.*:// }      , "/bin/zsh"  ]
, [ '${foo#*:}'   , sub { s/^.*?:// }     , "x:1000:1000:Marc Chantreux,,,:/home/mc:/bin/zsh"  ]
, [ '${foo#*:}', sub { s/^.*?:// } , "x:1000:1000:Marc Chantreux,,,:/home/mc:/bin/zsh"  ]
) {
    my ( $expansion, $perl_alike, $expected ) = @$test;
    $ENV{foo} = "mc:x:1000:1000:Marc Chantreux,,,:/home/mc:/bin/zsh";
    chomp ( my $got = `$expansion` );
    $perl_alike->() for $ENV{foo};
    is( $got, $expec	ZZ)


    my $got = "mc:x:1000:1000:Marc Chantreux,,,:/home/mc:/bin/zsh";

    my 
}


show;
$ENV{SHELL} = '/bin/zsh';
show;

# export 
# $ENV{foo} = `getent passwd mc`;
# say "$"
# 
# for
# ( '${foo#}'
# )
# my () map `$_`,'echo ${foo}';
# 
