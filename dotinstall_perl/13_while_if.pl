use strict;
use warnings;

# 13. ループ処理 (while)

# iが0から9までカウントされる
my $i = 0;

while ($i < 10){
  print "i = $i\n";
  $i++;
}

# for文で同じことを行う
# (初期化; 条件; カウントアップ)
for (my $i = 0; $i < 10; $i++){
  print "i = $i\n";
}
