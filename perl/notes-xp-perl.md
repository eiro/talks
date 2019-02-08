# prologue

    "je regarde l'oiseau. si l'oiseau a peur, l'oiseau s'envole"
    "je regarde l'oiseau. si il a peur, il s'envole"
    "je regarde l'oiseau. il s'envole si il a peur"

    larry wall est linguiste. pour lui toutes ces structures sont valides et
    devraient pouvoir être utilisées dans un langage de programmation.

    * il faut pouvoir inverser la structure de la phrase
    * il faut une notion d'implicité ("il" fait implicitement référence à
      l'oiseau dans le contexte de cette phrase)

# inverser la structure de la phrase

c'est la structure de controle qui sert de pivot:
* le mot clef reste au centre
* la rhs finit à gauche
* la lhs finit à droite

    for (A) { B }    │  B for A
    if  (A) { B }    │  B if  A

donc:

    if ($x != 0) { $x-- }
    $x-- if $x != 0
    ( $x != 0 ) && $x--
    $x != 0 and $x--

# implicité: $_

    man perlvar (plein de trucs intéressants).

$_, c'est "il" ... ca existe dans d'autres langages

* pattern space (sed)
* it en groovy
* # en clojure
* $0 en awk
* ...

du coup 

    for my $line (<>) {
        if ( $line =~ /root/ ) {
            print $_
        }
    }

    for (<>) {
        if ( $_ =~ /root/ ) {
            print $_
        }
    }

    for (<>) {
        if ( /root/ ) {
            print
        }
    }

    for (<>) { print if /root/ }

# contexte

    my $count = @lines;            # nombre d'elements
    my ($first,$second) = @lines   # les 2 premieres lignes
    my ($first) = @lines           # 1 premiere ligne


# empiler: map/grep

* <> est l'operateur d'iteration
* il itère par défaut sur ARGV
* il peut être implémenté pour une classe grace au package 'overload'

    my @lines = <>;

    open my $fh, "<","/etc/passwd" or die;
    my @lines = <$fh>;


ou alors

    my @lines = <>;
    for my $line (<>) {
        if ( $line =~ /root/ ) {
            push @lines, $line;
        }
    }

ou même

    my @lines;
    for (<>) {
        if ( $_ =~ /root/ ) { push @lines, $_ }
    }

ou même

    my @lines;
    for (<>) { push @lines, $_ if /root/ }

plus compliqué: le dernier element du split

    my @lines;
    for (<>) { push @lines, $_ if /root/ }

    my @lines;
    for (<>) { push @lines, (split /:/)[7] if /root/ }

en gros:

    * on depile une liste
    * on fait une manip
    * on push le resultat dans un tableau

    => on map une action a une liste

    my @lines = map { (split /:/)[7] } <>;

    # filter
    my @lines = map { if (/root/) { $_ } else { () } } <>

    # filtrer plus vite
    my @lines = grep { /root/ } <>; # bloc
    my @lines = grep /root/, <>;    # expression

    # /!\ la virgule:
    # * avec pour l'expression
    # * sans pour le bloc

    my @lines = map { (split /:/)[7] } <>;
    my @lines = map (split /:/)[7], <>;


# if, unless, or

    if (not (my $file = open $filename)) {
        die "can't open $filename because of $!"
    }

    unless (my $file = open $filename) {
        die "can't open $filename because of $!"
    }

    die "can't open $filename because of $!"
        unless my $file = open $filename;

    my $file = open $filename
        or die "can't open $filename because of $!"

    ($a || $b) || ($c || $b);
    # =>
    $a || $b or $c || $b;

# do

exemple:

    my $x = 42;
    my $x = do { 42 };
    my $x = do { say "un nouveau x";  42 };

concrètement:

    my $granted;
    if   ( $ENV{USER} eq 'root' ) { $granted = 1 }
    else { $granted = 0 }

    ¬ impossible de voir immédiatement que les 3 lignes concernent toutes
      l'initialisation de $granted n'existent que pour initialiser $granted

peut s'écrire:

    $granted =
        $ENV{USER} eq 'root'
        ? 1
        : 0;

    ✓ l'intention est plus claire
    ¬ plus possible de rajouter du code

love me do

    my $granted = do {
        if ( $ENV{USER} eq 'root' ) { 1 }
        else                        { 0 }
    };

love me do

    ✓ l'intention claire
    ✓ code extensible

    my $granted = do {
        if ( $ENV{USER} eq 'root' ) { 1 }
        elsif ( $DEBUG and  $ENV{user} eq 'mc' ) {
            say "TODO: remove it in production";
            1;
        }
        else                        { 0 }
    };

* faire des trucs 

do permet de récuperer la dernière valeur d'un scope, il s'utilise souvent
comme le "let in" dans les langages de la famille ml: on peut créer
des variables temporaires facilement

    my $file;
    {   my $filename = "/etc/passwd";
        open my $file, $filename
            or die "can't open $filename because of $!"
    }

    my $input = do {
        my $filename = "/etc/passwd";
        my $file = open $filename
            or die "can't open $filename because of $!"
        $file;
    };

# exemples Sympatic

    code classique

    my @lines = do {
        my $filename = '/etc/passwd';
        open my $fh, $filename
            or die "can't open $filename because $!";
        map {chomp; $_ } <$fh>;
    };

    code sysop

    my @lines = do {
        local @ARGV = '/etc/passwd';
        map {chomp; $_ } <>;
    };

    code sympatic

    my @lines =
        path('/etc/passwd')
        ->lines({ chomp => 1 });

# perl a pu évoluer en restant retrocompatible

* ajout de syntaxe sans peter l'ancienne
* les mots-clefs/operateurs dispos sous la forme de features
* les features sont experimentales pendant plusieur versions
* les futures stables ne seront normalement *plus jamais enlevées*

    use feature 'say';

    # toute les features dispos dans perl 5.26:

    use v5.26;

    # ajouter une feature experimental sans warnings:

    no warnings 'experimental';
    use feature 'signatures';
    use warnings 'experimental';

    =>

    use experimental 'signatures';

# signatures

les fonctions sont variadiques en perl

    sub id { say for @_ }
    id qw( this is my pain );

les signatures sont dispos depuis perl 5.20:

    sub hello ($who="world") { say "hello $who"}
    hello;           # hello world
    hello 'bruce';   # hello bruce

    * la feature signature est stable en perl 5.28
    * plugable keywords pour les signatures facon perl6
      (parametres nommés, gradual typing, ...) et support
      depuis perl5.12:

    https://metacpan.org/pod/Function::Parameters

# autres joujous avec use

    https://metacpan.org/pod/aliased
    https://metacpan.org/pod/if
    https://metacpan.org/pod/Import::Into
    https://metacpan.org/pod/Module::Runtime

#  __END__

permet de stopper le parser

#  __DATA__

permet d'inclure de la data arbitraire

    use YAML;
    use JSON;
    print encode_json YAML::LoadFile \*DATA;
    __DATA__
    - this
    - is
    - it

    => ["this","is","it"]

    print join ',', map {chomp; s/^- //r} <DATA>
    __DATA__
    - this
    - is
    - it

    this,is,it

# exceptions en perl

exception = message d'erreur de die
eval pour capter

l'équivalent de try/catch:

    my $x = eval {
        die "va mourrir!";
        12;
    };
    if ($@) {
        say "j'ai intercepté $@"
    }

# au passage il existe des libs pour ça
# https://metacpan.org/pod/Try::Tiny

