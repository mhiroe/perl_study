use strict;
use warnings;

# 09 条件分岐と比較演算子

print "\n10.1-----------------------\n";

my $score = 85;
if ($score >= 80) {
  print("ok!");
}

print "\n10.2-----------------------\n";

# 数値: < > <= >= ==(同じ) |=(同じではない)
# 文字列 eq ne gt lt ge le :
# 文字コードの大小の順序がある: 0-9 < A-Z < a-z

my $name = "Luke";
if ($name eq "Luke"){
  print ("I am your father!!");
}

print "\n\n";

# 複数条件
# && (AND)
# || (OR)
# ! (NOT)

if (($name eq "Luke") && ($score >= 80)) {
    print("I am your father!!");
}
# 11,さらに条件分岐する

print "\n11.-----------------------\n";
my $score2 = 25;

if ($score2 >= 80) {
  print("ok!");
} elsif ($score2 >= 40){
  print("note ok...");
} else {
  print ("take the test again!");
}

# 12.ifの別の書き方
print "\n12.-----------------------\n";

my $score3 = 85;
if ($score3 >= 80) {
  print("ok!");
}
# if文の後置 : 条件を後ろに置くことができる
print("OK!") if ($score3 >= 80);

# 三項演算子
# if ... els ... というのを一行で書くことができる
# 書き方：(条件) ? 値１ : 値２
# やってること：条件が真の場合、値１、偽の場合、値２

my $a = 10;
my $b = 20;

# $maxに大きい値を格納する
my $max = ($a > $b) ? $a : $b;
print $max
