use 5.006;
use strict;
use warnings;

use Horse;

my @tv_horses = map { Horse->named($_) } ('Trigger', 'Mr. Ed');
$_->eat('an apple') for @tv_horses; # 最後の晩餐
print "End of program.\n";
