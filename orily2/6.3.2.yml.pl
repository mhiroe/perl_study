use strict;
use warnings;

use YAML;

# my @provisions = (
#     'hat', 'suncreen',
#         [
#             'microscope',
#             'radio'
#         ]
# );
# my @packed = (
#     'hat', 'suncreen',
#         [
#             'microscope',
#             'radio',
#             'batteries'
#         ],
#     'blue_shirt'
# );
# my @all_data = [ @provisions, @packed ];


my %total_bytes;
#  while (<>) {
for ( @all_data ) {
    my ($source, $destination, $bytes) = split;
    $total_bytes{$source}{$destination} += $bytes;
}

print Dump(\%total_bytes);
