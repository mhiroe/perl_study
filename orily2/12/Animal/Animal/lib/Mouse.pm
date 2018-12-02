package Cow;

use 5.006;
use strict;
use warnings;

package Mouse;
use parent qw(Animal);


sub sound { 'squeak' }

sub speak { ## Animal.pm と別の独自のメソッド
  my $class = shift;
  # Animalのメソッドを無理やり使う クラスが変わると継承できないのでよくない
  # Animal::speak($class);
  # Animalにspeakがなくても ここのspeak検索で引っかかる
  $class->Animal::speak(@_); # なぜ $classではなく @_なのか
  # 最初に見つかったものを使う
  # $class->SUPER::speak;
  print "a $class goes ", $class->sound, "!\n";
  print "[but you can barely hear it!]\n";
}

1;
