use strict;
use warnings;

use Storable;

my @data1 = qw(one won);
my @data2 = qw(two too to);
push @data2, \@data1;
push @data1, \@data2;

# # マーシャリング
# my $frozen = freeze [\@data1, \@data2];
# # バイナリ出力した $frozenを取り込む
# my $recycle_data = thaw( $filename );


# バイナリ表現をファイルに保存したい場合、nstore を使えば、データを凍結させて保存する

my $filename = '6.3.1.frozen';
nstore \@data1 , $filename;


# # 取り出す
# my $array_ref = retrieve $filename;
#
# print $array_ref->[3];
