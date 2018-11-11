use strict;
use warnings;

# my %family_name;
# my $family_name{fred}   = 'flintstone';
# my $family_name{barney} = 'rubble';

my %family_name = (fred => 'flintstone', barney => 'rubble');

foreach my $person (qw< barney fred >) {
  print "I've heard of $person $family_name{$person}.\n";
}
