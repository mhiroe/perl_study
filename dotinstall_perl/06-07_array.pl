# 06. 配列を使ってみよう

use strict;
use warnings;

# 配列変数 @

my @sales = (150, 200, 300);
# my @colors = ('red', 'green');
my @colors = qw(red green); #上と同じ、''を省略できる quated words
my @mixed = ('150', 'red', '1.5');

print @sales;
print "\n\n";

my @inc = (1..100); # .. 範囲演算子

# print時のセパレータを指定するには？
# $, という特殊な変数を使うと、配列を print で出力するときのセパレータを設定することができます。
#
# (例) 空白区切りにする場合。
$, = " ";
my @inc = (1..5);
print @inc;
print "\n\n";

print "\n-----------------------\n";

# 07.配列(2)

my @sales2 = (300, 150, 200); #()内は要素

print $sales2[1]; # 添字 1 を当てる、取り出したものはスカラー変数 $ になる
print "\n\n";

# 添字は要素後ろから -1,-2 .. と当たっている
print $sales2[-1]; # 末尾
print "\n\n";

# 範囲を指定する
print @sales2[0..1]; # 単一の値ではないので @(配列)になる
print "\n\n";

# @sales -> $#sales が自動的に作られる = 末尾の添字
print @sales2[1..$#sales]; # 1から末尾までの要素を取り出す
