use strict;
use warnings;

# 09 条件分岐と比較演算子

my $score = 85;
if ($score >= 80) {
  print("ok!");
}

print "\n-----------------------\n";

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
print "\n-----------------------\n";

# 11,さらに条件分岐する

my $score = 25;

if ($score2 >= 80) {
  print("ok!");
} elseif ($socre2 >= 40){
  print("note ok...");
} else {
  print ("taketeh test again!");
}
