#!perl

use warnings;
use strict;

open FILE, "samples/sample_text" or die "Can't open file: $!";
chomp(my @lines = <FILE>);

print "Please input pattern: ";
while(my $pattern = <STDIN>){
	chomp $pattern;
	if($pattern =~ /^\s*$/){
		print "exiting ...";
		last;
	}
	
	my @matches = eval{ grep /$pattern/, @lines };
	if($@){
		print "error: $@";
		next;
	}
	
	my $count = @matches;
	print "found $count matches:\n", map "$_\n", @matches;
	
	print "\nPlease input another pattern: ";
}
