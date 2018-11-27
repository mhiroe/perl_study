use strict;
use warnings;
use Data::Dumper;

# print "1. This goes to the real standard output\n";
# my $string;
# {
#   # STDOUTを潰してから、新たに文字列のfhを STDOUTとしてopenする
#   local *STDOUT;
#   open STDOUT, '>', \ $string;
#   print "2. This goes to the string\n";
#   # $some_obj->noisy_method(); # このSTDOUTは$stringにも送られる
#   print Dumper \$string; # 標準出力潰しているので何も出ない
# }
# print "3. This goes to the real standard output\n";

# 何かしらの配列を fhに送る
sub output_to_fh {
  my( $fh, @data ) = @_;
  print $fh @data;
}

# fhの種類を 文字列に固定して ^のsubをwrapする
sub as_string {
  my( @data ) = @_;
  open my $string_fh, '>', \ my $string;
  output_to_fh( $string_fh, @data );
  print Dumper $string; # これはなに？
  print $string;
}

my @test= (1, 2, 3, 4, 5);
as_string( @test ); # fhに送るのはいいけど取り出し方がわからん


# open my $open_string_fh, '<', \my $string;
# for my $line ( <$open_string_fh> ) {
#   print $line;
# }
