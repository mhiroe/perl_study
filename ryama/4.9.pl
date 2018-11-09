use strict;
use warnings;

my %gilligan_info = (
  name => 'Gilligan',
  hat => 'White',
  shirt => 'Red',
  position => 'First Mate',
);
my $hash_ref = \%gilligan_info;

# # print
# print my $name = $gilligan_info { 'name' };
# print my $name = ${$hash_ref}{'name'};

# print my $name = $$hash_ref{'name'};
# print my @keys =  keys %$hash_ref;
# print my $name = $hash_ref->{'name'};

## add member and make uppper array
my %skipper_info = (
  name => 'skipper',
  hat => 'black',
  shirt => 'Blue',
  position => 'Friend'
);
my @crew = (\%gilligan_info, \%skipper_info);

# # can write anystyle
# print ${ $crew[0] } { 'name' };
# my $ref = $crew[0];
# print $$ref{'name'};
# print $crew[0]->{'name'};
# print $crew[0]{'name'};

my $format = "%-15s %-7s %-15s\n";
foreach my $crewmember (@crew) {
  # printf $format,
    # $crewmember->{'name'},
    # $crewmember->{'shirt'},
    # $crewmember->{'hat'},
    # $crewmember->{'position'};
  printf $format, @$crewmember{qw(name shirt hat position)};
}

__END__
