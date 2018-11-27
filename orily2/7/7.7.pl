use strict;
use warnings;
use Data::Dumper;
use v5.10;


# # sort でも使える
# my @array = qw( a b c d e f 1 2 3 );
# print sort {
# # state $n = 0;
# my $n = 0; # カウンタが増えていかない
# print $n++, ": a[$a] b[$b]\n"; $a cmp $b;
# } @array;


# # mapでも使える
# ## sortは値で比較している [1]
# my @sorted_lines_tuples = sort { $b->[1] <=> $a->[1] } map { state $l = 0; [ $l++, $_ ] } <>;
#
# for (@sorted_lines_tuples){
#   print "$_->[0] : $_->[1]";
# }


use v5.10;
  sub add_to_tab {
  state @castaways = qw(Ginger Mary Ann Gilligan); # コンパイルエラー
  state %tab = map { $_, 0 } @castaways; # コンパイルエラー
  $countdown{'main'}--;
}

# use v5.10;
# sub add_to_tab {
#   my $castaway = shift;
#   state $castaways = qw(Ginger Mary Ann Gilligan); # うまくいく!
#   state %tab = map { $_, 0 } @$castaways; # うまくいく!
#   $tab->{$castaway}++;
# }


# 引数がレキシカル変数になり、クロージャ変数になる
# use File::Find;
# sub print_bigger_than {
#   my $minimum_size = shift;
#   return sub { print "$File::Find::name\n" if -f and -s >= $minimum_size };
# }
# my $bigger_than_1024 = \&print_bigger_than(10);
# print Dumper $bigger_than_1024;
# # find($bigger_than_1024, 'bin');


# サイズが指定したバイト数以上のファイルを見つける
use File::Spec::Functions qw(canonpath no_upwards);
use File::Find;
use feature 'say';

# 後述の簡単な方法
use Data::Dump::Streamer;

sub find_by_min_size {
  my $min = shift;
  my @files = ();
  sub { push @files, canonpath( $File::Find::name ) if -s $_ >= $min },
  sub { @files = no_upwards( @files ); wantarray ? @files : [ @files ] }
}

my $find_by_min_size10 = find_by_min_size(10);
find($find_by_min_size10, '.');

my ($getter, $total) = find_by_min_size(10);
find($getter, '.');
my @lines = $total->();
for (@lines) { print "$_\n"};

dump $total;
