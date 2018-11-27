use strict;
use warnings;

use v5.10.1;
use List::Util qw(first);

my %patterns  = (
  Gilligan    => qr/(?:Willie )?Gilligan/,
  'Mary Ann'  => qr/Mary Ann/,
  Ginger      => qr/Ginger/,
  Professor   => qr/(?:The )?Professor/,
  Skipper     => qr/Skipper/,
  'A Howell'  => qr/Mrs?. Howell/,
);

my $name = 'Ginger Mary Ann';

# for (keys %patterns) {
#   # print "$patterns{$_}\n";
#   print $name if $name =~ $patterns{$_};
# }

# my( $match ) = fist { $name =~ $patterns{$_} } keys %patterns;
# say "Matched $match" if $match;
