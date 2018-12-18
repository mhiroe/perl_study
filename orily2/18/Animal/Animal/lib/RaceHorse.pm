package RaceHorse;
use parent qw(Horse);

## Animal(親クラス)のコンストラクタの拡張
sub named {
  my $self = shift->SUPER::named(@_);
  # いろんなKeyを 0 にして初期化
  $self->{$_} = 0 for qw(wins places shows losses);
  $self;
}

# アクセスメソッド(アクセサ)
sub won { shift->{wins}++; } # オブジェクトからメンバ変数(wins)を呼び出しインクリメントする
sub placed { shift->{places}++; }
sub showed { shift->{shows}++; }
sub lost { shift->{losses}++; }
sub standings {
  my $self = shift;
  join ', ', map "$self->{$_} $_", qw(wins places shows losses);
}

1;
