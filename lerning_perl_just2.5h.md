# ２時間半で学ぶPerl (復習用)

- 原文(翻訳版)
  - https://qntm.org/files/perl/perl_jp.html
  - By Sam Hughes, translated by Kato Atsusi

Perlは動的な、動的型付けの、高級な、スクリプト(インタープリタで解釈される)言語で、PHPやPythonとともによく比較されます。  
Perlのシンタックスは、昔のshellスクリプトツールから多くの部分を借りており、それにより混乱させるシンボルを使い過ぎていることで有名です。  

それらの大多数をGoogleで検索することは不可能です。  

Perlのshellスクリプトから受け継いだ遺産は、glueコード(他のスクリプトやプログラムと一緒にリンクされているスクリプト)を書くのに、大変役に立ちます。  
Perlは、理想的にテキストデータを処理することや、テキストデータを生成するのに適しています。Perlは広く行き渡り、有名であり、極めてポータブルで、十分にサポートされています。

- Perlは"There's More Than One Way To Do It(やり方はひとつじゃない)" (TMTOWTDI)の哲学でデザインされました
- (Pythonと比較すると、"there should be one - and preferably only one - obvious way to do it(明らかなやり方は、ひとつであるべきであり、むしろひとつのみであるべき)")。

Perlには恐ろしいところがありますが、それを補って余りある良さもあります。  
その点で、今までに作られた全ての他のプログラミング言語と同じです。

このドキュメントは、情報を与えることを意図しており、熱心に普及させるものではありません。

以下のような、私のような人向けのものです:
- 技術的過ぎて、一般的ではないエッジケースに多くの部分を割いているhttp://perl.org/にある、公式のPerlのドキュメントが嫌い
- "原理と例"で新しいプログラミング言語さっさと学びたい
- Larry Wallにはっきり言ってほしいと思っている
- 一般的な用語でプログラムすることをすでに知っている
- 仕事を終えるために何が必要かということ以上のことをPerlについて気にしない
- このドキュメントは可能な限り短くしていますが、足らないことのないようにしています。

### 前書き

- 以下のことを、このドキュメント内のほとんどすべての宣言文で言うことが出来ます:
  - "これは、厳格な意味での、真実ではありません; 状況は実際にはもっと複雑です"。もし深刻な嘘を見つけたら、指摘してください。ですが、私には子どもにつく重要な嘘をそのままにしておく権利があります。

  - このドキュメントを通して、例においてprintステートメントをデータを出力するために使っていますが、明示的に改行を追加していません。
- これは、私を気違いにさせないためであり、それぞれのケースで出力される、より重要な実際の文字列に多くの注意を向けさせるためです。
  - 多くの例で、実際にコードを動かすと、alotofwordsallsmusheduptogetherononelineのような結果になります。無視してください。

### Hello world
Perlスクリプトは.plという拡張子のテキストファイルです。
helloworld.plは以下のようになります:

```
use strict;
use warnings;

print "Hello world";
```
PerlスクリプトはPerlインタープリタ、perlかperl.exeで解釈されます:

```
perl helloworld.pl [arg0 [arg1 [arg2 ...]]]
```

当面のメモとしていくつか。  
Perlのシンタックスはかなり寛大なので、結果として振る舞いを予測できない曖昧に見えるようなセンテンスを書くことをあなたに許します。  
私にとっては意味がないので、それらの振る舞いに関して説明しません。なぜなら、あなたはそれらを避けたいでしょうから。  
それらを避ける方法は、use strict;use warnings;を、あなたの作る全てのperlスクリプトやモジュールの上の方に置くことです。  

use fooのステートメントは`プラグマ`です。プラグマはPerl.exeへのシグナルです。プログラムが走り始める前に、最初のシンタックスチェックをする方法を変更します。
これらの行はコンパイル時に影響し、実行時にはインタープリタが出くわしても影響を受けません。

セミコロン;はステートメントの終わりです。  
シンボル#はコメントの開始です。コメントは行末で終わります。Perlには、  
ブロックコメントのシンタックスはありません。

### 変数
Perlの変数には次の3タイプあります:   
- スカラ
- 配列
- ハッシュ  
それぞれのタイプには、自身のシジル(sigil)があります:
それぞれ、$, @ and %。 変数はmyで宣言され、ブロックかファイルの最後までスコープ内に残ります。

`シジル: 記号、紋章、線形`  
`スコープ=変数やメソッドが有効な範囲 スコープの中でのみ有効、スコープの外からは見えない = レキシカルであること`


#### スカラ変数
スカラ変数は以下のものを格納できます:

- undef (PythonにおけるNone、PHPのnullに対応)
- 数字 (Perlはintegerとfloatを区別しません)
- 文字
- 他の変数へのリファレンス

```
my $undef = undef;
print $undef; # prints the empty string "" and raises a warning

# implicit undef:
my $undef2;
print $undef2; # prints "" and raises exactly the same warning
my $num = 4040.5;
print $num; # "4040.5"
my $string = "world";
print $string; # "world"
```
(リファレンスは後で説明します)

文字列の連結には.演算子を使います(PHPと同じ):

```
print "Hello ".$string; # "Hello world"
```
#### 真偽値
Perlにはブーリアンのデータ型はありません。
ifステートメントではスカラは、以下のいずれかの場合にのみ"偽"として評価されます:

- undef
- number 0
- string ""
- string "0".

Perlのドキュメントでは、繰り返し、特定の状況で"真"か"偽"の値を関数が返すように主張しています。
実際には、関数が真を返すように主張しているときは、普通1を返します。また、関数が偽を返すように主張しているなら、普通は空文字""を返します。

`空文字が入っている場合、falseとしている`

#### 弱い型付け

スカラーに"数字"か"変数"のいずれかが入っているのかを判断することはできません。より正確には、そんなことは見当違いです。  
Perlはその点で弱い型付けです。 スカラが数字か文字のどちらかのように振舞うかは、使われる演算子によります。  
文字列として使えば、スカラは文字列のようにふるまいます。
数字として使えば、スカラは数字のようにふるまいます(また、そうすることが出来なければ、警告を発します):

```
my $str1 = "4G";
my $str2 = "4H";

print $str1 .  $str2; # "4G4H"
print $str1 +  $str2; # "8" with two warnings
print $str1 eq $str2; # "" (empty string, i.e. false)
print $str1 == $str2; # "1" with two warnings

# The classic error
print "yes" == "no"; # "1" with two warnings; both values evaluate to 0 when used as numbers
```

このレッスンでは、正しい状況で正しい演算子を使うようにしています。
数字としてスカラを比較するのと、文字列としてスカラを比較するのとでは、演算子を区別します。:

> 数字用の演算子:  <,  >, <=, >=, ==, !=, <=>
> 文字用の演算子:  lt, gt, le, ge, eq, ne, cmp, ., x

#### 配列変数

配列変数は整数の0で始まるはじまるインデックスされたスカラです。  
Pythonでは、listで、PHPでは、arrayです。  
配列は丸括弧を使って宣言される、配列のリストです。  
```
my @array = (
	"print",
	"these",
	"strings",
	"out",
	"for",
	"me", # カンマを最後に続けても問題ありません
);
```

配列から値にアクセスするときにはドル記号を使わなければいけません。
取られる値は配列ではなく、スカラだからです:

`配列の要素はスカラ`
`スカラ変数にはスカラ値が入る`
`配列変数、ハッシュ変数はリストコンテキストである`

```
print $array[0]; # "print"
print $array[1]; # "these"
print $array[2]; # "strings"
print $array[3]; # "out"
print $array[4]; # "for"
print $array[5]; # "me"
print $array[6]; # returns undef, prints "" and raises a warning
```

負のインデックスを、後ろから値を取るのに使えます。逆向きになります:

```
print $array[-1]; # "me"
print $array[-2]; # "for"
print $array[-3]; # "out"
print $array[-4]; # "strings"
print $array[-5]; # "these"
print $array[-6]; # "print"
print $array[-7]; # returns undef, prints "" and raises a warning
```

スカラ$varとスカラのエントリ$var[0]を持つ配列@varは衝突しません。
とはいえ、コードを読む人が混乱しますので、同じ名前を付けるのは避けましょう。

配列の長さを得るには:
```
print "This array has ".(scalar @array)."elements"; # "This array has 6 elements"
print "The last populated index is ".$#array;   # "The last populated index is 5"g
```
オリジナルのPerlスクリプトの実行時の引数は、組込の配列変数@ARGVに入ります。

`引数は全て @ARGV の中に入っている`

変数を文字列の間に入れることができます:
`結合の必要がない`

```
print "Hello $string"; # "Hello world"
print "@array";    # "print these strings out for me"g
```

注意。 ある日、誰かのメールアドレス、"jeff@gmail.com"を文字列に入れたとします。
これは、Perlに@gmailという配列変数を探させ、文字列の間に入れようとします。
それが見つからなければ、エラーになります。変数の展開を防ぐには2つの方法があります:

- シジルをエスケープする。
- または、ダブルクォートの代わりにシングルクォートを使う。

```
print "Hello \$string"; # "Hello $string"
print 'Hello $string';  # "Hello $string"
print "\@array";    # "@array"g
print '@array';     # "@array"g
```

