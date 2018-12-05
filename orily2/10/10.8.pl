use strict;
use warnings;

use 5.10.0;

# ディレクトリ構造を再帰的に定義する
sub data_for_path {
  my $path = shift;
  if (-f $path) {
    return undef;
  }
  if (-d $path) { # $pathがディレクトリならば
    my %directory;
    opendir PATH, $path or die "Cannot opendir $path: $!";
    my @names = readdir PATH; # readdir ディレクトリ内のファイルやディレクトリの名前を取得する
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

# use Data::Dumper;
# print Dumper(data_for_path('../7/'));

# my $dir = data_for_path('../');
# say for (keys $dir->{7}{bin});
# say $$dir{7};

# print Dumper $dir;

sub dump_data_for_path {
  my $path = shift;
  my $data = shift;

  if (not defined $data) { # ファイルの場合
    print "$path\n";
    return;
  }

  my %directory;
  foreach (sort keys %$data) { #一個ずつファイルかディレクトリを評価する
    # dump_data_for_path("$path/$_", $directory{$_});
    # print "$_\n";
    print $directory{$_};
  }

}

# 再帰的に定義されたデータを表示する
dump_data_for_path('../7/bin', data_for_path('../7/bin'));
