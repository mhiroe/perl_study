use strict;
use warnings;

my %provisions = (
'The Skipper' => [qw(blue_shirt hat jacket preserver sunscreen) ],
'The Professor' => [qw(sunscreen water_bottle slide_rule batteries radio) ],
'Gilligan' => [qw(red_shirt hat lucky_socks water_bottle) ],
);

# 持ち物が5こ未満の人
# print my @packed_light = grep @{ $provisions{$_} } < 5, keys %provisions;

for ( keys %provisions ) {
  # print if @{$provisions{$_}} <  5;
  print @{$provisions{$_}};
}
