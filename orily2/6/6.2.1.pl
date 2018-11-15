use strict;
use warnings;


my %total_bytes = (
  'thurston.howell.hut' => {
    'lovey.howell.hut'
  },
  'ginger.girl.hut' => {
    'maryann.girl.hut' => 199,
    'professor.hut' => 2318,
  },
  'professor.hut' => {
    'gilligan.crew.hut' => 1250,
    'lovey.howell.hut' => 1360
  }
);


# Dmupのサブルーチンの dumpを使う
use Data::Dump qw(dump);

dump( \%total_bytes );
