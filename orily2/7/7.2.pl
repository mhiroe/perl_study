use strict;
use warnings;
use Data::Dumper;

my %greets = (
    # 最初から無名ハッシュrefを埋め込む
    Skipper => sub {
        my $person = shift;
        print "Skipper: Hey there, $person!\n"; },
    Gilligan => sub {
        my $person = shift;
        if ($person eq 'Skipper') {
            print "Gilligan: Sir, yes, sir, $person!\n"; } else {
            print "Gilligan: Hi, $person!\n"; }
    },
    Professor => sub {
        my $person = shift;
        print "Professor: By my calculations, you must be $person!\n";
    },

    Ginger => sub {
        my $person = shift;
        print "Ginger: (in a sultry voice) Well hello, $person!\n";
    },
);

# print Dumper %greets;

my @room; # 初期状態は空
for my $person (qw(Gilligan Skipper Professor Ginger)) {
    print "\n";
    print "$person walks into the room.\n";
    for my $room_person (@room) {
        $greets{$person}($room_person); # あいさつをする # これは -> 省略できる
        # $greets{$room_person}->($person); # あいさつを返す
    }
    push @room, $person; # 部屋に入り、くつろぐ
}
