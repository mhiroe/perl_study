use strict;
use warnings;
use Data::Dumper;
use Data::Dump::Streamer;

# use File::Find;
# sub create_find_callback_that_counts {
#     my $count = 0;
#     return sub { print ++$count, ": $File::Find::name\n" };
# }
# my $callback = create_find_callback_that_counts();
# print "my bin:\n";
# find($callback, 'bin');
# print "my lib:\n";
# find($callback, 'lib');

# # 引数を渡して処理を分ける(よくない)
# use File::Find;
# sub create_find_callback_that_sums_the_size {
#   my $total_size = 0;
#   return sub {
#     if (@_) { # ダミーの呼び出しの場合
#       return $total_size;
#     }
#     else { # File::Find:からのコールバックの場合
#       print "$File::Find::name\n";
#       $total_size += -s if -f;
#     }
#   };
# }
#
# my $callback = create_find_callback_that_sums_the_size( );
# find($callback, 'bin'); # 最初に elseに入って total_size足し上げる
# find($callback, 'lib'); # 最初に elseに入って total_size足し上げる
# my $total_size = $callback->('dummy'); # dummy parameter to get size
# # - @_に入って合計サイズ pringする
# print "total size of bin is $total_size\n";

# サブルーチンを２つ用意する
use File::Find;

sub create_find_callbacks_that_sum_the_size {
  my $total_size = 0;
  # return(
  #   sub { $total_size += -s if -f},
  #   sub { return $total_size }
  # );
  sub { $total_size += -s if -f},
  sub { return $total_size };# これでもok returnなくても実行している
}

# ２つのサブルーチンref
my ($count_em, $get_results) = create_find_callbacks_that_sum_the_size( );
find($count_em, '.'); # コールバックとして呼ぶ
# my $total_size = &$get_results( );
# my $total_size = &$count_em( ); # これはNG
# my $total_size = $get_results->(); # デリファレンス 違う書き方
my $total_size = $get_results; # 思いっきり省略
print "total size of bin is $total_size\n";

Dump $count_em;
Dump $get_results;
