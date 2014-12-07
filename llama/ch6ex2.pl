use warnings;
use strict;
use 5.010;

say "Please input words(one word per line, Contrl-Z for end):";
chomp(my @words = <STDIN>);
my %count;
for my $word (@words){
	$count{$word} += 1;
}
printf "Words count report:\n%10s %10s\n", "word", "count";
for my $key (sort keys %count){
	printf "%10s %10s\n", $key, $count{$key};
}