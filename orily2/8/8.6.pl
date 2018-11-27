use strict;
use warnings;

use IO::Dir;
my $dir_fh = IO::Dir->new( '.' )
  or die "Could not open dirhandle! $!\n";
while( defined( my $file = $dir_fh->read ) ) {
  print "Skipper, I found $file!\n";
}

$dir_fh->rewind; # また呼べる
while( defined( my $file = $dir_fh->read ) ) {
  print "I can still find $file!\n";
}
