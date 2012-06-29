# /home/mc/src/perl/5/lib/revealer/bin/revealer

S {"ready?"}
, section { p{"Journées Perl 2012"}
        , p{"Strasbourg, 29-30 juin"}
        , img 'logo_mongueurs.png'
}
, S { "MARC::MIR"
    , h2{"un PSGI pour l'infodoc"}
    , img 'logo_mongueurs.png'
}
, S { "", FP "640K ought to be enough for anybody.", "-- Bill Gates, 1981" }
, S { "daddy?"
    , img("knr.jpg")
}
, S { "daddy?"
    , P "PDP-11"
    , "commercialisé en 1970"
}
, S { "MARC"
    , FP "MAchine-Readable Cataloging"
    , "Henriette Avram, 1965-1968"
    , "premier service d'échange en 1969"
}
, S { "cette année là"
    , P "MARC, 1969"
    , "Apollo 11, 1969"
    , "Unix, 1969"
    , "FTP, 1971"
    , "moi, 1976"
}
, S { "PDP-3"
    , img("pdp3.gif")
}
, S { "les bibliothécaires"
    , img("bib.jpg")
}
, S { "Principes"
    , ul {
        li{"zones de stockage identifiées par"}
        , li { ul
            { li {  "un champ sur 3 digits" }
            , li { "un sous-champs sur 1 alpha" } }
        }
        , li { "de taille libre" }
        , li { "précédés par un champ de taille" }
        , li { "finis par des caractères de controle" }
        , li { "concaténés" }
    }
}
, S { "Grille de cataloguage"
    , FP "associe une zone à une information intellectuelle"
    , "exemple: mettre le titre en champs 200, sous-champ a"
    , 'ca se note 200$a'
    , "oui, c'est arbitraire"
}
, S { "les normes de catalogage"
    , FP "définir une grille de cataloguage commune"
    , "MARC21, USMARC, DANMARC, ..."
}
, S { "Unimarc"
    , FP "... est une norme internationale utilisée en France uniquement"
    , "-- Nicolas Morin"
}
, S { "la norme ISO2709"
    , FP "$frown 16 pages"
    , "40€ ?"
    , "un bide littéraire et commercial"
} 
, S { "Une bonne pratique à l'époque"
    , FP "accès séquenciel"
    , "traitement peu gourmand"
    , "tolérant à l'erreur"
    , "allocation mémoire prévisible"
    , "parfait pour les bandes"
}
, S { "43 ans plus tard"
    , img("calc.gif")
}
, S { "les bibliothécaires"
    , img("bib.jpg")
}
, S { "utilisent"
    , P "MARC (sous widows)","FTP (sous windows)"
}
, S { "MARC nous coupe"
}
, S { "nouveaux paradigmes"
    , FP "tableaux associatifs"
    , "tableaux de taille variable"
    , "format de sérialisation humains (YAML, JSON, XML)"
    , "au prix de ressources inimaginables à l'époque"
    , "machine arrière pour raisons technologiques?"
}
, S { "MARC must die"
    , p{ link_to "http://marc-must-die.info/index.php/Main_Page", "http://marc-must-die.info/index.php/Main_Page" }
    , FP "tentatives nombreuses (FRBR, MODS, DC, ...)"
    , "vivement débattues"
    , "en attendant ..."
}
, S { "MARC is immortal"
    , img("highlander.jpg")
}
, S { "le problème"
    , FP "c'est MARC! pas ISO2709"
    , "manque d'atomicité des données"
    , "peu de linked data, duplication de données, inconcistence" 
    , "pas de système de transmission des grilles de cataloguage"
    , "libertés par rapport aux normes"
}


, S { "Réglons-le"
    , FP "gardons MARC"
    , "utilisons XML"
    , "MARC-XML, un fail monumental!"
    , "ISO2709 est limité en taille?"
    , "ON S'EN FOUT!, les séparateurs fonctionnent très bien"
}
, S { "Les outils"
    , FP "utilisent les nouveaux paradigmes"
    , "$frown sans simplifier réellement les choses"
    , "de manière monolitique et concurrente" 
    , "(MARC::Record vs MARC::Moose vs les autres technos)"
}
, S { "MARC::MIR"
    , p{"MARC Intermediate Representation"}
    , ul
        { li{"un format simple et facilement éditable et sérialisable"}
        , li{"un DSL simple pour le traitement"}
        }
}
, S { "le format MIR"
    , FP "des tableaux imbriqués"
    , "la donnée toujours dans le 2ème élement"
}
, S { "exemple"
    , dotpl "example.pl"
}
, S { "sérialiser",
    perl('print to_iso2709 $record;')
    ,p{"00086xxxxx2200049xxx4500001000800000010002800008^^FauxPPN^^  ^_aFauxISBN^_gFausseLiaison^^^]00086xxxxx2200049xxx4500"}
}
, S { "visualiser"
    , perl('print for_humans $record;')
    , pre{'001 FauxPPN
010(  )  $a FauxISBN $g FausseLiaison' } }
, section {
    p{" "}
    , h1 {"Le futur"}
    , h2{"wip, roadmap, cartons"} 
}
, S { "les templates"
}
, S { "des middlewares, un builder"
    , perl q[
processor {
    reader qw< from data/*.xml template conf/migration.yml >;
    enable qw< lint::unimarc >;
    enable qw< lint::sudoc   >;
    enable qw< encode::utf8 >;
    writer qw< to livrables/* format iso2709 >;
} ] }
, S { "les ponts MIR"
    , FP "déjà possible: échange simple via json, yaml, ..."
    , "creuser msgpack"
}
, S { "les portages du DSL"
    , FP "faciles si le langage possède des caractéristiques fonctionnelles"
    , "blocs anonymes"
    , "utilisation implicite de variables"
    , "candidats potentiels: perl6, haskell, clojure, ruby? python?"
}
, S { "clojure"
    , FP "est homoiconique"
    , "jvm (bases de graph, les moteurs d'index, ...)"
    , "perspectives full web grace a clojurescript" 
}
, S { "haskell"
    , FP "performance"
    , "typage fort?"
}
, S { "perl6"
    , FP "traitements des structures"
    , "grammaires: validation des données simplifiées"
}
