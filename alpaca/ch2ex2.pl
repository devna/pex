#!perl

use strict;

my @dirs = qw(/etc /home /boot /var /usr /opt);
while(1){
	print "\nenter pattern: ";
	chomp(my $pattern = <STDIN>);
	last if $pattern =~ /^\s+$/;
	
	my @matches = grep eval{/$pattern/}, @dirs;
	print "regex exception catched: $@" if $@;
	print "pattern matched: @matches" if @matches;
}