use strict;
use warnings;


my $ref;

{
  # ブロックの中のスコープでしか@skpperは存在しなし
  my @skipper = qw(blue_shirt hat jacket preserver sunscreen);
  $ref = \@skipper;
  print "$ref->[2]\n"; # jacket\nを表示
}

print "$ref->[2]\n"; # ここでもまだjacket\nを表示、参照カウントは1 @skipperがなくなり無名配列になる
$ref = undef; #消える
print $ref; # 値なし

__END__
