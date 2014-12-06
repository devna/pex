use warnings;
use strict;
use 5.010;

say "Please input lines:";
chomp(my @lines = <STDIN>);
say "Please input line width:";
chomp(my $width = <STDIN>);
say "Lines with ruler:";
say "1234567890" x ($width / 10 + 1);
foreach (@lines){
	printf "%${width}s\n", $_;
}