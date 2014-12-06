#!perl -w

use strict;
use 5.010;

sub greet{
	my ($name) = @_;
	state @guests;
	if(@guests != 0){
		print "Hi, $name! I've seedn: @guests\n";
	} else {
		print "Hi, $name! You are the first one here!\n";
	}
	push @guests, $name
}

greet "Fred";
greet "Barney";
greet "Wilma";
greet "Betty";