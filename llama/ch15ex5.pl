use warnings;
use strict;

use 5.010;

print "Please input a number: ";
chomp(my $number = <STDIN>);

given($number){
	when(! /^\d+$/){
		print "$number is not a number.\n";
	}
	
	my @divisors = divisors($number);
	when(2 ~~ @divisors){
		print "$number is even.\n";
		continue;
	}
	when(!(2 ~~ @divisors)){
		print "$number is odd.\n";
		continue;
	}
	when(!@divisors){
		print "$number is a prime number.\n";
		continue;
	}
	my $fav = 42;
	push @divisors, $number;
	when($fav ~~ @divisors){
		print "$number can be divided by my favorite number.\n";
		continue;
	}
	when(!($fav ~~ @divisors)){
		print "$number can't be divided by my favorite number.\n";
	}
}

sub divisors{
	my $number = shift;
	
	my @divisors = ();
	foreach my $divisor (2 .. ($number/2)){
		push @divisors, $divisor unless $number % $divisor;
	}
	
	return @divisors;
}