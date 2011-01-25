#! /usr/bin/perl
use Modern::Perl;
use Regexp::Grammars;
use YAML;

qr{ <nocontext:>
    <grammar:Airports>

    <rule:BoardingTicket>
    ^ Passenger: <lastname=name> / <firstname=name>
    ^ Fly <fly> From <from=airport> To <to=airport> 

    <token: name> .*? 
    <token: fly> <operator><flynumber>
    <token: flynumber> \d{4}
    <token: operator> AF | AB | RA 
    <token: airport> MRS | TFS | TFN | SXB

}x;


"
    Passenger: Doe / John
    Fly AF3453 From SXB To MRS
" ~~ /<extends:Airports> <BoardingTicket> /xms and say Dump $/{BoardingTicket};
