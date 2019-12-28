package Sheep;
use Moose;
use namespace::autoclean;
with 'Animal';

sub default_color { 'black' }
sub sound { 'baaaah' }

__PACKAGE__->meta->make_immutable;
1;
