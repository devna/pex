use warnings;
use strict;
use 5.010;

say "Please input lines:";
chomp(my @lines = <STDIN>);
say "Lines with ruler:";
say "1234567890" x 4;
foreach (@lines){
	printf "%20s\n", $_;
}