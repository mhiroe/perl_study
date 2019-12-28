package Horse;
use Moose;

# has 'name'  => ( is => 'rw' );
# has 'color' => ( is => 'rw' );
#
# no Moose;
#
# __PACKAGE__->meta->make_immutable;
# 1;

# Animalから継承する

package Horse;
use Moose;
use namespace::autoclean;
# extends 'Animal';

# roleを使うときは with
with 'Animal';
sub sound {'neigh2'}

# defalut colorを要求されるようにしたため
sub default_color { 'brown' }


# # 属性を追加
# has 'sound' => ( is => 'ro', default => 'neigh' );

__PACKAGE__->meta->make_immutable;

1;