#### ハッシュ変数
ハッシュ変数は文字でインデックスされたスカラのリストです。
Pythonではdictionary、PHPではarrayになります。

```
my %scientists = (
	"Newton"   => "Isaac",
	"Einstein" => "Albert",
	"Darwin"   => "Charles",
);
```
この宣言は配列変数の宣言にとても似ていることに注意してください。
実際に、二重矢印記号=>は、"ファットカンマ"と呼ばれます。というのも、これは、カンマセパレータのまさにシノニムだからです。
ハッシュは偶数の数のリストを使って宣言されます。偶数の要素(0, 2, ...)は全て文字列として取られます。

`シノニム=同義語`
`つまり、"=>" と "," は同じもの`

またまた、ハッシュから値にアクセスするには、ドル記号を使わなければいけません。
取られる値はハッシュではなく、スカラだからです:

```
print $scientists{"Newton"};   # "Isaac"
print $scientists{"Einstein"}; # "Albert"
print $scientists{"Darwin"};   # "Charles"
print $scientists{"Dyson"};# undefを返すので、""が出力され、警告が起きます。g
```

ブレースが使われていることに注意してください。
配列のときと同じですが、スカラの$varとスカラのエントリ$var{"foo"}が入っているハッシュの%varは衝突しません。

エントリを2倍にしてハッシュを配列に直接変換することや、キーと値を変更することができます(その逆もまた簡単です):

> my @scientists = %scientists;

`ハッシュを配列に変換`
`元は同じリストコンテキストなので、配列変数として解釈するみたいな感じ`

ですが、配列とは違い、ハッシュのキーは順番がありません。
より効率的な順番で返ってきます。そのため、整列され直された順番に気をつけてください。しかし、結果の配列のペアは保持されます:


> print "@scientists"; # something like "Einstein Albert Darwin Charles Newton Isaac"

要点をまとめると、配列から値を取り出すのには四角いブラケットを使わなければいけませんが、ハッシュから値を取り出すのはブレースを使わなければいけません。
提供されるインデックスが数字であるか文字列であるということには、重要性はありません:

`キーから値を取り出す`

```
my $data = "orange";
my @data = ("purple");
my %data = ( "0" => "blue");

print $data;  # "orange"g
print $data[0];   # "purple"
print $data["0"]; # "purple"
print $data{0};   # "blue"
print $data{"0"}; # "blue"
```

#### リスト
Perlにおけるリストは配列やハッシュとは違うものです。
既にいくつかのリストがありました:

```
(
	"print",
	"these",
	"strings",
	"out",
	"for",
	"me",
)

(
	"Newton"   => "Isaac",
	"Einstein" => "Albert",
	"Darwin"   => "Charles",
)
```

リストは変数ではありません。
リストは`その場限りの値`で、`配列やハッシュ変数に割り当てられます`
このことは、配列とハッシュの変数の宣言のシンタックスがが一致していることの理由です。
"リスト"と"配列"の用語が交換可能な状況は多くありますが、同様に、リストと配列がいくぶん違って見えるところもあり、その振る舞いに非常に混乱します。

いいでしょう。 `=>は、ただの,であることを思い出し`、返送させて、次の例を見てください:
```
("one", 1, "three", 3, "five", 5)
("one" => 1, "three" => 3, "five" => 5)
```

=>の使い方が一方のリストが配列の宣言であることを示し、他方はハッシュの宣言であることを示しています。
ですが、2つとも、それ自身、何の宣言でもありません。ただのリストです。同一のリストです。また:

> () # 中身が空のリスト

なんのヒントも存在しません。このリストは空の配列として宣言されているのでしょうか、それとも、カラのハッシュとしてでしょうか。
perlインタープリタには、明らかにどちらとも判断することができません。
Perlの変わった一面であると理解したなら、次の事実が真であることもまた理解するでしょう: リストの値はネストできません。 試してみてください:

```
my @array = (
	"apples",
	"bananas",
	(
		"inner",
		"list",
		"several",
		"entries",
	),
	"cherries",
);
```

Perlには、("inner"(訳註:内側の), "list"(訳註:リストが), "several"(訳註:複数の), "entries"(訳註:値))
が内包された配列なのか、ハッシュなのかどうかがわかりません。
そのため、Perlはいずれでもないと想定し、ひとつの長いリストに平板化します:

ファットカンマを使っていてもいなくても同じく真です:
```
my %hash = (
	"beer" => "good",
	"bananas" => (
		"green"  => "wait",
		"yellow" => "eat",
	),
);
```

**上のコードはwarningが出ます。ハッシュが7つの要素のリストで宣言されているからです。**

```
print $hash{"beer"};# "good"g
print $hash{"bananas"}; # "green"
print $hash{"wait"};# "yellow";g
print $hash{"eat"}; # undef, そのため、警告が出て、""を出力しますg
```

もちろん、このことは複数の配列を一緒にしやすくしています:

```
my @bones   = ("humerus", ("jaw", "skull"), "tibia");
my @fingers = ("thumb", "index", "middle", "ring", "little");
my @parts   = (@bones, @fingers, ("foot", "toes"), "eyeball", "knuckle");
print @parts;
```
詳細は後ほど。

### コンテキスト
Perlの最も特徴のあるところは、コードが`コンテクストセンシティブ`なところです。
Perlの全ての式はスカラコンテキストかリストコンテキストで評価されます。スカラかリストをのいずれかを作るかを期待されているかに依存します。
多くのPerlの式と組込の関数は、それが評価されるコンテキストによって、振る舞いに根本的に違いを見せます。

$scalar =のような`スカラの割り当て`は`スカラコンテキストとして評価`されます。
このケースでは、この式は"Mendeleev"と、返される値は"Mendeleev"と同じスカラになります:

> my $scalar = "Mendeleev";

@array = や %hash = のような`配列やハッシュの割り当て`は、`リストコンテキスト`で評価されます。
リストの値はリストコンテキストで評価され、リストを返します。配列やハッシュに代入するようなときです:

```
my @array = ("Alpha", "Beta", "Gamma", "Pie");
my %hash = ("Alpha" => "Beta", "Gamma" => "Pie");
```
驚くようなことはありません。
スカラの式はリストコンテキストで評価されると、ひとつの値のリストとなります:

> my @array = "Mendeleev"; # same as 'my @array = ("Mendeleev");'

リストの式がスカラコンテキストで評価されると、リストの最後のスカラを返します:

> my $scalar = ("Alpha", "Beta", "Gamma", "Pie"); # Value of $scalar is now "Pie"

配列の式(配列はリストと違います。覚えてる？)は、スカラコンテキストでは`配列の長さ`を返します:

`配列をスカラコンテキストで評価すると、要素の数を返す`

```
my @array = ("Alpha", "Beta", "Gamma", "Pie");
my $scalar = @array; # Value of $scalar is now 4
```
print 組込関数は全ての引数をリストコンテキストで評価します。
printは無制限のリストの引数を受取り、一つ一つ出力します。つまり、配列を直接与えることが出来ます。

```
my @array = ("Alpha", "Beta", "Goo");
my $scalar = "-X-";
print @array;          # "AlphaBetaGoo";g
print $scalar, @array, 98; # "-X-AlphaBetaGoo98";
```

どのような式もscalar組込関数を使えばスカラコンテキストで`強制的に評価`することが出来ます。
このことが、なぜscalarを配列の長さを取るのに使うのかの理由です。

サブルーチンがスカラコンテキストで評価されるときにスカラを返すような法律やシンタックスにはあなたは縛られていませんし、また、リストコンテキストでリストを返すこともまた同じです。
上で見たように、Perlは完全にあなたのために結果を作ることができます。

####  リファレンスとネストされたデータ構造
リストが要素としてリストを含めないのと同様、配列とハッシュは他の配列やハッシュを要素として持てません。
両方ともスカラしか持てません。 今から試すことをよく見てください:

```
my @outer = ("Sun", "Mercury", "Venus", undef, "Mars");
my @inner = ("Earth", "Moon");

$outer[3] = @inner;

print $outer[3]; # "2"
```

`$outer[3]がスカラのため、@innerのスカラコンテキストを要求する(=2)`

$outer[3]はスカラです。そのため、スカラの値を要求します。
@innerのような配列を割り当てようとすると、@innerはスカラコンテキストで評価されます。つまり、scalar @innerと同じです。
配列@innerの長さ、2になります。

ですが, スカラ変数は、配列変数やハッシュ変数を含む、他の変数へのリファレンスを持てます。
これが、Perlでより複雑なデータ構造を作る方法です。

リファレンスはバックスラッシュを使って作られます。
```
my $colour= "Indigo";g
my $scalarRef = \$colour;
```

いつでも、変数の名前を使えます。代わりにブレースを置いて、ブレース内に変数へのリファレンスを置きます。
```
print $colour;     # "Indigo"g
print $scalarRef;  # e.g. "SCALAR(0x182c180)"g
print ${ $scalarRef }; # "Indigo"
```

`リファレンスから値を取り出す(=デリファレンス)`

