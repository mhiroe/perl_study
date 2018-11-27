use strict;
use warnings;

use v5.10.1;
use Regexp::Common qw(URI);

my $string = 'https://news.yahoo.co.jp/pickup/6304513';

say $RE{URL}{HTTP}; # zipは出るけどこれは出ない


# print $string if $string =~ /$RE{URL}{HTTP}/;

# while( <> ) {
#   print if  /$RE{URL}{HTTP}/;
# }

# use Regexp::Common qw(zip);
# say $RE{zip}{US};
