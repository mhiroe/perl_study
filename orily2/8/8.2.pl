use strict;
use warnings;


# # ハンドルをスカラー変数に置き換える
# open my $log_fh, '>>', 'castaways.log'
#   or die "Could not open castaways.log: $!";
#
# log_message( $log_fh, 'My name is Mr. Ed' );
# sub log_message {
#   my $fh = shift;
#   print $fh @_, "\n";
# }

# 入力
open my $rfh, '<', 'castaways.log'
  or die "Could not open castaways.log: $!";

while( <$rfh> ) {
  print $_;
}
