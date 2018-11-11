use strict;
use warnings;
# 08.ハッシュ変数

# ハッシュ変数：キーと値 : %
# tanakaがキーで 値が300
my %sales = ("tanaka"=>300, "suzuki"=>150, "ohira"=>200);
print $sales{"tanaka"}; # 300が取り出される、単一の値で取り出されるので $ にする

# このようにも書けるが、わかりずらいのでこういう風に書かない(ずれる危険性有り)
my %sales2 = ("tanaka", 300, "suzuki", 150, "ohira", 200);
