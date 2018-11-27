use strict;
use warnings;

my @input = qw(Gilligan Skipper Professor Ginger Mary_Ann);

my @sorted_positions =
  # aとbに添字が入ってしまうので 結果のリストは添字が入る
  sort { $input[$a] cmp $input[$b] } 0 .. $#input;
print "@sorted_positions\n";
print "\n";

# my @ranks[@sorted_positions] = (0..$#sorted_positions);
my @ranks;
# @ranks[ qw(5 0 3 4 2 1) ] = (0..$#sorted_positions);
@ranks[@sorted_positions] = (0..$#sorted_positions);
print @ranks;
# こんなことやってる
#5個目が -> 0位
#0 -> 1
#3 -> 2
#4 -> 3
#5 -> 4
