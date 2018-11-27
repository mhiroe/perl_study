use strict;
use warnings;
use Data::Dumper;

# シュワルツ変換

# my @output_data =
#   map { 抽出 },
#   sort { 比較 }
#   map [ 構築 ],
# @input_data;

# 大文字小文字区別しないソート
use v5.16;

my @input_data = qw(Ca Bd Fe Zc aa);

print my @output_data =
 # map $_->[0],
 # sort { $a->[1] cmp $b->[1] }
 # map [ $_, "\F$_" ],
 map $_->{ORGINAL},
 sort { $a->{FOLDED} cmp $b->{FOLDED} }
 map { ORIGINAL => $_, FOLDED => "\F$_" },
@input_data;

# # print Dumper @output_data;
# for (@output_data) {
#   print $_->{ORIGINAL};
#   print "\n";
# }


# print Dumper $output_data->{FOLDED};
