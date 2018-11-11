use strict;
use warnings;
use File::Spec;

my %homedir;
my $filespec = File::Spec->catfile( $homedir{gilligan}, 'web_docs', 'photos', 'USS_Minnow.gif' );
# my $filespec = File::Spec->catfile( $homedir{mon}, 't' );
print $filespec;
