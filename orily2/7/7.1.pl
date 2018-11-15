use strict;
use warnings;

sub skipper_greets {
  my $person = shift;
  print "Skipper: Hey there, $person!\n";
}


# # シンプルなcode_ref;
# my $ref_to_greeter = \&skipper_greets;
# & $ref_to_greeter ( 'Gilligan' );
# $ref_to_greeter -> ( 'Gilligan' );


sub gilligan_greets {
  my $person = shift;
  if ($person eq 'Skipper') {
    print "Gilligan: Sir, yes, sir, $person!\n";
  }
  else {
    print "Gilligan: Hi, $person!\n";
  }
}

sub professor_greets {
  my $person = shift;
  print "Professor: By my calculations, you must be $person!\n";
}

# hash ref化
my %greets = (
  Skipper   => \&skipper_greets,
  Gilligan  => \&gilligan_greets,
  Professor => \&professor_greets,
);

# my @everyone = sort keys %greets;
# for my $greeter (@everyone) {
#   for my $greeted (@everyone) {
#     $greets{$greeter}->($greeted)
#     unless $greeter eq $greeted; # 自分には挨拶しない
#   }
# }

# 部屋にいる人に挨拶する
my @room; # 初期状態は空
for my $person (qw(Gilligan Skipper Professor)) {
  print "\n";
  print "$person walks into the room.\n";
  for my $room_person (@room) {
    $greets{$person}($room_person); # あいさつをする
    # $greets{$room_person}->($person); # あいさつを返す
  }
  push @room, $person; # 部屋に入り、くつろぐ
}
