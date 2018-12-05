use 5.006;
use strict;
use warnings;

use Horse;

my $name = 'Mr. Ed';
my $tv_horse = \$name;
bless $tv_horse, 'Horse';

# インスタンス->メソッド
# $tv_horse->speak;
# これに変換している
# Horse::speak($tv_horse);

# soundの第一引数は クラス名取っていた 上の例はあえて引数を入れる形にしている
Horse->speak;

## クラス->メソッド
# my $noise = Horse->speak;
