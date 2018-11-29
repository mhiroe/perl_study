use strict;
use warnings;
use Data::Dumper;

use File::Basename;
use File::Spec::Functions;

# my $data = data_for_path( '/Users/mitsuki.hiroe/w/perl_study/orily2/7' );
my $data = data_for_path( '/Users/mitsuki.hiroe/w/perl_study/orily2/7', 2 ); # 探索する階層の優先度を設定

sub data_for_path {
  # my( $path ) = @_;
  my( $path, $threshold ) = @_;
  my $data = {};

  # my @queue = ( [ $path, $data ] );
  my @queue = ( [ $path, 0, $data ] );
  while( my $next = shift @queue ) {
    # my( $path, $ref ) = @$next;
    my( $path, $level, $ref ) = @$next;
    my $basename = basename( $path );

    $ref->{$basename} = do {
      if( -f $path or -l $path ) { undef }
      else {
        my $hash = {};
        if( $level < $threshold ) {
          # opendir my $dh, $path ;
          opendir my ( $dh ), $path;
          my @new_paths = map {
            catfile( $path, $_ )
          } grep { ! /^\.\.?\z/ } readdir $dh;

          # unshift @queue, map { [ $_, $hash ] } @new_paths;
          push @queue, map { [ $_, $level+1, $hash ] } @new_paths;
          $hash;
      }
    };
  }
  $data;
}

# print Dumper $data;