結果が曖昧でない限り、ブレースを省略することもできます:
> print $$scalarRef; # "Indigo"

リファレンスが配列かハッシュ変数のリファレンスの場合、ブレースかより一般的なアロー演算子、->を使ってデータを取り出せます:
```
my @colours = ("Red", "Orange", "Yellow", "Green", "Blue");
my $arrayRef = \@colours;

print $colours[0];   # direct array accessg
print ${ $arrayRef }[0]; # use the reference to get to the array
print $arrayRef->[0];# exactly the same thingg

my %atomicWeights = ("Hydrogen" => 1.008, "Helium" => 4.003, "Manganese" => 54.94);
my $hashRef = \%atomicWeights;

print $atomicWeights{"Helium"}; # direct hash access
print ${ $hashRef }{"Helium"};  # use a reference to get to the hash
print $hashRef->{"Helium"}; # exactly the same thing - this is very commong
```

- リファレンスを解く方法
  - ブレース
  - アロー演算子
- オブジェクト志向の場合、オブジェクト->メソッド() という使われ方

### データ構造を宣言する
4つの例があります。ですが、実践的には、最後のものがもっとも有用です。
```
my %owner1 = (
	"name" => "Santa Claus",
	"DOB"  => "1882-12-25",
);

my $owner1Ref = \%owner1;

my %owner2 = (
	"name" => "Mickey Mouse",
	"DOB"  => "1928-11-18",
);

my $owner2Ref = \%owner2;

my @owners = ( $owner1Ref, $owner2Ref );

my $ownersRef = \@owners;

my %account = (
	"number" => "12345678",
	"opened" => "2000-01-01",
	"owners" => $ownersRef,
);
```

> my $owner1Ref = \%owner1;
> my $owner2Ref = \%owner2;

これは、明らかに不必要で骨の折れます。なぜなら、次のように省略できます:

> my @owners = ( \%owner1, \%owner2 );

別の記号を使って無名配列やハッシュを宣言することも出来ます。
四角いブラケットを無名配列に、ブレースを無名ハッシュに使います。それぞれ、返される値は、無名のデータ構造のリファレンスになります。
注意して見てください。次の結果は、上の%accountと全く同じです:

```
# Braces denote an anonymous hash # 無名ハッシュのリファレンス
my $owner1Ref = {
	"name" => "Santa Claus",
	"DOB"  => "1882-12-25",
};

my $owner2Ref = {
	"name" => "Mickey Mouse",
	"DOB"  => "1928-11-18",
};

# Square brackets denote an anonymous array
my $ownersRef = [ $owner1Ref, $owner2Ref ]; #無名配列のリファレンス

my %account = (
	"number" => "12345678",
	"opened" => "2000-01-01",
	"owners" => $ownersRef,
);
```

- 一行目は下記と等しい
```
my %owner1 = (
"name" => "Santa Claus",
"DOB"  => "1882-12-25",
);
my $owner1Ref = \%owner1;
```

または、省略するすると(そして、行でデータ複雑な構造を宣言する時に、実際に使うべき形です):
```
my %account = (
	"number" => "31415926",
	"opened" => "3000-01-01",
	"owners" => [
		{
			"name" => "Philip Fry",
			"DOB"  => "1974-08-06",
		},
		{
			"name" => "Hubert Farnsworth",
			"DOB"  => "2841-04-09",
		},
	],
);
```

#### データ構造から情報を取り出す
さて、いじくりまわすために%accountがまだあるとしましょう。ですが、全ての他のもの(他のものがあったなら)は、スコープの外に落ちます。
それぞれのケースで同じ手順を逆向きにすることで、情報を表示できます。もう一度、4つの例がありますが、最後のものが一番有用です。
```
my $ownersRef = $account{"owners"};
my @owners= @{ $ownersRef };g

my $owner1Ref = $owners[0];
my %owner1= %{ $owner1Ref };g
my $owner2Ref = $owners[1];
my %owner2= %{ $owner2Ref };g

print "Account #", $account{"number"}, "\n";
print "Opened on ", $account{"opened"}, "\n";
print "Joint owners:\n";
print "\t", $owner1{"name"}, " (born ", $owner1{"DOB"}, ")\n";
print "\t", $owner2{"name"}, " (born ", $owner2{"DOB"}, ")\n";
```
または, 省略して:
```
my $ownersRef = $account{"owners"};
my @owners= @{ $ownersRef };g
↓
my @owners = @{ $account{"owners"} };

my $owner1Ref = $owners[0];
my %owner1= %{ $owner1Ref };g
↓
my %owner1 = %{ $owners[0] };
```
または、リファレンスと-> を使って:
```
my %owner1= %{ $owner1Ref };g
↓
my $owner1Ref = $ownersRef->[0];

print "\t", $owner1{"name"}, " (born ", $owner1{"DOB"}, ")\n";
↓
print "\t", $owner1Ref->{"name"}, " (born ", $owner1Ref->{"DOB"}, ")\n";
```
そして、全ての中間の値をスキップするなら:
```
print "Account #", $account{"number"}, "\n";
print "Opened on ", $account{"opened"}, "\n";
print "Joint owners:\n";
print "\t", $account{"owners"}->[0]->{"name"}, " (born ", $account{"owners"}->[0]->{"DOB"}, ")\n";
print "\t", $account{"owners"}->[1]->{"name"}, " (born ", $account{"owners"}->[1]->{"DOB"}, ")\n";
```

### 配列のリファレンスで自分で自分の足を撃つ方法
次の配列には5つの要素があります:
```
my @array1 = (1, 2, 3, 4, 5);
print @array1; # "12345"
```
しかし、次の配列には *ひとつ* の要素(無名の5つの要素の配列のリファレンス)があります:
```
my @array2 = [1, 2, 3, 4, 5]; # 無名配列
print @array2; # e.g. "ARRAY(0x182c180)"
```
次の スカラ は、無名の5つの要素の配列のリファレンスになります:
```
my $array3Ref = [1, 2, 3, 4, 5];
print $array3Ref;  # e.g. "ARRAY(0x22710c0)"g
print @{ $array3Ref }; # "12345"
print @$array3Ref; # "12345"g
```

### 条件

#### if ... elsif ... else ...

elsifのスペル以外には驚くものはありません:
```
my $word = "antidisestablishmentarianism";
my $strlen = length $word;

if($strlen >= 15) {
	print "'", $word, "' is a very long word";
} elsif(10 <= $strlen && $strlen < 15) {
	print "'", $word, "' is a medium-length word";
} else {
	print "'", $word, "' is a short word";
}
```

Perlにはより短い "ステートメント if 条件"のシンタックスがあります。短いステートメント用に、強く推奨されます:
> print "'", $word, "' is actually enormous" if $strlen >= 20;

#### unless ... else ...
```
my $temperature = 20;

unless($temperature > 30) {
	print $temperature, " degrees Celsius is not very hot";
} else {
	print $temperature, " degrees Celsius is actually pretty hot";
}
````
unlessブロックは *災いのように避ける* のが一番です(使わないこと！)それらは混乱のもととなります。
"unless [... else]"ブロックは簡単に、"if [... else]" ブロックに、条件を否定する[または、条件をそのままにブロックを交換する]ことでリファクタできます。
幸い、 elsunlessのキーワードはありません。

一方で、以下は読みやすさのために、強く推奨されます
> print "Oh no it's too cold" unless $temperature > 15;


#### 三項演算子

`三項演算子： ( 条件 ? trueの場合 : falseの場合 )`

三項演算子 `?:` は、単純な if ステートメントをひとつのステートメントに埋め込めます。
三項演算子の標準的な使い方として、単数/複数の形があります:
`三項演算子は、しばしば単数か複数かを判定するのに使われる`

```
my $gain = 48;
print "You gained ", $gain, " ", ($gain == 1 ? "experience point" : "experience points"), "!";
```
余談: 両方のケースの単数と複数を完全に書き出されています。決して以下のような巧妙なことをしないでください。
コードを検索して、"tooth"か"teeth"の単語を置き換えようとしても、この行から見つけることができません。

> ? "tooth" : "teeth" とすべき

```
my $lost = 1;
print "You lost ", $lost, " t", ($lost == 1 ? "oo" : "ee"), "th!";
```

三項演算子はネストできます:
```
my $eggs = 5;
print "You have ", $eggs == 0 ? "no eggs" :
               $eggs == 1 ? "an egg"  :g
               "some eggs";g
