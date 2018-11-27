use strict;
use warnings;

use v5.12;

my %patterns  = (
  Gilligan    => qr/(?:Willie )?Gilligan/,
  'Mary Ann'  => qr/Mary Ann/,
  Ginger      => qr/Ginger/,
  Professor   => qr/(?:The )?Professor/,
  Skipper     => qr/Skipper/,
  'A Howell'  => qr/Mrs?. Howell/,
);

# print @patterns{ sort keys %patterns };

my $position = rightmost(
'There is Gilligan Mrs. Howell, Ginger, and Gilligan',
 @patterns{ sort keys %patterns }
);
say "Rightmost match at position $position";


sub rightmost {
  my( $string, @patterns ) = @_;

  my $rightmost = -1;
  # while( my( $i, $pattern ) = each @paytterns ) {
  for my $pattern ( @patterns ) {
    # print $i; # $iはカウンタ 何に使っているかわからん
    $position = $string =~ m/$pattern/ ? $-[0] : -1;
    $rightmost = $position if $position > $rightmost;
  }
  return $rightmost;
}
