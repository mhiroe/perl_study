use strict;
use warnings;
use feature 'say';
use 5.010; #これが必要

# 再帰的なサブルーチン
# my $countdown;
# $countdown = sub {
#   state $n = 5;
#   return unless $n > -1;
#   # print $n--;
#   say $n--;
#   $countdown->(); #サブルーチンの内側から呼べる 0になるまでループする 実際にはこれが動く
# };
# $countdown->();

# 現在のサブルーチンのリファレンスを返す __SUB__ トークン

use v5.16; # __SUB__はこれが必要
# my $sub = sub {
sub countdown { # 名前付きでも問題ない
  state $n = 5;
  return unless $n > -1;
  say $n--;
  __SUB__->();
};
# $sub->();
&countdown();
