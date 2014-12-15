use warnings;
use strict;

my @numbers;
push @numbers, split while <>;
printf "%10g\n", $_ foreach (sort {$a<=>$b} @numbers);