```
if文では、これらの条件がは`スカラコンテキスト`で価されます。
`if(@array)`は、@arrayにひとつ以上のエレメントがある場合のみ、真となります。
配列の中の値が何かは問題にしません - 全てがundefや他の偽の値でも真になる

### ループ
やりかたはひとつではありません。

Perlの慣例的なwhile ループ:
```
my $i = 0;
while($i < scalar @array) {
	print $i, ": ", $array[$i];
	$i++;
}
```
`scalar @x : 配列の要素数を返す`

Perlにはuntilキーワードもあります:
```
my $i = 0;
until($i >= scalar @array) {
	print $i, ": ", $array[$i];
	$i++;
}
```
これらのdoループは、ほとんど上と同じです`(@arrayが空の場合警告が起きます)`:
```
my $i = 0;
do {
	print $i, ": ", $array[$i];
	$i++;
} while ($i < scalar @array);
```
そして
```
my $i = 0;
do {
	print $i, ": ", $array[$i];
	$i++;
} until ($i >= scalar @array);
```
基本的なC-styleのforループも利用できます。
myをfor文の内側に置く方法に注意してください。`宣言された$iはループのスコープでのみ有効`です:
```
for(my $i = 0; $i < scalar @array; $i++) {
	print $i, ": ", $array[$i];
}
# $i has ceased to exist here, which is much tidier.
```
この種のforループは古臭いやり方なので、`可能であれば避けるべきです`

リストのネイティブのイテレーションはより簡単です。
`(my $i = 0; $i < scalar @array; $i++) の代わりに　リスト( 1,2,3,4 )を使う`
注意: PHPと違い、 for と foreach キーワードはシノニムです。もっとも読みやすいもののいずれかを使ってください:

`$string のように一時的にループのリストの要素を受け取る変数を イテレーターと言う`
```
foreach my $string ( @array ) {
	print $string;
}
```

`( @array ) で リストを渡す ()で評価するというのはどういうことか`

複数のインデックスが必要なら、範囲演算子..で整数の無名リストを作れます:
`リストを渡している`
```
foreach my $i ( 0 .. $#array ) {
	print $i, ": ", $array[$i];
}
```

> $# は配列の最後のindexを得る方法、つまり最後のindex(key?)を取れるので、それで繰り返し数を得ることができる

ハッシュはイテレートできません。その`キー`をイテレートできます。
組込関数のkeysを使って、ハッシュの全てのキーを含む配列を取り出してください。それから、配列で使ったforeachのアプローチを使います:
```
foreach my $key (keys %scientists) {
	print $key, ": ", $scientists{$key};
}
```
ハッシュには順番がありませんので、keysはどのような順番でも戻ります。
組込のsort関数を使って、アルファベット順でキーの配列をソートできます:
```
foreach my $key (sort keys %scientists) {
	print $key, ": ", $scientists{$key};
}
```
明示的なイテレータを使わなければ、Perlはデフォルトのイテレータとして`$_`を使います。
** `$_`は最初の最もフレンドリーな組込の変数です: **

```
foreach ( @array ) {
	print $_;
}
```
デフォルトのイテレータを使うなら、ループに一つのステートメントしか置かないのなら、とても短いループのシンタックスを使えます:

> print $_ foreach @array;


#### ループ制御
next と lastはループ進みを制御するのに使われます。多くのプログラミング言語では、それぞれ、continue と breakとなっています。
オプションで、どの`ループにもラベルをつける`ことができます。慣例により、ラベルは全て大文字で書くことになっています。
ループにラベルをつけることで、next と last にラベルを対象にできます。

- 100以下の素数を見つける例です:
```
CANDIDATE: for my $candidate ( 2 .. 100 ) {
  print "=== RESTSART CANDIDATE ===","\n";
	for my $divisor ( 2 .. sqrt $candidate ) {
print "sqrt:",sqrt ($candidate),"\n";g
print "a:",$candidate,"\n";g
print "b:",$divisor,"\n";g
print "result:", $candidate % $divisor ,"\n";g
		next CANDIDATE if $candidate % $divisor == 0;
print "== PASS CANDIDATE ===","\n";g
	}
  # CANDIDATE % ループの最大回数 が　0にならない場合ここに入る
	print "====================================== ", $candidate." is prime\n";
}
```
`ラベル名: 繰り返し処理にラベルをつける ラベルに対して、繰り返し処理の制御を指示する`
`next は冒頭のラベルに戻る`


#### 配列関数
その場で配列を変更する
`配列を操作する`

@stackを使ってデモします:
```
my @stack = ("Fred", "Eileen", "Denise", "Charlie");
print @stack; # "FredEileenDeniseCharlie"
```
pop は配列の最後の要素を引き出して返します。スタックの上として考えられます:
```
print pop @stack; # "Charlie"
print @stack; # "FredEileenDenise"g
```
push は追加の要素を配列の最後に付加します:
```
push @stack, "Bob", "Alice";
print @stack; # "FredEileenDeniseBobAlice"
```
shift は配列の最初の要素を切り出します:
```
print shift @stack; # "Fred"
print @stack;   # "EileenDeniseBobAlice" # 2個目以降の要素を返す
```
unshift 配列の最初に新しい要素を挿入します:
```
unshift @stack, "Hank", "Grace";
print @stack; # "HankGraceEileenDeniseBobAlice"
```
pop、push、 shift、unshift は、`全てspliceの特別なケース`です。
splice は、配列のスライスを削除して、返します。別の配列スライスでそれを置き換えます:
```
print splice(@stack, 1, 4, "<<<", ">>>"); # "GraceEileenDeniseBob"
print @stack;                         # "Hank<<<>>>Alice"g
```

###  古い配列から新しい配列を作る
Perlには以下の関数があり、配列に対して、新しい配列を作ります

join 関数は多くの文字列を一つに結合します:
```
my @elements = ("Antimony", "Arsenic", "Aluminum", "Selenium");
print @elements;         # "AntimonyArsenicAluminumSelenium"g
print "@elements";       # "Antimony Arsenic Aluminum Selenium"g
print join(", ", @elements); # "Antimony, Arsenic, Aluminum, Selenium"
```
リストコンテキストでは、reverse関数は逆順のリストを返します。
スカラーコンテキストではreverseリストの全てをつなげて一つの文字列として、それを逆順にします。
```
print reverse("Hello", "World");    # "WorldHello"g
print reverse("HelloWorld");        # "HelloWorld"g
print scalar reverse("HelloWorld"); # "dlroWolleH"g
print scalar reverse("Hello", "World"); # "dlroWolleH"
```
map関数は入力として配列をとり、配列内の全てのスカラ `$_`を操作します。
結果として新しい配列を作ります。操作はひとつのブレースで渡します:

```
my @capitals = ("Baton Rouge", "Indianapolis", "Columbus", "Montgomery", "Helena", "Denver", "Boise");

print join ", ", map { uc $_ } @capitals;
# "BATON ROUGE, INDIANAPOLIS, COLUMBUS, MONTGOMERY, HELENA, DENVER, BOISE"
```
grep関数は入力として配列をとり、`フィルターされた配列を出力`します。
シンタックスはmapと似ています。今度は、第二引数は入力された配列の各スカラ`$_`を評価されます。
ブーリアンで真の値が戻れば、スカラは配列として出力されますが、そうでなければ出力されません。

```
print join ", ", grep { length $_ == 6 } @capitals;
# "Helena, Denver"
```
当然、結果の配列の長さは、マッチに成功した数になります
このとことは、grepを配列に要素があるかどうかを素早くチェックするのに使えることを意味します。:

> print scalar grep { $_ eq "Columbus" } @capitals; # "1"

grep と map は、`リスト包含の形`に含まれます。他の多くのプログラミング言語に目立って欠けている、例外的に強力な機能です。

デフォルトでは、sort関数は入力された配列を文字順(アルファベット順)に並びかえます:
```
my @elevations = (19, 1, 2, 100, 3, 98, 100, 1056);

print join ", ", sort @elevations;
# "1, 100, 100, 1056, 19, 2, 3, 98"
```
- abc順にsortされる

しかし、grep と mapと似て、自分のコードを渡すことも出来ます。
ソートは常に2要素間の一連の比較を使ってされます。
コードブロックは、$aと$bを受け、$aが$b"より小さ"ければ -1、"同じ"であれば 0、$aが$b"より大き"ければ 1 を返します。

cmp 演算子は **文字列** に対して、まさにこれをします:
```
print join ", ", sort { $a cmp $b } @elevations;
# "1, 100, 100, 1056, 19, 2, 3, 98"
```
- abc順にsortされる

"スペースシップ演算子", <=>は、**数字に対して** 同じことをします:
```
print join ", ", sort { $a <=> $b } @elevations;
# "1, 2, 3, 19, 98, 100, 100, 1056"
```
- 数字順にsortされる

$a と $b は常にスカラーですが、比較が難しい非常に複雑なオブジェクトのリファレンスもありえます。
比較によりスペースが必要なら、別のサブルーチンを作り、代わりにその名前を渡せます:
```
sub comparator {
	# lots of code...
	# return -1, 0 or 1
}

