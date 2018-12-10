use Sheep;

use Data::Dumper;
my $lost = bless { Name => 'Bo', Color => 'white' }, 'Sheep';

print $lost->name;
print $lost->default_color; # Sheep.pm に無ければ Animal.pmのを使う
