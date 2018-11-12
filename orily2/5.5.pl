use strict;
use warnings;
use Data::Dumper;

## 無名配列
sub get_provisions_list {
  return (
    ['The Skipper',
    [qw(
      blue_shirt
      hat jacket
      preserver
      sunscreen)
    ]
    ],
    ['The Professor',
      [qw(sunscreen water_bottle slide_rule batteries radio) ]
    ],
      ['Gilligan',
      [qw(red_shirt hat lucky_socks water_bottle) ]
      ],
    ['Mrs. Howell',
      [ ] # 無名空配列リファレンス
  ],
    );
}

my @all_with_names = get_provisions_list( );
print Dumper @all_with_names;

## 無名ハッシュ
my @crew = ({
  name => 'Gilligan',
  hat => 'White',
  shirt => 'Red',
  position => 'First Mate',
  },
  {
    name => 'Skipper', hat => 'Black', shirt => 'Blue', position => 'Captain',
  },
);

print Dumper @crew;