print join ", ", sort comparator @elevations;
```
同じことは、grep や map ではできません。

サブルーチンとブロックは $a と $bと一緒には渡されません。
`$_`のように、 `$aと$bは、グローバル変数`で、その時々に、比較される値のペアで埋められます


### 組込関数
今までで、少なくともよくある組込関数が出てきました:
print, sort, map, grep, keys, scalar など。
組込関数はPerlの最も偉大な強みのひとつです。それらは、

- たくさんある
- とても便利
- 広くドキュント化されている
- シンタックスで大きく異なるので、ドキュメントを見ること
- 引数として正規表現を受け付けるものもある
- 引数として完全なコードブロックを受け付けるものもある
- 引数の間にコンマが不要なものもある
- コンマで区切られた任意の数を取るものもあれば、そうでないものもある
- 引数が少なすぎる場合に、自分自身で引数を埋めるものもある
- 曖昧な状況でなければ、一般的に引数のまわりに括弧は不要

組込関数が存在していることを知ることに館する最も良いアドバイスは、それらが存在することを知ることです。
未来のリファレンスにざっと目を通してください。
低レベルで以前に何度も行っている十分に共通だと感じるタスクを実行しているなら、そのチャンスです。

#### ユーザー定義のサブルーチン
サブルーチンはsub キーワードを使って宣言されます。
組込関数と対照的に、ユーザー定義のサブルーチンは常に同じ入力を受け付けます

: スカラのリストです。そのリストは、もちろん、ひとつの要素か、空の場合もあります。
ひとつのスカラは一つの要素のリストです。N要素のハッシュは2N要素のリストです。

括弧はオプションですが、サブルーチンは、引数がひとつも無くても、常に括弧付きで使うべきです。
こうしておけば、サブルーチンが呼ばれたことが、明確になります。

サブルーチンの中に入ってしまうと、組込の配列変数`@_`が使えます。例:
```
sub hyphenate {

  # Extract the first argument from the array, ignore everything else
  my $word = shift @_;

  # An overly clever list comprehension
  $word = join "-", map { substr $word, $_, 1 } (0 .. (length $word) - 1);
  return $word;
}

print hyphenate("exterminate"); # "e-x-t-e-r-m-i-n-a-t-e"
```

#### Perlがリファレンスとよぶもの
全ての他の主要なプログラミング言語とは違い、Perlはリファレンスと呼びます。
これは、サブルーチンの内側で利用可能な変数か値がオリジナルのコピーではないことを意味します。
```
my $x = 7;

sub reassign {
  $_[0] = 42;
}

reassign($x);
print $x; # "42"
```
次のようなものを試すとエラーになります
```
reassign(8);
then an error occurs and execution halts, because the first line of reassign() is equivalent to

8 = 42;
```
これは明らかにナンセンスです。


このレッスンで学ぶことは、サブルーチンの中で、それらで何かする前に、`いつも引数をアンパックすべき`です。

`グローバル変数をサブルーチンの中で扱いたい場合、一手間必要`

#### 引数を取り出す
`@_`を取り出すのにいくつかやり方があります。 ですが、いくつかは、他のものより、より良いです。

例のサブルーチン`left_pad`は、以下の例は、渡された詰め込み文字を使って、必要な長さになるまで文字列に付加します。
- (x関数は行に同じ文字列の複数のコピーをつなげます)。
- (注意: 簡潔さのために、これらのサブルーチンは全て基本的なエラーチェックを行っていません。
  - 例えば、詰め込み文字が1文字のみであることを保証するとか、長さが既存の文字列の長さ以上であるか、必要な引数が全て渡されているかどうか、など)。

例として、left_pad と言うサブルーチンを作る
- 元の文字, 伸ばしたい文字数、埋める文字を引数にする

> print left_pad("hello", 10, "+"); # "+++++hello"

エントリによって、`@_`エントリを取り出すのは、効率的ですが、あまりよくありません:
```
sub left_pad {
	my $oldString = $_[0];
	my $width = $_[1];g
	my $padChar   = $_[2];
	my $newString = ($padChar x ($width - length $oldString)) . $oldString;
	return $newString;
}
```
`@_`を取り出すのに、shiftを使って、`@_`からデータを削除するのは、引数が4つまでなら推奨されます:
- shift はリストの先頭を切り取る
```
sub left_pad {
	my $oldString = shift @_;
	my $width = shift @_;g
	my $padChar   = shift @_;
	my $newString = ($padChar x ($width - length $oldString)) . $oldString;
	return $newString;
}
```
shiftに配列を渡さなければ、暗黙に、`@_`に対して操作します。このアプローチはとてもよく見られます:
```
	my $oldString = shift;
	my $width = shift;g
	my $padChar   = shift;

```
引数が5つ以上になるなら、どこで割り当てたかを追い続けるのが難しくなるでしょう。
`引数の固定化をするのは４つが限度`

`@_`の取り出しを、同時に全て一度にスカラに割り当てることが出来ます。
この方法も、引数が4つまでなら問題ありません:

>	my ($oldString, $width, $padChar) = @_;


引数が多いサブルーチンや、いくつかの引数がオプションであるとか、他との組み合わせで使えないなら、
最も良い方法は、サブルーチンの呼び出し時に、ユーザにハッシュの引数を渡させることです。
そして、`@_`をハッシュに取り出します。このアプローチのために、サブルーチンの呼び出しはちょっと違ったものになります:

> print left_pad("oldString" => "pod", "width" => 10, "padChar" => "+");
`引数の記述順に依存しない`

そして、サブルーチン自身は次のようになります:
```
sub left_pad {
	my %args = @_;
	my $newString = ($args{"padChar"} x ($args{"width"} - length $args{"oldString"})) . $args{"oldString"};
	return $newString;
}
```


### 戻り値
他のPerlの式と同様、サブルーチン呼び出しは、コンテキスト依存の振る舞いをします。
wantarrayを使うことができます(wantlistと呼ばれるべきですが、気にしないでください)を使って、
どのコンテキストでサブルーチンが評価されているかをチェックでき、コンテキストに適した結果を返すことが出来ます:

```
sub contextualSubroutine {
	# Caller wants a list. Return a list
	return ("Everest", "K2", "Etna") if wantarray;

	# Caller wants a scalar. Return a scalar
	return 3;
}

my @array = contextualSubroutine();
print @array; # "EverestK2Etna"

my $scalar = contextualSubroutine();
print $scalar; # "3"
```

`スカラー値なので0以外はtrue`

### システムコール
既に以下のPerlと関係ない事実をご存知でしたら申し訳有りません。
WindowやLinux(また、多くの他のシステムでも同様と想定されますが)のシステムではプロセスが終わるたびに、16ビットの状態ワードで終了します。
上位の8ビットは0〜255の間を含むリターンコードを構成します。0は慣例的に、無条件で成功したことを示します。
他の値は様々な度合いの失敗を示します。他の8ビットはあまりよく調べられませんが、それらは"シグナルの死亡やコアダンプの情報のような失敗のモードを反映します"。

Perlから終了する際に、exitを使って(0から255までの)好きなリターンコードを返せます。

Perlには一つ以上の - 子プロセスを産む - 方法があります。
現在のスクリプトを止め、子プロセスが終わったら、現在のスクリプトの解釈を続けます。
どの方法を使っても、その直後で、子プロセスの終了時に返された状態ワードが組込のスカラ変数の`$?`に入ります。
返された値の16ビットの上位8を取ることで、シグナルリターンコードを得ることができます: `$? >> 8`

- `$?`に 16ビットの状態ワードが入る
- `$? >> 8` とすることで、上位８ビットのリターンコードを得られる
 - シグナル死亡、コアダンプなどの失敗モードを得られる

`system関数` は他のプログラムを引数のリストと一緒に呼び出せます。
systemによって返される値は、$?に入るのと同じ値です:

`system関数: 外部のプログラムを呼ぶことができる(bashを経由する)`
```
my $rc = system "perl", "anotherscript.pl", "foo", "bar", "baz";
$rc >>= 8;
print $rc; # "37"
```
systemの代わりに、バッククォートを使って、コマンドラインで実際のコマンドを走らせて、コマンドからの標準出力をキャプチャできます。
スカラコンテキストでは、全ての出力は単一の文字列として帰ります。リストコンテキストでは、全ての出力は一行ずつの文字列の配列として返されます。
```
my $text = `perl anotherscript.pl foo bar baz`;
print $text; # "foobarbaz"
```
これは、anotherscript.plが含んでいたら、見られる振る舞いです。例:
```
use strict;
use warnings;

print @ARGV;
exit 37;
```

###  ファイルとファイルハンドル
スカラ変数は、数字/文字列/リファレンスやundefの代わりにファイルハンドルも持てます。
ファイルハンドルは基本的に特定のファイルの特定の場所を示すリファレンスです。

openを使って、スカラ変数をファイルハンドルにします。
openはモードとともに使われなければいけません。モード < は、ファイルから読み出したいことを意図します:

```
my $f = "text.txt";
my $result = open my $fh, "<", $f;

