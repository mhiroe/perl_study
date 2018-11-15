use strict;
use warnings;
use Data::Dumper;

my @data1 = qw(one won);
my @data2 = qw(two too to);
push @data2, \@data1;
push @data1, \@data2;

# ## VAR1 VAR2 に置き換えられてしまう
# my $string = Dumper( \@data1, \@data2 ); # 何らかのファイルハンドルへ


# Dump メソッドには 2 個の配列リファレンスを渡せるようになってい ます。
# 第 1 の配列リファレンスはダンプしたい変数のリスト、
# 第 2 の配列リファレンスは使いたい 名前のリストです。
# - 型グロブの説明はしませんが、* プリフィックスを使って、リファレンスを見て文字列 内でどの変数型を使うべきかを判断せよと Data::Dumper に指示す

print Data::Dumper->Dump(
  [ \@data1, \@data2 ],
  [ qw(*data1 *data2) ]
);
