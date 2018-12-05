use Cow;
use Horse;
use Sheep;

# # libを直接呼び出し
#Cow::speak;
#Horse::speak;
#Sheep::speak;

# # シンボリックコードレフ
# my @pasture = qw(Cow Cow Horse Sheep Sheep);
# foreach my $beast (@pasture) {
#   no strict 'refs';
#   &{$beast."::speak"};
# }

# # メソッド呼び出し
# Cow->speak;
# Horse->speak;
# Sheep->speak;

# # 変数を使う
# my $beast = 'Cow';
# $beast->speak;

# my @pasture = qw(Cow Cow Horse Sheep Sheep);
# foreach my $beast (@pasture) {
#   $beast->speak;
# }

use Mouse;
Mouse->speak;