if(!$result) {
	die  "Couldn't open '".$f."' for reading because: ".$!;
}
```
成功すれば、openは真を返します。そうでなければ、偽を返し、エラーメッセージが組み込みの変数$!に入ります。
上で見たように、open 演算子が完全に成功したかを常にチェックすべきです。
このチェックの手続きは退屈ですが、よくみかけるイディオムは次のものです:

> open(my $fh, "<", $f) || die "Couldn't open '".$f."' for reading because: ".$!;

open呼び出しの引数に括弧が必要なことに注意してください。

ファイルハンドルからテキストの行を読むために、組込関数のreadlineを使えます。
readlineは、テキストの一行全体を、その終わりに改行をそのまま含んで返す(たぶんファイルの最終行を除いて)か、ファイルの最後に達するとundefを返します。
```
while(1) {
	my $line = readline $fh;
	last unless defined $line;
	# process the line...
}
```
chompを使うと改行を取り除けます:

> chomp $line;

chompは $lineに対してその場で働きます。$line = chomp $lineは多分お望みのものではないでしょう。

eofを使ってファイルの終端を判断することもできます:
```
while(!eof $fh) {
	my $line = readline $fh;
	# process $line...
}
```
ですが、while(my $line = readline $fh)を使うのは注意してください。
$lineが"0"で合った場合、ループは早くに終わってしまいます。
そのように書きたいのならば、Perlには<>演算子があり、少し安全な方法でreadlineをラップしています。

次のものは、とてもよくある完全に安全なものです:
```
while(my $line = <$fh>) {
	# process $line...
}
```
次のようにさえも省略可能

> while(<$fh>) {}

ファイルに書き込む場合は、違ったモードで最初に開きます。
モード > は、書き込み用にファイルを開くことを指示します。
(>は、目的のファイルの中身を壊します。単純に、追加したい場合は、>> のモードを使います)。
それから、print関数の0番目の引数として、ファイルハンドルを単に渡します。
```
my $f = "text.txt"
open(my $fh2, ">", $f) || die "Couldn't open '".$f."' for writing because: ".$!;
print $fh2 "The eagles have left the nest";
```
`test.txt に書き込まれる`

printで$fh2と次の引数の間にカンマがないことに気をつけてください。
ファイルハンドルはスコープを抜けると自動的に閉じられます。もしくは、次のようにします:
```
close $fh2;
close $fh;
```
3つのファイルハンドルがグローバルな定数としてあります
`STDINとSTDOUTとSTDERRがあります。`
これらはスクリプトが開始されたときに **自動的に** 開かれます。ユーザーの入力を一行読むには:

> my $line = <STDIN>;

ユーザーがエンターを押すまで待つだけです:

<STDIN>;
<>をファイルハンドルなしで呼ぶと、STDINからデータを読むか、Perlスクリプトが呼ばれた時の引数に渡された名前のファイルから読みます。

分かるかと思いますが、printは、ファイルハンドルが省略された場合は、デフォルトでSTDOUTに出力しますす。

ファイルハンドルに出力している場合
> print $fh2 "The eagles have left the nest"

### ファイルテスト
関数-e は組込の関数で与えられた名前のファイルが存在するかどうかをテストします。

> print "what" unless -e "/usr/bin/perl";

関数-d は組込の関数で与えられた名前のファイルがディレクトリかどうかをテストします。

関数-f は組込の関数で与えられた名前のファイルが普通のファイルかどうかをテストします。

-X形式の大きなクラスの関数の3つの関数です。
Xは小文字か大文字です。これらの関数はファイルテストと呼ばれます。マイナス記号が先に来ることに気をつけてください。
Googleクエリでは、マイナス記号は、その言葉を結果に含めないことを指示します。そのため、ファイルテストをGoogleで検索しづらくしています!
代わりに、 "perl file test"(訳註: "perl ファイルテスト")で検索して下さい。

### 正規表現
正規表現はPerl以外の多くの言語やツールにみられます。
Perlのコアの正規表現シンタックスは他のものと基本的に同じです。
Perlの完全な正規表現の性能は恐ろしく複雑で理解するのが難しいです;
一番良いアドバイスをするとしたら、可能な限りこういた複雑なものを避けるということです。

マッチは、マッチ演算子=~ m//を使ってされます。スカラコンテキストでは、=~ m//は、成功なら真を返し、失敗なら偽を返します。
```
my $string = "Hello world";
if($string =~ m/(\w+)\s+(\w+)/) {
	print "success";
}
```

- `何らかの文字+空白+何らかの文字` と言う条件でマッチしている
> \w は単語を構成する文字(英数字 と _)にマッチングします; 単に [0-9a-zA-Z_] だけではなく、非ローマ字スクリプトからの数字と文字も マッチングします
> \s は空白文字にマッチングします; [\ \t\r\n\f] やその他のものです

括弧はサブマッチになります。マッチが成功したら、サブマッチは組込変数の$1, $2, $3, ...にマッチしたものが入ります:
> ()でくくった条件がサブマッチになる
```
> print $1; # "Hello"
> print $2; # "world"
```

リストコンテキストでは、=~ m// は$1, $2, ... をリストとして返します:

```
my $string = "colourless green ideas sleep furiously";
my @matches = $string =~ m/(\w+)\s+((\w+)\s+(\w+))\s+(\w+)\s+(\w+)/;

print join ", ", map { "'".$_."'" } @matches;
# prints "'colourless', 'green ideas', 'green', 'ideas', 'sleep', 'furiously'"
```
置換操作は=~ s///で行います。
```
my $string = "Good morning world";
$string =~ s/world/Vietnam/;
print $string; # "Good morning Vietnam"
```
$stringの中身を変更する方法に注意してください。
=~ s/// 操作の左側にスカラ変数を渡さなければなりません。リテラルの文字列を渡した場合、エラーになります。

`リテラル： プログラムのソースコードにおいて使用される、数値や文字列を直接に記述した定数のことである。変数の対義語であり、変更されないことを前提とした値である`

/gフラグは"グループマッチ"を指示します。

スカラコンテキストでは、それぞれの=~ m//g 呼び出しは前のものの後の他のマッチを探し、成功すると真を返し、失敗すると値を返します。
よくある方法で$1などにアクセス出来ます。 例:
```
my $string = "a tonne of feathers or a tonne of bricks";
while($string =~ m/(\w+)/g) {
  print "'".$1."'\n";
}
# (\w+)の、他のマッチする奴を探すので,一文字ずつ全部帰ってきた
```
リストコンテキストでは、=~ m//g呼び出しは、マッチしたものを一度に全部返します。
```
my @matches = $string =~ m/(\w+)/g;
print join ", ", map { "'".$_."'" } @matches;
```
- まとめ
```
my $matches = $string =~ m/(\w+)/g;
print "'".$1."'\n";

# 'a'
my @matches = $string =~ m/(\w+)/g;
print @matches;
# tonneoffeathersoratonneofbricks
```

- =~ s///g呼び出しはグローバルな検索/置換でマッチした数を返します。
ここでは、すべての母音を文字"r"に置換しています。
```
my $string = "a tonne of feathers or a tonne of bricks";

# Try once without /g.
$string =~ s/[aeiou]/r/;
print $string; # "r tonne of feathers or a tonne of bricks" #一文字目だけ置き換わる

# Once more. #　再実行
$string =~ s/[aeiou]/r/;
print $string; # "r trnne of feathers or a tonne of bricks" #二文字目のみ

# And do all the rest using /g
$string =~ s/[aeiou]/r/g;
print $string, "\n"; # "r trnnr rf frrthrrs rr r trnnr rf brrcks" # 全て置き換わる
```
- `/i` フラグはマッチと置換をケースインセンシティブにします。
```
"Hello world" =~ m/
  (\w+) # one or more word characters
  [ ]   # single literal space, stored inside a character class
  world # literal "world"
/x;

# returns true
```

### モジュールとパッケージ
Perlにおいて、モジュールとパッケージは別物です。

- モジュール
  - 外部に切り出したサブルーチン群
- パッケージ
  - 別の名前空間

### モジュール
モジュールは、他のPerlファイル(スクリプトかモジュール)に含めることが出来る.pmファイルです。
モジュールは .pl Perlスクリプトとまったく同じシンタックのステキストファイルです。
例のモジュールは、C:\foo\bar\baz\Demo\StringUtils.pm か /foo/bar/baz/Demo/StringUtils.pmにあります。続きを読んでください:

```
use strict;
use warnings;

sub zombify {
	my $word = shift @_;
	$word =~ s/[aeiou]/r/g;   # 文字を一個切り取って置換
	return $word;
}

return 1;
```
モジュールはロードされると、最初から最後まで実行されるので、ロードが成功したことを示すために、最後に真の値を返す必要があります。

Perlインタープリタはそれらを見つけることができるためには、perlを呼ぶ前に、
Perlモジュールが入っているディレクトリが `環境変数PERL5LIB`にリストされているべきです。
モジュールが入っているルートディレクトリをリストしてください。モジュールのディレクトリやモジュール自身をリストしてはいけません。

> set PERL5LIB=C:\foo\bar\baz;%PERL5LIB%

または

> export PERL5LIB=/foo/bar/baz:$PERL5LIB

Perlモジュールが作られて、perlがそれがどこにあるかを知っていれば、組込のrequire関数を使って探し、Perlのスクリプト中で実行することができます。
例えば、`require Demo::StringUtils` を呼ぶと、PerlインタープリタはPERL5LIBにリストされているディレクトリを順番に`Demo/StringUtils.pm`というファイルを探します。
モジュールがロードされたら、そこで定義されたサブルーチンは、突然にメインスクリプトから利用できるようになります。
この例のスクリプトをmain.plと呼びましょう。続けて読んでくさい:

`require Demo::StringUtils = Demo/StringUtils.pm`

```
use strict;
use warnings;

require Demo::StringUtils;

