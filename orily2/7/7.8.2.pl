use strict;
use warnings;

use feature 'say';

# もっと簡単なクロージャのダンプ
use Data::Dump::Streamer;
my @luxuries = qw(Diamonds Furs Caviar);

my $hash = {
  Gilligan => sub { say 'Howdy Skipper!' },
  Skipper => sub { say 'Gilligan!!!!' },'Mr. Howell' => sub { say 'Money money money!' },
  Ginger => sub { say $luxuries[rand @luxuries] },
};

# Dump::Streamerを使う
Dump $hash;
