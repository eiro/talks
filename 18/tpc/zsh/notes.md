echo hello world
echo $ZSH_VERSION
echo $ZSH_VERSION

for it ( echo print )
    echo "$it contains $#it chars"

alias @='for it'
alias l='print -l'
@ ( echo print )
    l "$it contains $#it chars"

for it ( echo print )
    l "${(r,5,)it} contains $#it chars"

5 is optimistic ...
$#it should be padded too

    local it= max=0
    local -a writers=( print echo this_long_one )

    @ ( $writers)
        l "${(r,$max,)it} contains ${(l:3::0:)#it} chars"

sub maxlen {
    map {
        $len = length $_;
        $max =
            $len > $max
            ? $len : $max
    } @_;
}

maxlen qw( one two three ); #@writers
print $max;

max=0
maxlen () {
    local it len
    @ (( len=$#it , 
         max = len > max ? len : max
    ))
 }

maxlen one two three
l $max

for it ( echo print this_long_one )


alias @='for it'
@ ( echo print )
    $it "${(r:5:)it} contains $#it chars"


