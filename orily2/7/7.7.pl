use strict;
use warnings;
use Data::Dumper;
use v5.10;


# # sort でも使える
# my @array = qw( a b c d e f 1 2 3 );
# print sort {
# # state $n = 0;
# my $n = 0; # カウンタが増えていかない
# print $n++, ": a[$a] b[$b]\n"; $a cmp $b;
# } @array;


# # mapでも使える
# ## sortは値で比較している [1]
# my @sorted_lines_tuples = sort { $b->[1] <=> $a->[1] } map { state $l = 0; [ $l++, $_ ] } <>;
#
# for (@sorted_lines_tuples){
#   print "$_->[0] : $_->[1]";
# }


use v5.10;
  sub add_to_tab {
  state @castaways = qw(Ginger Mary Ann Gilligan); # コンパイルエラー
  state %tab = map { $_, 0 } @castaways; # コンパイルエラー
  $countdown{'main'}--;
}

# use v5.10;
# sub add_to_tab {
#   my $castaway = shift;
#   state $castaways = qw(Ginger Mary Ann Gilligan); # うまくいく!
#   state %tab = map { $_, 0 } @$castaways; # うまくいく!
#   $tab->{$castaway}++;
# }
