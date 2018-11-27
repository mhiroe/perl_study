use strict;
use warnings;

use v5.10.1;
use Regexp::Assemble;
my $ra = Regexp::Assemble->new;
for ( 'Mr. Howell', 'Mrs. Howell', 'Mary Ann' ) {
  $ra->add( "$_" );
  # $ra->add( "\Q$_" );
}

say $ra->re;

# \Qなし (?^:M(?:rs?\. Howell|ary Ann))
# \Qあり (?^:M(?:rs?. Howell|ary Ann))
