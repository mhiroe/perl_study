use strict;
use warnings;

# 14_配列のループ処理 (foreach)

print "\n14.1-----------------------\n";
my @colors = qw(red green blue orange ping);

# 配列から１個ずつスカラー変数に入れる
foreach my $color (@colors){
  print "color = $color˜\n";
}
print "\n14.2-----------------------\n";
# forとforeachは同じ
for my $color (@colors){
  print "color = $color˜\n";
}
print "\n15.2-----------------------\n";
# スカラー変数は省略出来る、{}の中で $_(特殊変数)の中に自動的に入る
for (@colors){
  print "color = $_˜\n";
}

# 15 ハッシュのループ処理

print "\n16.1-----------------------\n";
my %sales = ("tanaka"=>150, "suzuki" =>300, "ohira"=>200);

# %salesの中の"key"を抜き出して、スカラー変数に収め、処理のなかで使う
# 出力は順不同になるので注意
foreach my $key (keys(%sales)){
  print "sales for $key is $sales{$key}\n"; # 波括弧?
}
print "\n16.2-----------------------\n";
# 省略記法
for (keys %sales){
  print "sales for $_ is $sales{$_}\n"; # 波括弧?
}
