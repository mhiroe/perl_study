use strict;
use warnings;
use Data::Dumper;

use v5.10; # stateを使うため

while( <> ) {
  state $fhs;
  my( $source, $destination, $bytes ) = split;
  unless( $fhs->{$source} ) {
      open my $fh, '>>', \$source or die '...';
      $fhs->{$source} = $fh;
  }
  say { $fhs->{$source} } "$destination $bytes"; # fhに向けて書き込む
  print Dumper $fhs;
}

# for (keys $fhs->{$source} ) {
#   print { $fhs }->{$source}{$_};
# }
