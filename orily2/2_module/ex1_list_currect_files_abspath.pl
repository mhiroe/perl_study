use strict;
use warnings;

# ryama method

use File::Spec;
use Cwd 'getcwd';

my $cur_dir = getcwd;
opendir my $dh, $cur_dir or die "Cannot open $cur_dir: $!";
while (my $file = readdir $dh) {
  my $filespec = File::Spec->catfile( $cur_dir, $file );
  print "    $filespec\n";
}

# alpaca method

# use File::Spec::Functions;
# use Cwd 'getcwd';
# my $cur_dir = getcwd;
# opendir my $dh, $cur_dir or die "dead";
# while (my $file = readdir $dh) {
#   next if $file =~ /^\./;
#   $file = catfile ( $cur_dir,$file);
#   print "   $file\n";
#   next unless -f $file and -r $file;
# }
