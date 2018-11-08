use strict;
use warnings;

use Module::CoreList;
# cpan moduleのバージョンを調べる
print $Module::CoreList::version{5.01400}{CPAN};

__END__