print zombify("i want brains"); # "r wrnt brrrns"
```
`名前空間`の区切りに::を使っているのに注意してください

ここで問題が表面化します: main.plが、多くのrequire を呼んでいて、それぞれのモジュールがさらにrequireを呼んでいる場合、
zombify()サブルーチンの元の宣言がどこにあるのか、追いにくくなります。その解決策としては、パッケージを使うことです。

`zombify()が どこのモジュールに含まれているかgrepしないとわからない`

### パッケージ
packageは名前空間で、その中でサブルーチンを宣言できます。
宣言したサブルーチンは、暗黙的に、現在のパッケージ内に宣言されます。
実行の最初は、mainパッケージになりますが、組込関数のpackageを使って、パッケージを切り替えられます:

```
use strict;
use warnings;

sub subroutine {
	print "universe";
}

package Food::Potatoes;

# no collision:
sub subroutine {
	print "kingedward";
}
```

名前空間の区切りに::を使っているのに注意してください

サブルーチンを呼んだときはいつでも、暗黙に`現在の`パッケージ内のサブルーチンを呼んでいます。
代わりに、パッケージを明示的に書くこともできます。下のスクリプトを実行したら、何が起きるでしょうか:
```
subroutine();             # "kingedward" # Food::Potatoes::subroutine() になってるg
main::subroutine();       # "universe"g
Food::Potatoes::subroutine(); # "kingedward"
```
ですので、上で述べた問題の論理的な解決策はC:\foo\bar\baz\Demo\StringUtils.pmか/foo/bar/baz/Demo/StringUtils.pmを変更することです:
```
use strict;
use warnings;

package Demo::StringUtils; # packageとして名前空間を切り替えていることで、mainから呼ばれるときに直接呼ばれないようにする

sub zombify {
	my $word = shift @_; # これはサブルーチンがスカラーコンテキストを扱うよう規定してるものだと思う
	$word =~ s/[aeiou]/r/g;
	return $word;
}

return 1;
```
そして、main.plを変更します
```
use strict;
use warnings;

require Demo::StringUtils; # モジュールとして呼び出している

sub zombify {
  my $word = "i am not zonbi";
  retun $word;
}

print Demo::StringUtils::zombify("i want brains"); # "r wrnt brrrns" # main:zombify() は壊さない
```
では、次はちょっと注意して読んでください。

パッケージとモジュールの2つは、プログラミング言語Perlにおいて完全に分かれており、区別された機能です。
この2つが同じダブルコロンのデリミタを使っていることは、大きなひっかけです。
これは、スクリプトまたはモジュールのコース経由でパッケージを複数回切り替えることができ、また、複数のファイル内の複数の場所で同一のパッケージ宣言を使うこともできます。
require Foo::Barを呼ぶことはFoo::Bar名前空間にあるサブルーチンやパッケージ変数を必ずしもロードしませんし、Foo::Bar名前空間のサブルーチンを必ずしもロードするわけではありません。
require Foo::Barを呼ぶことは、単にFoo/Bar.pmというファイルをロードするだけであり、そのファイルに、どのような種類のパッケージ宣言も必要有りません。実際には、package Baz::Quxのようなナンセンスな宣言もできます。

その上、Baz::Qux::processThis()のサブルーチン呼び出しは、Baz/Qux.pmという名前のファイル内に宣言されている必要すらありません。
文字通り、どこにでも定義することができます。

この2つのコンセプトを分けてしまったことは、Perlの最も愚かな特徴の1つであり、
これら2つのコンセプトを分けて取り扱ってしまうと常に、カオスで気の狂ったようなコードとなります。
幸運なことに、Perlプログラマの多くは、次の2つの規則に従っています:

- Perlスクリプト(.plファイル)は、1つのpackage宣言も含まない。
- Perlモジュール(.pmファイル)は、1つのpackage宣言を含み、名前と場所が一致している。

> 例: モジュールDemo/StringUtils.pmは、package Demo::StringUtilsで始まっている。

これにより, 信頼できるサードパーティに作られた、ほとんどの"パッケージ"と"モジュール"を見つけることができ、相互に関係し参照することができます。
しかし、これが当たり前と思わないことは重要です。いつか、常軌を逸した人が作ったコードに出会うでしょう。

`package名とpathはperlから見ると一致しなくても動く、が合わせるのが基本`

### オブジェクト指向Perl
PerlはOOプログラミングに、あまり適した言語ではありません。 PerlのOO能力は後付のものです。それは、

- **オブジェクトは単純に、どのクラスに属しているかを示しているリファレンスです(i.e. スカラ変数)。**
  - `オブジェクトはリファレンスである`

そのリファレントがクラスに属していることをリファレンスに教えるために、blessを使います。
blessにより、どのクラスがどのリファレントに属するのかを分かるようになります。
リファレンスのリファレントがどのクラスに属しているかをみつけるためには、refを使います

- **メソッドは単純に第一引数オブジェクト(または、クラスメソッドであれば、パッケージ名)であるサブルーチンです。**
- **オブジェクトメソッドは、$obj->method()を使って呼び出されます;**
- **クラスメソッドは、Package::Name->method()です**
- **クラスは、単純に`メソッド`を含むパッケージです**

以下、簡単な例でそれをはっきりさせます。 例のモジュールとしてAnimal.pmのクラスAnimalは、次のようになります:
```
use strict;
use warnings;

package Animal;

sub eat {
	# First argument is always the object to act upon.
  ＃ 第１引数は オブジェクト(=リファレンス) @animal,%animalでメンバ変数を取り込む
	my $self = shift @_; # $animal(オブジェクトリファレンス)が入る

	foreach my $food ( @_ ) {   # 第二引数以降が入る
		if($self->can_eat($food)) {  # $selfはオブジェクト(=リファレンス)
			print "Eating ", $food;
		} else {
			print "Can't eat ", $food;
		}
	}
}

# For the sake of argument, assume an Animal can eat anything.
sub can_eat {
	return 1;
}

return 1;
```

このクラスを次のように使う:
```
require Animal;

my $animal = {
	"legs"   => 4,
	"colour" => "brown",
};                   # $animal is an ordinary hash referenceg
print ref $animal;   # "HASH"g
bless $animal, "Animal"; # now it is an object of class "Animal"

print ref $animal;   # "Animal"g
```
注意: 文字通り、どのようなリファレンスも、どのようなクラスにでもblessすることができます。

- (1)リファレンスが実際にそのクラスのインスタンスとして使われているかと、
- (2)問題のクラスが存在し、ロードされているかを保証するのはあなた次第です。

まだ、通常のやり方でオリジナルのハッシュを操作できます

> print "Animal has ", $animal->{"legs"}, " leg(s)";

ですが、同じ->オペレータでオブジェクトからメソッドを呼ぶこともできます。次のようにします:

> $animal->eat("insects", "curry", "eucalyptus");

最後の呼び出しは、以下と同じです

> Animal::eat($animal, "insects", "curry", "eucalyptus")

`最初の引数が $animal であることに注意！ animalオブジェクト`
`クラス側も my $self = shift @_; になってて、$animal が $selfに入っている`


#### コンストラクタ
コンストラクタはクラスメソッドで、新しいオブジェクトを返します。
コンストラクタが欲しければ、それを宣言するだけです。好きな名前を使えます。
クラスメソッドには、最初の引数として、`オブジェクトではなくクラス名が渡ります`。このケースでは、"Animal"です:

```
use strict;
use warnings;

package Animal;

sub new {
	my $class = shift @_; # 第１パラメータの内容はクラス名
	return bless { "legs" => 4, "colour" => "brown" }, $class;  # コンストラクタは bless 関数の値を返す。
}

# ...etc.
```
次のように使います:

> my $animal = Animal->new();


#### 継承
ベースクラスから継承しているクラスを作るには、`use parent`を使います。
Animalをサブクラス化してKoalaでサブクラスを作るとします。場所はKoala.pmになります:

```
use strict;
use warnings;

package Koala;

# Inherit from Animal
use parent ("Animal");

# Override one method #既存のメソッドを上書きする
sub can_eat {
	my $self = shift @_; # Not used. You could just put "shift @_;" here
	my $food = shift @_;
	return $food eq "eucalyptus";
}

return 1;
```
サンプルコード:
```
use strict;
use warnings;

require Koala;

my $koala = Koala->new();

$koala->eat("insects", "curry", "eucalyptus"); # eat only the eucalyptus
```
最後のメソッド呼び出しは、`Koala::eat($koala, "insects", "curry", "eucalyptus")`を呼ぼうとしますが、
サブルーチンeat()は、Koala パッケージには定義されていません。
ですが、Koalaは親クラスAnimalがあるので、Perlインタプリタは
`Animal::eat($koala, "insects", "curry", "eucalyptus")`を代わりに呼ぼうとして、代わりにそれは動きます。
次のことに注意してください。`クラスAnimalはKoala.pmで自動的ににロードされました`。

`use parent` は親クラス名のリストを受け取れます。
Perl は多重継承をサポートします。全ての利益と恐怖を伴いますが。

#### BEGINブロック
BEGINブロックはperlがそのブロックをパースし終えるとすぐに実行されます。
コンパイラがまだ全てをパースしていなくてもです。BEGINブロックは実行時には無視されます。

```
use strict;
use warnings;

