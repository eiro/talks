# /home/mc/src/perl/5/lib/revealer/bin/revealer

  S { "MARC::MIR - PSGI for libraries", img 'ye/ye12.png' }
, S { "Marc Chantreux" , img 'ye/unistra.jpg' }
, S { 'a "normal guy"'
    , P '@marcchantreux'
    , "github.com/eiro" }
, S { "library sciences"
    , P "2003, Bibliothèque Nationale universitaire"
    , "2007, Université de Strasbourg"
    , "2008, Biblibre (Koha ILS)" }
, S { "Medication" , img('ye/fukitol.50.jpg') }
, S { "relapse"
    , P "2012, feb." 
    , "Université de Strasbourg" }
, S { 'this group therapy'
    , P "YAPC::Europe 2012"
    , "Frankfurt"
    , "thanks to the orginizers" }
, S {"Why?"}
, S { 'ask normal guy'
    , 'to store a book record' }
, S { 'unix hacker'
    , P '1mn of vi edition'
    , join '', pre {"Eloge de la folie|Erasme"} } 
, S { 'webapp ninja'
    , P '5mn of textmate'
    , 'json'
    , join '' , pre { q[
{ "title": "Eloge de la folie"
, "author":
    { "firstname": "Desiderius"
    , "lastname:" "Erasmus"
    }
}] }} 
, S { 'but me,'
    , P 'ask about the standard ...'
    , 'encodings ...'
    , 'write a perl script'
    , 'hours later ...' }
, S { 'ISO2709 serialization of MARC'
    , pre{"00086xxxxx2200049xxx4500001000800000010002800008^^sample^^  ^_aEloge de ma folie^_gErasme^^^]00086xxxxx2200049xxx4500"} }
, S { "How did it happen ?"  }
, S {  P "640K ought to be enough for anybody.", "-- Bill Gates, 1981" }
, S { "daddy?" , img("knr.jpg") }
, S { "daddy?" , P "PDP-11, 1970" }
, S { "MARC"
    , P "MAchine-Readable Cataloging"
    , "Henriette Avram, 1965-1968"
    , "premier service d'échange en 1969"
}
, S { 'remember?'
    , P "MARC, 1969"
    , "Apollo 11, 1969"
    , "Unix, 1969"
    , "FTP, 1971" }
, S { "PDP-3" , img("pdp3.gif") }
, S { "librarians" , img("bib.jpg") }
, S { "clever design"
    , P "flexible format"
    , "hardware error tolerant"
    , "easy skipping"
    , "easy memory allocation (C friendly)"
}
, S { "principles"
    , P "records divided in fields"
    , "fields have 3 digits identifiers"
    , "fields can contain subfields"
    , "subfields have 1 char identifiers"
}
, S { "Cataloging framework"
    ,  P "the title can be found in field 200, subfield a"
    , 'noted 200$a'
    , 'just a convention ...'
}
, S { "Conventions: everyone has one"
    , P "Integrated library Systems"
    , "Libraries"
    , '...'
}
, S { "let's standardize ..."
    , "choose a common convention for the Cataloguing framework"
    , FP qw< MARC21 USMARC DANMARC UNIMARC ...>
}
, S { "43 years later" , img("calc.gif") }
, S { "librarians" , img("bib.jpg") }
, S { "they still are"
    , P "using MARC (exchange *and* cataloging)"
    , "designing by comittee"
    , "fighting for a sucessor (FRBR, METS, MODS)"
}
, S { "ISO2709"
    , P "ISO documentation: $frown 16 pages,40€ ? srly?"
    , "led to screwed files"
    , "fancy formats and XML at rescue"
    , "but still, ILS wants ISO2709"
} 
, S { "MARC::Record"
    , P "bad design"
    , "painfull to use and hack"
    , "MARC::Moose still not simple to use"
}
, S { "I started from scratch"
    , P "new parser"
    , "the in memory (or intermediate) representation must be as simple as possible"
    , "MARC::MIR"
}
, S { "it ease everything"
    , "just a LoL"
    , "yet it comes with a DSL"
}
, S { "PSGI alike"
    , P "it's not about serialization, api, but data structures"
    , "will become only a spec"
    , "will have middlewares"
    , "translation and testing frameworks"
}


