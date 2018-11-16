use strict;
use warnings;

## callback 見つかった時点で 何かしらアクションする (呼ばれるアクションによくhashref使われる)
use File::Find;
# sub what_to_do { # これも下のやり方だと無名サブルーチンにしてしまう
#     print "$File::Find::name found\n";
# }
#
# my @starting_directories = qw(.);
# find(\&what_to_do, @starting_directories);

# my @starting_directories = qw(.);
# find( sub {
#         print "$File::Find::name found\n";
#       },@starting_directories,
# );

## クロージャ
my $total_size = 0;
find(sub {
  $total_size += -s if -f }, 'bin'
);
print $total_size, "\n";


# my $callback;
# {
#   my $count = 0; # グローバルで宣言していないのがポイント
#   $callback = sub { print ++$count, ": $File::Find::name\n" };
#   ## 1から始まるインクリメント
# }
# find($callback, '.');
# print "\n";
# find($callback, '.'); # $countが生きてるので 続きのカウントから再開される

# # 7.5 サブルーチンのサブルーチン
# sub create_find_callback_that_counts {
#   # my $count = 0;
#   my $count;
#   return sub { print ++$count, ": $File::Find::name\n" };
# }
#
# # my $callback = sub {
# #   my $count = 0;
# #   return sub { print ++$count, ": $File::Find::name\n" };
# # };
#
# # 無名code_refだとちゃんと $countの値が残る
# my $callback =  create_find_callback_that_counts;
# find($callback, '.');
# find($callback, '.');
# # code_refにちゃんとした場合 $countの値は残らない
# # print my $callback =  \&create_find_callback_that_counts;
# # find(&{$callback}, '.');
# # find(&{$callback}, '.');
