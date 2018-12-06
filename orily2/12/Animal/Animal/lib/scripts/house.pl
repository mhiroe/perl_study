use 5.006;
use strict;
use warnings;

use Horse;

# my $name = 'Mr. Ed';
# my $tv_horse = \$name;
# bless $tv_horse, 'Horse';

# インスタンス->メソッド
# $tv_horse->speak;
# これに変換している
# Horse::speak($tv_horse);

# soundの第一引数は クラス名取っていた 上の例はあえて引数を入れる形にしている
# Horse->speak;

## クラス->メソッド
# my $noise = Horse->speak;

# my $tv_horse = Horse->named('Mr. Ed');
# print my $noise = Horse->speak;

# print Horse->name, "\n"; # "an unnamed Horse\n"と出力
# my $tv_horse = Horse->named('Mr. Ed');
# print $tv_horse->name, "\n"; # "Mr Ed.\n"と出力
# print $tv_horse->speak;
#
# # インスタンスメソッド
# $tv_horse->eat('hay');
# # クラスメソッド
# use Sheep;
# Sheep->eat('grass');

# # 色をつける
# $tv_horse->set_color('black-and-white'); # メソッドを呼んで 色の引数を渡す 色は $self->{color}に入る
# print $tv_horse->name, ' is colored ', $tv_horse->color, "\n";

# use Data::Dumper;
# my $tv_horse = Horse->named('Mr. Ed');
#
# # 一時的に色をつける
# {
#   my $old_color = $tv_horse->set_color('orange'); # orangeに一時的にして、元の色をold_colorに入れておく
#   print "keep $old_color  old  some thing processing... \n";
#   $tv_horse->set_color($old_color); # 取れてない
# }

my $tv_horse = Horse->named('Mr. Ed')
        ->set_color('grey')
        # ->set_age(4)
        # ->set_height('17 hands')
        ;

print $tv_horse->color;
