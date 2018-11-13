use strict;
use warnings;

# 一の位と十の位を分離して足して２で割れる値を取り出す
my @input_numbers = (1, 2, 4, 8, 16, 32, 64);

my @indices_of_odd_digit_sums = grep {
  my $number = $input_numbers[$_];
  my $sum;
  $sum += $_ for split //, $number; $sum % 2;
} 0..$#input_numbers;

# 配列スライスで値を取り出す
my @odd_digit_sum = @input_numbers[ @input_numbers ];
