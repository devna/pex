use warnings;
use strict;

use 5.010;

print "Please input a number: ";
chomp(my $number = <STDIN>);

given($number){
	when(! /^\d+$/){
		print "$number is not a number.\n";
	}
	when(! divisors($number)){
		print "$number is a prime number.\n";
	}
	default{
		my @divisors = divisors($number);
		print "The divisors of $number are: @divisors\n";
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