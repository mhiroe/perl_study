use strict;
use warnings;

{
  my @data1 = qw(one won);
  my @data2 = qw(two too to);
  push @data2, \@data1;
  push @data1, \@data2;
  # ... @data1,@data2を使う ...
  print $data2[3][2][3][2][3][0]; 
  # 最終に:
  @data1 = ( );
  @data2 = ( );
}

__END__
