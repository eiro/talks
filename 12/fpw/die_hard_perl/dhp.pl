=head1 run this talk

    revealer 12/fpw/die_hard_perl/talk.pl > ~/www/reveal.js/talk.html

=cut 

reveal {
    S {"ready?"}
    , section {
            h1{"Die Hard Perl"}
            , p{"Journées Perl 2012"}
            , p{"Strasbourg, 29-30 juin"}
            , img 'logo_mongueurs.png'
    }
    , S { "i $love perl" , FP "45mn"
         , "non exhaustif"
         , "les choses à savoir"
         , "les bonnes pratiques"
         , "les 'trucs illsibles'"
    }
    , S { "Perl5, octobre 1994",
        FP "☺ rétrocompatible depuis 18 ans" 
        ,  "☺ base de code large"
        ,  "☺ éprouvée"
        ,  "$frown vieillissante"
    }
    , S { "Perl 5.10+, decembre 2007",
        FP "☺ toujours rétrocompatible" 
        ,  "☺ les bonnes pratiques ont évolué"
        ,  "$frown pas les tutoriels"
        ,  "$frown ni la base de code"
    }
    , S { "Boilerplate 2012"
        , perl "
            use 5.10.0;
            use mro 'c3';
            use strict;
            use warnings;
            use utf8;
            use open qw( :std :utf8 );
            use autodie;
        "
    }
    , S { "Perl 5.16 and beyond",
        FP
        ( "depuis 2012"
        ,  "toujours des améliorations"
        ,  "changement du comportement par défaut")
        , perl "use 5.16.0;"
    }
    , S { "use Modern::Perl 2010"
        , perl "
            use Modern::Perl '2010';
            use utf8;
            use open qw( :std :utf8 );
            use autodie;
        "
    }
    , S { "Modern::Perl maison"
        , perl "
            use Project::Discipline;
        "
    }
    , section { h1{"Structures de données"}
    }
    , section { h1{"Structures de controle"}
    }
    , section { h1{"la verité, si je mens"},
        img "la-verite-si-je-mens-3_scalewidth_630.jpg"
    }
}
