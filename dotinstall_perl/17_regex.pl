# 17.正規表現を使ってみよう

use strict;
use warnings;

# 正規表現
# -巨大なファイルに対して処理を行うことがおおい

open(my $in, "<", "test.dat") or die("coud not open file.");

while(<$in>){
  # 読み込んだ内容に対して　置換/マッチしたいまターン/書き換えたいもの/;
  # $_ =~ s/abc/ABC/;
  s/abc/ABC/; # 省略形
  # [英小文字]にマッチしたものを表示
  # if ($_ =~ /[a-z]/){
  if (/[a-z]/){ # 省略形

    print $_;
  }
}
close($in);
