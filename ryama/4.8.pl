use strict;
use warnings;



## data declation
my @skipper = qw(blue_shirt hat jacket preserver sunscreen);
my @skipper_with_name = ('Skipper' => \@skipper);

my @professor = qw(sunscreen water_bottle slide_rule batteries radio);
my @professor_with_name = ('Professor' => \@professor);

my @gilligan = qw(red_shirt hat lucky_socks water_bottle);
my @gilligan_with_name = ('Gilligan' => \@gilligan);

my @all_with_names = ( \@skipper_with_name, \@professor_with_name, \@gilligan_with_name,);


# #for my $person (@all_with_names) {
#   my $who = $$person[0];
#   my $provisions_reference = $$person[1];
#   check_required_items($who, $provisions_reference);
# }

# ## most short
# for my $person (@all_with_names) {
#   check_required_items(@$person);
# }

## Gillian's first item
my $root = \@all_with_names;

# # ex.0
# print ${${${$root}[2]}[1]}[0];

# # ex.1
# print $root->[2]->[1]->[0];

# # ex.2
# print  $root -> [2][1][0];
# print "@{$root->[2][1]}";


sub check_required_items {
  my $who = shift;
  my $items = shift;
  print "initial items: @$items\n";
  my %whose_items = map { $_, 1 } @$items;
  my @required = qw(preserver sunscreen water_bottle jacket);
  my @missing = ( );

  for my $item (@required) {
    unless ( $whose_items{$item} ) { # 持っていないものはあるか?
    print "$who is missing $item.\n";
    push @missing, $item; }
  }
  if (@missing) {
    print "Adding @missing to @$items for $who.\n";
    push @$items, @missing;
    print "final items:  @$items\n\n";
  }
}

__END__
