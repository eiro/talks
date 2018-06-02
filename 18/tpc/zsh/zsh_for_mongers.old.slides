% zsh pour les mongueurs

# origines communes

    sh -> ksh -> {zsh; perl}

# affectaion

    x=23
    echo x vaut actuellement $x, saisis une nouvelle valeur
    read x
    echo la nouvelle valeur de x est $x

PERLALERT: `$` veut dire "interpolation de", pas "scalaire"
    $# 


# appels

    echo this  is  it
    $0   $1    $2  $3

    echo this\ is\ it
    $0   $1

    echo 'this is $it'  # comme q()
    $0   $1

    echo "this is $it"  # comme qq()
    $0   $1

# qq q qx qw

import re
def qw(on,match="\w+"): return re.findall(match,on)
words = qw("""
      this is a test
      haha
      """ )
for w in words: print("({})".format(w))

@words = qw( this is a test )
map say, @words

words=( this 'is a' test )
for w ( $words ) { print $w }

words=( this 'is a' test )
for w ( $words ) { print $w }


mais alors qq!! qq[] qq<>, ...

    # qq!
    read greeting <<!
    hello "$USER"
    !

    # q!
    cat <<\!
    hello "$USER"
    !

    sed 's/U//' <<\!
    hello "$USER"
    !

    read greetings <<\!
    hello "$USER"
    !

# structures, variables

* scalaires, tableaux et tableaux associatifs

    authors=(
        'Victor Hugo'
        Voltaire
    )
    typeset -A user=( login mc passwd s3cRe7 )
    msg="i have a dream"
    read line

# aliases et fonctions

* penser "préprocesseur"

    alias number6='echo "$RANDOM is a number. not number 6"'



    typeset -A user=( login mc passwd s3cRe7 )




* références symboliques
    * en perl (sans 'strict')
    
    $a = 'b'; $b = 12; 

`$`

* "scalar" en perl
* "interpolation de" en zsh

# zsh

+-----------------------------+---------------------------------------+
| perl                        | hahaha                                |
+=============================+=======================================+
| $haha @this                 | `lol`                                 |
| hehee                       | hahaha                                |
+-----------------------------+---------------------------------------+
| hehee                       | hahaha                                |
| hehee                       | hahaha                                |
+-----------------------------+---------------------------------------+








