use strict;
use warnings;
use Data::Dumper;


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

sub find_by_min_size {
  my $min = shift;
  my @files = ();
  sub { push @files, canonpath( $File::Find::name ) if -s $_ >= $min },
  sub { @files = no_upwards( @files );wantarray ? @files : [ @files ] }
}

my $find_by_min_size10 = find_by_min_size(10);
find($find_by_min_size10, 'bin');

# クロージャ変数取り出し方わからん..
print "@files";
