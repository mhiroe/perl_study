use strict;
use warnings;

sub data_for_path {
  my $path = shift;
  if (-f $path) {
    return undef;
  }
  if (-d $path) {
    my %directory;
    opendir PATH, $path or die "Cannot opendir $path: $!";
    my @names = readdir PATH; # readdir いくつかディレクトリ名を取得する
    closedir PATH;
    for my $name (@names) {
      next if $name eq '.' or $name eq '..';
      $directory{$name} = data_for_path("$path/$name"); # 再帰処理
    }
    return \%directory;
  }
  warn "$path is neither a file nor a directory\n";
  return undef;
}


use Data::Dumper;
print Dumper(data_for_path('../../'));


# sub data_for_path {
#   my $path = shift;
#   if (-f $path or -l $path) { # ファイルまたはシンボリックリンクの場合
#   return undef; }
#   if (-d $path) {
#     my %directory;
#     opendir PATH, $path or die "Cannot opendir $path: $!"; my @names = readdir PATH;
#     closedir PATH;
#     for my $name (@names) {
#       next if $name eq '.' or $name eq '..';
#       $directory{$name} = data_for_path("$path/$name");
#     }
#     return \%directory;
#   }
#   warn "$path is neither a file nor a directory\n";
#   return undef;
# }
