#!perl -w

use strict;

sub total{
	my @list = @_;
	my $sum = 0;
	for my $elem (@list){
		$sum += $elem;
	}
	$sum;
}

my $one_to_thousand_total = &total(1..1000); 
print "The sum of 1 to 1000 is $one_to_thousand_total.\n";