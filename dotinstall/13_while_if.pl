use strict;
use warnings;

# 13. ループ処理 (while)

# while
# イテレーターが中に入る(中に入るのが場合によって変化する)

# iが0から9までカウントされる
my $i = 0; # 初期化

while ($i < 10){ # 条件
  print "i = $i\n";
  $i++; # カウントアップ
}


# for
# 繰り返し回数が明示的な場合

for (my $i = 0; $i < 10; $i++){ # 初期化; 条件; カウントアップ
  print "i = $i\n";
}
