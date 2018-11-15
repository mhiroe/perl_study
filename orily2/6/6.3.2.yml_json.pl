use strict;
use warnings;

use Data::Dumper;
use YAML;
use JSON;

my @logs = (
 "professor.hut gilligan.crew.hut 1250",
 "professor.hut lovey.howell.hut 910",
 "thurston.howell.hut lovey.howell.hut 120",
 "professor.hut lovey.howell.hut 450",
 "professor.hut laser3.copyroom.hut 2924",
);

my %total_bytes;
#  while (<>) {
for ( @logs ) {
    my ($source, $destination, $bytes) = split;
    $total_bytes{$source}{$destination} += $bytes;
}

# print Dump(\%total_bytes);

# print to_json( \%total_bytes, { pretty => 1 } );
# print $json_string to_json( \%total_bytes, { pretty => 1 } );
my $json_string = to_json( \%total_bytes );

# json to perl data structure
my $hash_ref = from_json( $json_string );
print Dumper $hash_ref;
