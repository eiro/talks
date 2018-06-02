foo=(
    'chaine n° 1'  "hello, $USER"
    des mots dans le tableau
)

cat << EOM
* \$foo contient $#foo elements
* le premier élément vaut "$foo[1]"
* le dernier "$foo[-1]"
* le elements 3 a 5 sont respectivement: ${foo[3,5]}
* en plus lisible: ${(j:,:)foo[3,5]}
EOM

foo[1,5]=()      # virer les elements 1 a 5
foo+='haha huhu' # push 
foo+=( nouveaux elements ) # push
foo[(r)*nou*]=( ancien )   # remplacer par
