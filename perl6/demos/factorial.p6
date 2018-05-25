sub postfix:<!> ( Int \x ) { [*] 1..x }
my \ℕ = 0...*;
ℕ[^1000].hyper.map( *! )>>.say;
