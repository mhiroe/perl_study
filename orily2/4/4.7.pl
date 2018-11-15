use strict;
use warnings;

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

my @skipper = qw(blue_shirt hat jacket preserver sunscreen);
check_required_items('The Skipper', \@skipper);

my @professor = qw(sunscreen water_bottle slide_rule batteries radio);
check_required_items('Professor', \@professor);

my @gilligan = qw(red_shirt hat lucky_socks water_bottle);
check_required_items('Gilligan', \@gilligan);

__END__
