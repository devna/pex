use warnings;
use strict;

use 5.010;

my $rand_int = int(1 + rand 100);
print "Please input a number between 1 and 100: ";
while(my $guess = <STDIN>){
	chomp $guess;
	given($guess){
		when($_ =~ /exit|quit|(^\s*$)/i){ print "Exit...\n"; last; }
		when(! /^\d+$/){print "Not a number.\n";}
		when($_ == $rand_int){ print "Right!\n"; last; }
		when($_ < $rand_int){ print "Too low.\n"; }
		when($_ > $rand_int){ print "Too high.\n"; }
	}
}