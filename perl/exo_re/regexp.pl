#! /usr/bin/perl
use Modern::Perl;
use YAML;

=head 1 Parsing flying ticket

formated as

    Passenger: Doe / John
    Fly AF3453 From SXB To MRS

=cut

my %airport_label_of = %{ YAML::LoadFile \*DATA };
say $airport_label_of{MRS};
my $matches_airport_code = do {
    my $_ = join '|', keys %airport_label_of;
    qr{$_};
};

__DATA__
TFS: Tenerife South
TFN: Tenerife North
MRS: Marseille Provence
SXB: Strasbourg