__DATA__
, S { "Example of MIR" , perl q<
[ "Header" => 
    [ [ '001' => '2344564564' ] # this is the ID
    ,   [ '856'
        , [ [ q => "jpeg" ]
          , [ z => "cover from original version" ] 
          , [ u => "http://localhost/img/" ] 
          ]
        ]
    ]
] > }
, S { "yet easy"
    , P "only LoL"
    , "tag always at first"
    , "data always at second"
    , "idiomatic"
    , join '', perl q{my ( $tag, $data ) = @$_}
}
, S { "The DSL"
    , "use MARC::MIR"
    , 'idiomatic use of $_ and (_) prototype'
    , 'iterators on ( fields | subfields ): with, map, grep, any'
    , 'helpers (tag, value, is_control, ...)'
}
, S { "Examples" }
, S { "Fake record", perl q{
my $mir =
[ ''
, [ ['001' => 'PPN']
  , ['010', [ [a => 'ISBN'] ] ]
  , ['991', [ [a => 'ISBN'] ] ]
  , ['992', [ [a => 'ISBN'] ] ]
  , ['993', [ [a => 'ISBN'] ] ]
  , ['993', [ [a => 'ISBN'] ] ]
  , ['999', [ [a => 'ISBN'] ] ]
  ]
]; } }
, S { "show record ID"
    , perl q< any_fields { tag eq '010' and say value } $mir >
}
__END__
, S { "say values of 991 subfields"
    , perl q<
any_fields {
    if ( tag eq '991' ) {
        map_subfields { say value } 
} $mir; > }
, S { 'Change 991$a to "John"'
    , perl q<
any_fields {
    if ( tag eq '991' ) {
        map_subfields {
            if ( tag eq 'a' ) {
                with_value { $_ = "John" }
            }
        } 
    }
} $mir; >
}
, S { "remove 9xx fields"
    , perl q<with_fields { @$_ = grep { (tag) !~ /^9/ }  @$_ } $mir>
}
, S { "MARC::MIR::Template"
    , P "just pretend i'm a normal guy, using HoH"
}
, S { "The data", join '', pre {q<
authors:
    - { name: Doe, firstname: [john, elias, frederik] }
    - { name: Doe, firstname: jane }
title: "i can haz title"
subtitle: "also subs"
id: PPNxxxx>}}
, S { "the MIR", join '', pre {
q{- [001, PPNxxxx ]
- [200, [ [a, Doe], [b, john], [b, elias], [b, frederik] ]]
- [200, [ [a, Doe], [b, jane]                            ]]
- [300, [ [a, "i can haz title"], [b, "also subs"]       ]] }}
}
, S { "the spec", join '', pre {q<
001: id
200: [ authors, { a: name, b: firstname } ]
300: { a: title, b: subtitle }
700: [ auth_author, { a: name, b: firstname } ]
701: [ auth_author, { a: name, b: firstname } ]>} }
, S { "the code"
    , perl q< 
$template = MARC::MIR::Template->new( $spec );
my $mir = $template->data( $data );
# MIR moves ...
say YAML::Dump $template->mir( $mir )->{authors}>}
, S {
}

}
# , S { "des middlewares, un builder"
#     , perl q[
# processor {
#     reader qw< from data/*.xml template conf/migration.yml >;
#     enable qw< lint::unimarc >;
#     enable qw< lint::sudoc   >;
#     enable qw< encode::utf8 >;
#     writer qw< to livrables/* format iso2709 >;
# } ] }
, S {
} 

# , S { "nouveaux paradigmes"
#     , FP "tableaux associatifs"
#     , "tableaux de taille variable"
#     , "format de sérialisation humains (YAML, JSON, XML)"
#     , "au prix de ressources inimaginables à l'époque"
#     , "machine arrière pour raisons technologiques?"
# }
# , S { "MARC must die"
#     , p{ link_to "http://marc-must-die.info/index.php/Main_Page", "http://marc-must-die.info/index.php/Main_Page" }
#     , FP "tentatives nombreuses (FRBR, MODS, DC, ...)"
#     , "vivement débattues"
#     , "en attendant ..."
# }
# , S { "MARC is immortal"
#     , img("highlander.jpg")
# }
# , S { "le problème"
#     , FP "c'est MARC! pas ISO2709"
#     , "manque d'atomicité des données"
#     , "peu de linked data, duplication de données, inconcistence" 
#     , "pas de système de transmission des grilles de cataloguage"
#     , "libertés par rapport aux normes"
# }
# 
# 
# , S { "Réglons-le"
#     , FP "gardons MARC"
#     , "utilisons XML"
#     , "MARC-XML, un fail monumental!"
#     , "ISO2709 est limité en taille?"
#     , "ON S'EN FOUT!, les séparateurs fonctionnent très bien"
# }
# , S { "Les outils"
#     , FP "utilisent les nouveaux paradigmes"
#     , "$frown sans simplifier réellement les choses"
#     , "de manière monolitique et concurrente" 
#     , "(MARC::Record vs MARC::Moose vs les autres technos)"
# }
# , S { "MARC::MIR"
#     , p{"MARC Intermediate Representation"}
#     , ul
#         { li{"un format simple et facilement éditable et sérialisable"}
#         , li{"un DSL simple pour le traitement"}
#         }
# }
# , S { "le format MIR"
#     , FP "des tableaux imbriqués"
#     , "la donnée toujours dans le 2ème élement"
# }
# , S { "exemple"
#     , dotpl "example.pl"
# }
# , S { "sérialiser",
#     perl('print to_iso2709 $record;')
#     ,p{"00086xxxxx2200049xxx4500001000800000010002800008^^FauxPPN^^  ^_aFauxISBN^_gFausseLiaison^^^]00086xxxxx2200049xxx4500"}
# }
# , S { "visualiser"
#     , perl('print for_humans $record;')
#     , pre{'001 FauxPPN
# 010(  )  $a FauxISBN $g FausseLiaison' } }
# , section {
#     p{" "}
#     , h1 {"Le futur"}
#     , h2{"wip, roadmap, cartons"} 
# }
# , S { "les templates"
# }
# , S { "des middlewares, un builder"
#     , perl q[
# processor {
#     reader qw< from data/*.xml template conf/migration.yml >;
#     enable qw< lint::unimarc >;
#     enable qw< lint::sudoc   >;
#     enable qw< encode::utf8 >;
#     writer qw< to livrables/* format iso2709 >;
# } ] }
# , S { "les ponts MIR"
#     , FP "déjà possible: échange simple via json, yaml, ..."
#     , "creuser msgpack"
# }
# , S { "les portages du DSL"
#     , FP "faciles si le langage possède des caractéristiques fonctionnelles"
#     , "blocs anonymes"
#     , "utilisation implicite de variables"
#     , "candidats potentiels: perl6, haskell, clojure, ruby? python?"
# }
# , S { "clojure"
#     , FP "est homoiconique"
#     , "jvm (bases de graph, les moteurs d'index, ...)"
#     , "perspectives full web grace a clojurescript" 
# }
# , S { "haskell"
#     , FP "performance"
#     , "typage fort?"
# }
# , S { "perl6"
#     , FP "traitements des structures"
#     , "grammaires: validation des données simplifiées"
# }
