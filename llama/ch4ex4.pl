#!perl -w

use strict;
use 5.010;

sub greet{
	my ($name) = @_;
	state $before;
	if(defined($before)){
		print "Hi, $name! $before is also here!\n";
	} else {
		print "Hi, $name! You are the first one here!\n";
	}
	$before = $name;
}

greet("Fred");
greet("Barney");