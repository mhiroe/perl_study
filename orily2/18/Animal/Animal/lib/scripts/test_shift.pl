use warnings;
use strict;

my @array = (1, 2, 4, 5);
print my $one = shift @array; #配列から取り出す
print "\n@array\n";
push @array,shift; # 引数を取り出して 配列に入れる
print "\n@array\n";
shift(@array); #配列から取り出す
print "\n@array\n";
