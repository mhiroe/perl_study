use strict;
use warnings;
use feature 'say';

# my $command = 'ls -la';
# open my $pipe, '-|', $command # 外部コマンドからの入力
#   or die "Could not open filehandle: $!";
# while( <$pipe> ) {
#   print "Read: $_";
# }

# use IO::Pipe;
# my $pipe = IO::Pipe->new;
# # $pipe->reader( "$^X -V" ); # $^Xは現在のperl実行ファイル
# $pipe->reader( "ls -la" ); # $^Xは現在のperl実行ファイル
# while( <$pipe> ) {
#   print "Read: $_";
# }

# # コマンドに書き込み
# my $command = 'wc -l';
# open my $pipe, "| $command"
# or die "Could not open filehandle: $!";
# foreach ( 1 .. 10 ) {
#   print $pipe "I can count to $_\n";
# }

use IO::Pipe;
my $command = 'wc -l';
my $pipe = IO::Pipe->new;
$pipe->writer( $command );
foreach ( 1 .. 10 ) {
  print $pipe "I can count to $_\n";
}
