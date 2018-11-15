use strict;
use warnings;

use Carp qw(croak);
## HASHという名前で評価対象 hash を取得する
use constant HASH => ref {};
## オブジェクトを指定して誤らないように refではなくて reftypeを使う
use Scalar::Util qw(reftype);

# my $order_ref = {
#   food => 1,
#   drink => 2,
# };


# ohh.. wrong ref type
my $order_ref = [
  food => 1,
  drink => 2,
];

show_hash($order_ref);

sub show_hash {
  my $hash_ref = shift;
  # my $ref_type = ref $hash_ref;
  # my $ref_type = reftype $hash_ref;
  # croak "I expected a hash reference!"
  # unless $ref_type eq 'HASH';
  # unless $ref_type eq ref {}; # HASH という文字を消したい {}を使って評価するのがhashであることを示す
  # unless $ref_type eq HASH; # 冒頭のconstantで作った エイリアスみたいな HASH を使う
    foreach my $key ( %$hash_ref ) {
       print "$$hash_ref{$key}\n";
  }
}

# check ref
sub is_hash_ref {
  my $hash_ref = shift;
  my $ref_type = reftype $hash_ref;
  return eval {
    keys %$ref_type;
    1
  };
}
croak "I expected a hash reference!"
unless is_hash_ref( $ref_type );

__END__
