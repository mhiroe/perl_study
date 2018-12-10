package Animal;

use 5.006;
use strict;
use warnings;

# # speekを共通化する
# sub speak {
#   my $class = shift;
#   print "a $class says ", $class->sound, "!\n";
# }
#
# sub sound {
#   die 'You have to define sound() in a subclass'
# }

# sub name {
#   my $self = shift; # $self=クラス名
#   $$self;
# }

# クラスとインスタンスの両方に対応させる
sub name {
  my $either = shift;
  # ref $either ? $$either # インスタンスなので名前を返す
  ref $either ? $either->{Name} # ハッシュリファレンスから取得
  : "an unnamed $either"; # クラスなので汎用の値を返す
}

# sub named {
#   my $class = shift;
#   my $name = shift;
#   bless \$name, $class;
# }
sub named {
  my $class = shift;
  my $name = shift;
  my $self = { Name => $name, Color => $class->default_color };
  bless $self, $class;
}

sub speak {
  my $either = shift;
  # ref $either ? $$either # インスタンスなので名前を返す
  # : "an unnamed $either"; # クラスなので汎用の値を返す
  print $either->name, ' goes ', $either->sound, "\n";
}

sub eat {
  my $either = shift;
  my $food = shift;
  print $either->name, " eats $food.\n";
}

sub default_color { 'brown' }

# 自分の色を確かめる
sub color {
  my $self = shift;
  $self->{Color};
}

# デコンストラクタ
sub DESTROY {
  my $self = shift;
print '[', $self->name, " has died.]\n";
}



# # セッター
# sub set_color {
#   my $self = shift;
#   if (defined wantarray) {
#     # $self->{Color} = shift; # 引数を渡されたものをハッシュ化
#     my $old = $self->{Color}; # 元の色をoldに入れる
#     print $old,"   old \n";
#     $self->{Color} = shift; # 新しい色を入れる
#     print $self->{Color}, "  new \n";
#     return $old;
#   }
#   else {
#     $self->{Color} = shift;
#     print "previous color\n";
#   }
# }

# １つのオブジェクトにまとめる
sub set_color {
  my $self = shift;
  $self->{Color} = shift;
  print $self->{Color}, "  now \n";
  return $self; # オブジェクト自体を返す
}



=head1 NAME

Animal - The great new Animal!

=head1 VERSION

Version 0.01

=cut

our $VERSION = '0.01';


=head1 SYNOPSIS

Quick summary of what the module does.

Perhaps a little code snippet.

    use Animal;

    my $foo = Animal->new();
    ...

=head1 EXPORT

A list of functions that can be exported.  You can delete this section
if you don't export anything, such as for a purely object-oriented module.

=head1 SUBROUTINES/METHODS

=head2 function1

=cut

sub function1 {
}

=head2 function2

=cut

sub function2 {
}

=head1 AUTHOR

Gilligan, C<< <gilligan at island.example.com> >>

=head1 BUGS

Please report any bugs or feature requests to C<bug-animal at rt.cpan.org>, or through
the web interface at L<https://rt.cpan.org/NoAuth/ReportBug.html?Queue=Animal>.  I will be notified, and then you'll
automatically be notified of progress on your bug as I make changes.




=head1 SUPPORT

You can find documentation for this module with the perldoc command.

    perldoc Animal


You can also look for information at:

=over 4

=item * RT: CPAN's request tracker (report bugs here)

L<https://rt.cpan.org/NoAuth/Bugs.html?Dist=Animal>

=item * AnnoCPAN: Annotated CPAN documentation

L<http://annocpan.org/dist/Animal>

=item * CPAN Ratings

L<https://cpanratings.perl.org/d/Animal>

=item * Search CPAN

L<https://metacpan.org/release/Animal>

=back


=head1 ACKNOWLEDGEMENTS


=head1 LICENSE AND COPYRIGHT

Copyright 2018 Gilligan.

This program is free software; you can redistribute it and/or modify it
under the terms of the the Artistic License (2.0). You may obtain a
copy of the full license at:

L<http://www.perlfoundation.org/artistic_license_2_0>

Any use, modification, and distribution of the Standard or Modified
Versions is governed by this Artistic License. By using, modifying or
distributing the Package, you accept this license. Do not use, modify,
or distribute the Package, if you do not accept this license.

If your Modified Version has been derived from a Modified Version made
by someone other than you, you are nevertheless required to ensure that
your Modified Version complies with the requirements of this license.

This license does not grant you the right to use any trademark, service
mark, tradename, or logo of the Copyright Holder.

This license includes the non-exclusive, worldwide, free-of-charge
patent license to make, have made, use, offer to sell, sell, import and
otherwise transfer the Package with respect to any patent claims
licensable by the Copyright Holder that are necessarily infringed by the
Package. If you institute patent litigation (including a cross-claim or
counterclaim) against any party alleging that the Package constitutes
direct or contributory patent infringement, then this Artistic License
to you shall terminate on the date that such litigation is filed.

Disclaimer of Warranty: THE PACKAGE IS PROVIDED BY THE COPYRIGHT HOLDER
AND CONTRIBUTORS "AS IS' AND WITHOUT ANY EXPRESS OR IMPLIED WARRANTIES.
THE IMPLIED WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR
PURPOSE, OR NON-INFRINGEMENT ARE DISCLAIMED TO THE EXTENT PERMITTED BY
YOUR LOCAL LAW. UNLESS REQUIRED BY LAW, NO COPYRIGHT HOLDER OR
CONTRIBUTOR WILL BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, OR
CONSEQUENTIAL DAMAGES ARISING IN ANY WAY OUT OF THE USE OF THE PACKAGE,
EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.


=cut

1; # End of Animal