print "This gets printed second";

BEGIN {
   print "This gets printed first";g
}

print "This gets printed third";
```
BEGINブロックは常に最初に実行されます。複数のBEGINブロックを書くと(don't)、 上から順番にコンパイラがそれらに出会う順番に実行されます。
BEGINブロックは常に最初に実行されます。もし、BEGINブロックがスクリプトの途中(そんなことはしないでください)や、最後(or this)に書かれていたりしても。コードの自然な順番をめちゃくちゃにしないでください。BEGINブロックは最初に書くこと!

BEGINブロックはそのブロックが解釈されたと同時に実行されます。
一度実行されると、コードのパースはBEGINブロックの終わりで再開されます。
一度スクリプト全体かモジュールがパースされていれば、BEGINブロックの外側のいずれかが実行されます。

```
use strict;
use warnings;

print "This 'print' statement gets parsed successfully but never executed";

BEGIN {
   print "This gets printed first";g
}

print "This, also, is parsed successfully but never executed";

...because e4h8v3oitv8h4o8gch3o84c3 there is a huge parsing error down here.
```
コンパイル時に実行されるので、BEGINブロックが条件ブロックの中にあっても、まだ最初に実行されます。
たとえ、条件の評価が偽であり、条件がまだまったく評価されていないにもかかわらず、実際には、評価されることがないとしてもです。
```
if(0) {
   BEGIN {g
           print "This will definitely get printed";g
   }g
   print "Even though this won't";g
}
```
BEGINブロックを条件の中に置いては行けません!
コンパイル時に何かしらの条件付きのことがしたければ、BEGINブロックの中に条件文を置かなければなりません:
```
BEGIN {
	if($condition) {
		# etc.
	}
}
```
#### use
いいでしょう。
もうわかりにくい、パッケージ、モジュール、クラスメソッドとBEGINブロックの意味を理解したので、よく見かけるuse関数について説明できます。

以下の3つのステートメントは:
```
use Caterpillar ("crawl", "pupate");
use Caterpillar ();
use Caterpillar;
以下とそれぞれ等価です:

BEGIN {
	require Caterpillar;
	Caterpillar->import("crawl", "pupate");
}
BEGIN {
	require Caterpillar;
}
BEGIN {
	require Caterpillar;
	Caterpillar->import();
}
```
いいえ、３つの例は間違った順番ではありません。Perlが馬鹿なだけです。
`useの呼び出しはBEGINブロックに変換されます。`同じ警告が適用されます。
useステートメントはファイルの最初に置かれなければいけません。条件の中に置いてはいけません。

import() はPerlの組込の関数ではありません。
ユーザー定義のクラスメソッドです。import()を定義するか、継承するかの義務はCaterpillarパッケージのプログラマにあり、
メソッドは理論上、どのような引数でも受け入れ、どのようなことでもできます。

use Caterpillar; は何でもできます。Captepillar.pmのドキュメントを読んで、何が起きるか正確に調査してください。
require CaterpillarがCaterpillar.pmという名前のmoduleをロードすることに注意してください。

Caterpillar->import()は、Caterpillar package内に定義されたimport()サブルーチンを呼びます。
モジュールとパッケージが一致していることを期待しましょう!


#### Exporter
http://shin.hateblo.jp/entry/2014/03/14/031059
import()メソッドを定義する常識的な方法は Exporter モジュールから継承することです。
Exporter はコアモジュールで、プログラミング言語Perlのデファクトのコアの機能です。
Exporterのimportの実装で、渡した引数のリストは、サブルーチンの名前として解釈されます。

サブルーチンがimport()されると、現在の名前空間で、そのオリジナルの名前空間にあるかのと同じように利用可能になります。

このコンセプトは例を使うと把握しやすいでしょう。Caterpillar.pmは次のようなものです:
```
use strict;
use warnings;

package Caterpillar;

# Inherit from Exporter
# Exporterはimportクラスメソッドを提供 (Exporterが親クラス)
use parent ("Exporter");

sub crawl  { print "inch inch";   }
sub eat{ print "chomp chomp"; }g
sub pupate { print "bloop bloop"; }

# エクスポート可能な関数を記述 (外部から参照可能にするためグローバル変数に入っている)
our @EXPORT_OK = ("crawl", "eat"); # ourの使い方

return 1;
```
**パッケージ変数@EXPORT_OKにサブルーチン名のリストを含むべきです。**

```
http://d.hatena.ne.jp/TAKESAKO/20080110/1199969773
- our はグローバル変数をスマートに使用するための宣言
  - our $var; = use vars qw($var);
  - our $var = 1; = use vars qw($var); $var = 1;
- local はグローバル変数の値を一時的にスタック上に退避する命令です。スコープの範囲を外れると元の値が復元されます。
- my はレシキカル変数の宣言です。これで宣言された変数はスコープを外れた場所から参照できなくなります。
```

コードの別の部分が、名前でこれらのサブルーチンをimport()するでしょう。典型的に、useステートメントを使います:
```
use strict;
use warnings;

use Caterpillar ("crawl");

crawl(); # "inch inch"
```
このケースでは、現在のパッケージはmainです。
そのため、crawl()の呼び出しは、実際には、main::crawl()を呼びます。
これは、Caterpillar::crawl()にマップされています(インポートされたので)。

注意: @EXPORT_OKの内容は無視して、すべてのメソッドは、常に"longhand"(手書き)で呼ぶこともできます:

```
use strict;
use warnings;
use Caterpillar (); # no subroutines named, no import() call made

# and yet...
Caterpillar::crawl();  # "inch inch"
Caterpillar::eat();# "chomp chomp"g
Caterpillar::pupate(); # "bloop bloop"
```
Perlにはプライベートメソッドはありません。
慣例的に、プライベート用のメソッドは1つか2つのアンダースコアを頭につけた名前をつけます。
`これで直接呼ぶことができなくなるはず？`

@EXPORT
Exporter モジュールは @EXPORTと呼ばれるパッケージ変数も定義します。
ここにもサブルーチン名のリストを入れます。

```
use strict;
use warnings;

package Caterpillar;

# Inherit from Exporter
use parent ("Exporter");

sub crawl  { print "inch inch";   }
sub eat{ print "chomp chomp"; }g
sub pupate { print "bloop bloop"; }

our @EXPORT = ("crawl", "eat", "pupate");

return 1;
```
@EXPORTに書かれたサブルーチンは import()が引数なしで呼ばれた場合にエクスポートされます。この例で起きることが起きます。

```
use strict;
use warnings;
use Caterpillar; # calls import() with no arguments

crawl();  # "inch inch"
eat();# "chomp chomp"g
pupate(); # "bloop bloop"
```
ですが、ここでシチュエーションにどのように戻るか注意してください。
他のものなしに、crawl()がもともとどこで定義されているかを知るのは簡単ではありません。
`-> メソッドがどこで定義されているわからないので、明示的にimportするべき`

Exporterを使うモジュールを作る際には、`デフォルトでサブルーチンをエクスポートする@EXPORTを使わないこと。`
常に、ユーザーに、"longhand"でサブルーチンを呼ばせるか、明示的にimport()させること
(e.g. use Caterpillar ("crawl")を使って。Caterpillar.pmにcrawl())の定義があるという強いヒントになります。

モジュールをuseすると、常に明示的にimport()したいサブルーチンの名前書きます。
何のサブルーチンもimport()したくなく、longhandで参照したいのなら、空のリストを提供しなければいけません: `use Caterpillar ().`

### その他の注意

- コアモジュールData::Dumperは任意のスカラをスクリーンに出力するのに使えます。これは基本的なデバッグツールです。

- 配列を宣言するための代わりのシンタックス、qw{ }があります。useステートメントでよく見られます:
  - 多くの他のクォートライクなオペレータがあります。

> use Account qw{create open close suspend delete};

- =~ m// と =~ s/// 演算子で、正規表現の区切り文字にスラッシュの代わりにブレースを使えます。
  - これは、正規表現が多くのスラッシュやバックスラッシュを含む場合に、非常に有用です。
- 例えば、m{///}は、前方の3文字のスラッシュにマッチします。
- また、=~ s{^https?://}{} は、URLからプロトコル部分を削除します。g

- Perlには定数があります。 気落ちするようなものですが、常にではありません。
  - 定数は実際には、ブラケットを省略したただのサブルーチン呼び出しです。

- 時々、ハッシュのキーでクォートを省略して、`$hash{key}を$hash{"key"}`の代わりに使えます
  - key()のようにすると、サブルーチン呼び出しになります。

- like <<EOFのように、2つの山括弧で区切られてラップされた整理されていないコードのブロックを見たら、Google検索のためのマジックワードは"ヒアドキュメント(here-doc)"です。

- 注意! 多くの組込関数では、引数なしで呼ぶと`$_`が代わりに渡されます。願わくば、次のような形を理解する助けになれば良いのですが:

```
print foreach @array;
```
そして
```
foreach ( @array ) {
	next unless defined;
}
```
私は、この形は嫌いです。リファクタリングの際に、問題を起こすことがあるからです。

これで、2.5時間です。
