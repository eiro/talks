#! /usr/bin/perl
use Modern::Perl;
use YAML;

my %form = get_http_form;

for my $key ( keys %form ) {
    $form{$key} =~ s/^\s+//;
    $form{$key} =~ s/\s+$//;
}















# sub trim { s/ ^ \s+ | \s+ $ //g }
# trim for values %form;
