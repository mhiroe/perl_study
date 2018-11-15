use strict;
use warnings;

use Data::Dumper;
$Data::Dumper::Purity = 1; # 自己参照するデータ構造があるかもしれないことを宣言
my @data1 = qw(one won);
my @data2 = qw(two too to);
push @data2, \@data1;
push @data1, \@data2;

print Dumper @data1;
# print Dumper(\@data1, \@data2);
