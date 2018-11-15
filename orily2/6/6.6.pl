use strict;
use warnings;
use Data::Dumper;

my %provisions = (
'The Skipper' => [qw(blue_shirt hat jacket preserver sunscreen) ],
'The Professor' => [qw(sunscreen water_bottle slide_rule batteries radio) ],
'Gilligan' => [qw(red_shirt hat lucky_socks water_bottle) ],
);

# 既存のデータ構造から新たなデータを作る

# 持ち物が5こ未満の人
print my @packed_light = grep @{ $provisions{$_} } < 5, keys %provisions;

# ^の検証
for ( keys %provisions ) {
  # print if @{$provisions{$_}} <  5;
  my @nums = @{$provisions{$_}};
  print "$_ has under5" if @nums < 5; # if は @ をスカラー評価する
  print "\n";
}

# # 水筒を持ってる人だけでデータを作る
# my @all_wet = grep {
#   my @items = @{ $provisions{$_} };
#     grep $_ eq 'water_bottle', @items; #water_bottle が一致した場合だけ、keyを @all_wetに返す
# } keys %provisions;
# print "@all_wet";

# # mapを使う
# my @remapped_list = map {
#   my $name = $_ ;
#   [ $name , $name , $provisions{$name} ]; # この中は配列 $provisions{$_} は配列リファレンス
#   # $name; # 2回目は使えない
# } keys %provisions;
#
# print Dumper @remapped_list;

# # mapを使う２
# my @person_item_pairs = map {
#   my $person = $_;
#   my @items = @{ $provisions{$person} };
#     # map [$person => $_], @items;
#     # map [$person, $_], @items; # 配列ならこれでもok
#     map { { $person => $_, } } @items; # 無名ハッシュに入れるならこれ } , という使い方ができない
# } keys %provisions;
# print Dumper @person_item_pairs;
