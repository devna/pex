use warnings;
use strict;

use 5.010;

foreach (1..105){
	my $out = '';
	when(not $_ % 3){ $out .= ' Fizz'; continue; }
	when(not $_ % 5){ $out .= ' Bin'; continue; }
	when(not $_ % 7){ $out .= ' Sausage'; }
	print "$_ -> $out\n";
}