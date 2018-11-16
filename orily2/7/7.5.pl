use strict;
use warnings;

# use File::Find;
# sub create_find_callback_that_counts {
#     my $count = 0;
#     return sub { print ++$count, ": $File::Find::name\n" };
# }
# my $callback = create_find_callback_that_counts(); print "my bin:\n";
# find($callback, 'bin');
# print "my lib:\n";
# find($callback, 'lib');

use File::Find;
# sub create_find_callback_that_sums_the_size {
#   my $total_size = 0;
#   return sub {
#     if ( @_ ) { # ダミーの呼び出しの場合
#       return $total_size;
#     }
#     else { # File::Find:からのコールバックの場合
#       # $total_size += -s if -f;
#       $total_size += -s ;
#     }
#   };
# }
#
# my $callback = create_find_callback_that_sums_the_size( );
# find($callback, 'bin');
# find($callback, 'lib');
# # my $total_size = $callback->('dummy'); # dummy parameter to get size
# my $total_size = $callback->(); # no arg
# print "total size of bin is $total_size\n";

sub create_find_callbacks_that_sum_the_size {
  my $total_size = 0;
  return(
    sub { $total_size += -s if -f },
    sub { return $total_size }
  );
}

# ２つサブルーチンを用意する
my ($count_em, $get_results) = create_find_callbacks_that_sum_the_size( );
find($count_em, 'bin'); # カウントする方
find($count_em, 'lib'); # カウントする方
my $total_size = &$get_results( ); #合計を計算する方
print "total size of bin is $total_size\n";
