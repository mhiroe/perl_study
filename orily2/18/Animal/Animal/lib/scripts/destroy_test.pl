use 5.006;
use strict;
use warnings;

use Cow;

# sub feed_a_cow_named {
#   my $name = shift;
#   my $cow = Cow->named($name);
#   $cow->eat('grass');
#   print "Returning from the subroutine.\n"; # サブルーチン終わるので$cowはここで解体される
# }
# print "Start of program.\n";
# my $outer_cow = Cow->named('Bessie');
# print "Now have a cow named ", $outer_cow->name, ".\n";
# feed_a_cow_named('Gwen');
# print "Returned from subroutine.\n";
# # script終わったので Bessieも死ぬ


{ package Barn;
  use Data::Dumper;
  sub new { bless [ ], shift } # 空の配列リファレンスを blessしている
  sub add { # 一番右のshift Cow->named('Bessie' された無名インスタンスが入る
    # my $either = shift;
    # print "now $either\n";
    # my $cow_adding = shift;
    # print "now2 $cow_adding\n";
    # push @{$cow_adding->name}, $either;
    push @{shift()}, shift;
  }
  sub contents {
     # print Dumper @{shift()}; #この配列の中は ２ひきのオブジェクトが入っている
     @{shift()}; # shift() は $barn が入る、それをデリファレンスするとcowオブジェクトを取り出せる
   }
  sub contents_show {
    print my $t = shift(); # $barnが入ってる
    print "\n";
    print @{$t}; # Cowが入ってる {}はデリファレンス
    print "\n";
    for ( @{$t} ) {
      print $_->name;
      print "\n";
    }
  }

  sub DESTROY {
  my $self = shift;
  print "$self is being destroyed...\n";
  for ($self->contents) {
    print ' ', $_->name, " goes homeless.\n"; }
  }
}

# my $barn = Barn->new;
# $barn->add(Cow->named('Bessie'));
# $barn->add(Cow->named('Gwen'));
# $barn->contents_show;
# print "Burn the barn:\n";
# $barn = undef;
# print "End of program.\n";

# ## 小屋の外でも生きていけるうしさん
# my $barn = Barn->new;
# my @cows = (Cow->named('Bessie'), Cow->named('Gwen')); # Barnパッケージの外でうしを作る
# $barn->add($_) for @cows;
# print "Burn the barn:\n";
# $barn = undef; #小屋はなくなるけど、うしは死なない(ホームレスになる)
# print "Lose the cows:\n";
# @cows = ( ); # うしを殺す
# print "End of program.\n";
