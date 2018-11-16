use strict;
use warnings;

# use File::Find;
# sub create_find_callback_that_counts {
#     my $count = 0;
#     return sub { print ++$count, ": $File::Find::name\n" };
# }
# my $callback = create_find_callback_that_counts(); print "my bin:\n";
# find($callback, 'bin');
# print "my lib:\n";
# find($callback, 'lib');

use File::Find;
sub create_find_callback_that_sums_the_size {
  my $total_size = 0;
  return sub {
    $total_size += -s;
    # if (@_) { # ダミーの呼び出しの場合
    #   return $total_size;
    # }
    # else { # File::Find:からのコールバックの場合
    #   $total_size += -s if -f;
    # }
  };
}

my $callback = create_find_callback_that_sums_the_size( );
find($callback, 'bin');
# my $total_size = $callback->('dummy'); # dummy parameter to get size
my $total_size = $callback->();
print "total size of bin is $total_size\n";
