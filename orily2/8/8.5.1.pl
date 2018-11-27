use strict;
use warnings;

# ハンドルリファレンスを作る
use IO::File;
# my $fh = IO::File->new( "> \ my $castaways" ) or die "Could not create filehandle: $!"; # 文字列ハンドルは作れなさそう -> IO::Scalerでやるべき
my $fh = IO::File->new( '> castaways.log' ) or die "Could not create filehandle: $!";
