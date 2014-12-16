use warnings;
use strict;

use 5.010;

foreach (@ARGV){
	my $status = '';
	when(-r $_) {$status .= ' readable'; continue;}
	when(-w _) {$status .= ' writable'; continue;}
	when(-x _) {$status .= ' executable'; continue;}
	print "$_ is$status.\n";
}