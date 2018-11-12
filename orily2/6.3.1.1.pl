use strict;
use warnings;

use Data::Dumper;
use Storable qw(freeze thaw dclone);


my @provisions = qw( hat suncreen );
my @science_kit = qw( microscope radio );
push @provisions, \@science_kit;

# # freezen と thaw
# my $frozen = freeze \@provisions;
# my @packed = @{ thaw $frozen };

# ワンステップでやっちゃう
my @packed = @{ dclone \@provisions };

push @packed, 'blue_shirt';
push @{ $packed[2] }, 'batteries';
print Data::Dumper->Dump( [ \@provisions ],[ qw( *provisions ) ] );
print Data::Dumper->Dump( [ \@packed ],[ qw( *packed ) ]);
