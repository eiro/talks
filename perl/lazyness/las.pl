#! /usr/bin/perl
use Modern::Perl;
use YAML;

for ( $_=1;; ) {
    say;
    s/((.)\2*)/length($1).$2/ge;
}



