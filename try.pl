use strict;
use warnings;

# my $file_contents = do {
#   local $/;
#   local @ARGV = ( $filename );
#   <>
# };
#
# print $file_contents;


my @skipper = qw(blue_shirt hat jacket preserver sunscreen);
my $item = \@skipper;
print "@{ $item }"; 
