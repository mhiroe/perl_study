package Cow;
use Moose;
use namespace::autoclean;

with 'Animal';
sub default_color { 'spotted' }
sub sound { 'moooooo' }
__PACKAGE__->meta->make_immutable;

1;
