use strict;
use warnings;

# 16.ファイルを扱う

# ファイルの入出力

# 準備 test.dat
# ファイルを読み込んで表示させる

# ファイルをopenする
# 変数を用意し $in ,　読み書きのモードを指定 < 読み込む時
# or die 上手く行かなかったら()を処理して終了する
open(my $in, "<", "test.dat") or die("coud not open file.");

# 一行ずつ処理する １行ごとのデータは$_の中に入れられる
while(<$in>){
  print $_;
}
# ファイルの入力を終了する
close($in);

print "\n-----------------------\n";

# ファイルから読み込んだものを、さらにファイルへ出力する

open(my $in2, "<", "test.dat") or die("coud not open file.");
# ファイルへの出力を開く
open(my $out, ">", "test.out") or die("coud not open file.");

while(<$in2>){
  # 行にはいっているものを$outに入力
  print $out $_; # print 先を $out にして $_を出力している
}
# ファイルの入出力を終了する
close($in2);
close($out);
