#! /usr/bin/perl
use Modern::Perl;
use MARC::MIR;
my $record = 
[ ''
, [ ['001',"FauxPPN" ]
  , ['010'
    , [ [a => "FauxISBN" ]
      , [g => "FausseLiaison"]
      ]
    ]
  ]
];
