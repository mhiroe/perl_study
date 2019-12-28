package Animal;
# use Moose;
use namespace::autoclean;

use Moose::Role;
# requires qw( sound );
requires qw( sound default_color );
# 全てのクラスは独自のsoundを定義してもらう

# has 'sound' => (
#   is => 'ro',
#   default => sub {
#     confess shift, " needs to define sound!"
#   }
# );

# デフォルト値を設定する
has 'color' => (
  is => 'rw',
  default => sub { shift->default_color }
);


has 'name' => ( is => 'rw' );
has 'color' => ( is => 'rw' );

sub speak {
  my $self = shift;
  print $self->name, " goes ", $self->sound, "\n";
}

# roleを使ってるときは使えない
# __PACKAGE__->meta->make_immutable;
1;
