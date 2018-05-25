sub postfix:<!> ( Int \x ) { [*] 1..x }
my @ℕ = 0...*;
@ℕ[^400].map( *! ).say;

# 1..*
# say 5!;
# (^5).map( *! ).say;

# my &odds = *.grep( * % 2 );
# (1..10).&odds>>.say;

# < a b c >.map( { | ( $_, $_ ) } ).say;


# .hyper
# (1,1.5...100)
#     .grep( ! (* % 2) )
#     .map(*.say);
# ()1,1,5,2,...*
# [^10].say

# my $x = .1 + .2;
# say "{$x} est un {$x.WHAT.perl},
# la comparaison avec .3 est donc { $x == .3 ?? "vraie" !! "fause" }";
# 
# < explicit lyrics >.map: -> $el { $el.say };
# < this is a sentence >.map: { .say };
# < another one >.map: *.say;
# 
# sub a ( $x , $y ) { $x + $y };
# my &b = * + *;
# (&a, &b).map( { .(1,2).say } );
# say a 1, 2;
# say b 1, 2;
# 
# my @additions =
#     -> $x , $y { $x + $y },
#     { $^x + $^y },
#     * + * ;
#
# say "tout vaut 3" if [==] 3, |@additions.map({.(1,2)});
#
#

# my  @matrice =
#     ( ( 1 , 2 , 3 )
#     , ( 4 , 5 , 6 )
#     , ( 2 , 3 , 1 )
#     , ( 8 , 9 , 5 )
#     , ( 1 , 1 , 1 ));
# 
# say @matrice[0;1];
# say @matrice[0,1,3;1];
# say @matrice[0..3;1];
# say @matrice[0,1;0,1];
# say @matrice[*;1];
# sub transpose (@a) { @a[0].keys.map: -> $k { @a[*;$k] } }
# @matrice.&transpose.say;
# @matrice.&transpose.map({ [+] $_ }).say;
# say map { [+] $_ }, transpose @matrice;

# say [max] 1, 34, 4;
# my &maxbychars = *.sort(*.chars)[*-1];
# <those words are not identical >.map({ $_ => .chars }).say;
# <those words are not identical >.&({ .sort(*.chars)[*-1] }).say;
# <those words are not identical >.&maxbychars.say;
# say maxbychars <those words are not identical >;
# %(< this is it again >).keys.say;

# (1,1.5...100)
#     .grep( ! (* % 2) )
#     .map(*.say);

# ()1,1,5,2,...*
# [^10].say
