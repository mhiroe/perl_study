use RaceHorse;

my $racer = RaceHorse->named('Billy Boy');
# 出走結果の記録: 優勝3回、3着1回、着外1回
$racer->won;
$racer->won;
$racer->won;
$racer->showed;
$racer->lost;
print $racer->name, ' has standings of: ', $racer->standings, ".\n";
