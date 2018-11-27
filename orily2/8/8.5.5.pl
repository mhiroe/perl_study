use strict;
use warnings;

use IO::Null;

my $Debug =0;
my $debug_fh = $Debug ? *STDOUT : IO::Null->new;
# $debug_fh->print( "Hey, the radio's not working!" );
print $debug_fh "kansetsu object kihou";
