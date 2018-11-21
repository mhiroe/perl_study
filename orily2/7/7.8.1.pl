use strict;
use warnings;

# use v5.10;
#   my @array = ( \'xyz', [qw(a b c)], sub { say 'Buster' } );
# foreach ( @array ) {
#   when( ref eq ref \'' ) { say "Scalar $$_" } # スカラーのリファレンス
#   when( ref eq ref [] ) { say "Array @$_" } # arrayのリファレンス
#   when( ref eq ref sub {} ) { say "Sub ???" } # サブルーチンのリファレンス
# }

# サブルーチンの中身をダンプする
use v5.14;
package MagicalCodeRef 1.00 {
  use overload '""' => sub { # 文字列化ルーチンをオーバーロード
    require B;# perl の構文木を見てさまざまなことを実行するB でファイル名と行番号を取得

    my $ref = shift;
    my $gv = B::svref_2object($ref)->GV;

    require B::Deparse;
    my $deparse = B::Deparse->new;
    my $code = $deparse->coderef2text($ref); # perlの内部コードを人間が読めるようにする

    my $string = sprintf "---code ref---\n%s:%d\n%s\n---",
    $gv->FILE, $gv->LINE, $code; # 展開するもの
  };
  sub enchant { bless $_[1], $_[0] }
}

# 実際に^のダンパーを使ってみる
# my $sub = MagicalCodeRef->enchant( sub { say 'Gilligan!!!' } );
# クロージャにした場合
my $sub = do {
  my $name = 'Gilligan';
  MagicalCodeRef->enchant( sub { say "$name!!!" } );
};

my @array = ( \ 'xyz', [qw(a b c)], $sub );
foreach ( @array ) {
 when( ref eq ref \ '' ) { say "Scalar $$_" }
 when( ref eq ref [] ) { say "Array @$_" }
 when( ref eq 'MagicalCodeRef' ) { say "Sub $sub" } # これが展開できれば成功
}
