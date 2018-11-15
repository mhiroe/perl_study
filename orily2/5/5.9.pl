use strict;
use warnings;
use Data::Dumper;


my @logs = (
 "professor.hut gilligan.crew.hut 1250",
 "professor.hut lovey.howell.hut 910",
 "thurston.howell.hut lovey.howell.hut 120",
 "professor.hut lovey.howell.hut 450",
 "professor.hut laser3.copyroom.hut 2924",
);

my %total_bytes;
# while (<>) {
for ( @logs ) {
  # my ($source, $destination, $bytes) = split /\s/, $_;
  my ($source, $destination, $bytes) = split;
  $total_bytes{$source}{$destination} += $bytes;
}

for my $source (sort keys %total_bytes) {
  for my $destination (sort keys %{ $total_bytes{$source} }) {
    print "$source => $destination:",
    " $total_bytes{$source}{$destination} bytes\n";
  }
  print "\n";
}

print Dumper %total_bytes;
