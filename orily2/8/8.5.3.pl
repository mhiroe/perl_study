use strict;
use warnings;
use Data::Dumper;

use IO::Scalar;

# # スカラーリファレンス へ書き込み
# my $string_log = '';
# my $scalar_fh = IO::Scalar->new( \$string_log );
# print $scalar_fh "The Gilligan' private beach club is closed\n";
#
# print Dumper $string_log;

# 読み出し
my $string_log = '';
my $scalar_fh = IO::Scalar->new( \$string_log );
while( <$scalar_fh> ) { next unless /Gilligan/; print;}
