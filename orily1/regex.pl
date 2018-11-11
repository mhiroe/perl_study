use strict;
use warnings;

egrep 'Completed|Started' gm_tool.log.20180830|
perl -ne '

/time:\S+ (\S+)/; # \S は スペース"以外" の文字  (\S+) これはパターン かつ一致したものを$1に入れる
$time=$1;
if(/msg:Started/) # 条件
  {$worker++}
elsif(/msg:Completed/)
  {$worker--}
print "$time worker $worker\n"' #これだと全部出力する

# Perlなどの正規表現においては「カッコで括ったところ」というのは、大きな意味を持ちます。
# 正規表現としては ^#\d+<\d+>$ とも書けて、\d というのが数字(0-9)、 + というのが1文字以上の連続という意味ですから、
# まさに #5678<0987> のようなものに対してマッチするのですが、その「マッチ」した際に、
# その中のさらにカッコで括ったところに「マッチ」した場合、その部分文字列を取り出すことが可能です。
# 最初のカッコにマッチした部分を $1 、2番目のカッコの場合は $2 のような特殊変数に勝手に入ってくれるので、それを取り出せるのです。
# 非常によく使うテクニックです。


# output examale
# [infra@gw2353 log]$ egrep 'Completed|Started' gm_tool.log.20180830| perl -ne '/time:\S+ (\S+)/;$time=$1;if(/msg:Started/){$worker++}elsif(/msg:Completed/){$worker--}print "$time worker $worker\n"' | tail
# 13:47:48 worker 6
# 13:47:48 worker 5
# 13:47:50 worker 6
# 13:47:50 worker 5
# 13:47:50 worker 6
# 13:47:51 worker 5
# 13:47:52 worker 6
# 13:47:52 worker 5
# 13:48:14 worker 6
# 13:48:15 worker 5
#
# - こういうログ
# > time:2018-10-18 13:03:34 +0900  severity:INFO   pid:6210        msg:Started GET "/ope/game_setting/ga1.254 at 2018-10-18 13:03:34 +0900
