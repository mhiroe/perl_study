#!/Users/mitsuki.hiroe/.anyenv/envs/plenv/shims/perl/bin/perl

use strict;
use warnings;

use Time::Piece;
use Time::Seconds;

my $t = localtime;
$t += ONE_DAY;

print "$t"

#my $t2 = localtime;
#my $s = $t - $t2;

#print "Difference is: ", $s->days, "\n";


#my $string = "a tonne of feathers or a tdddonne of bricks";
#
#my $matches = $string =~ m/(\w+)/g;
#print "'".$1."'\n";
#
#-> 'a'
#my @matches = $string =~ m/(\w+)/g;
#print @matches;
##-> tonneoffeathersoratonneofbricks
