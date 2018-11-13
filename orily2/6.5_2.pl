use strict;
use warnings;

my @x = ( 1, 5, 32, 56, 5, 8, 0, 5 );
my @y = (3, 5, 31, 43, 5, 3, 2);

# my @bigger_indices = grep {
#   if ($_ > $#y or  $x[$_] > $y[$_]) {
#     1; # 条件どおり、選択する }
#   else {
#     0; # 条件に合わないので、選択しない }
# } 0..$#x;
# my @bigger = @x[@bigger_indices];

# my @bigger_indices = grep {
#   $_ > $#y or $x[$_] > $y[$_]; # booleanを返せればいいのでこれでいい
# } 0..$#x;
# print my @bigger = @x[@bigger_indices];


# 条件のあうアイテムをmapですぐ返す
my @bigger = map {
  if ($_ > $#y or $x[$_] > $y[$_]) {
    $x[$_]; # 添字自体を返す
  }
  else {
      ( ); # 消滅する
  }
} 0..$#x;
print "@bigger";
