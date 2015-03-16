#!perl

use strict;

my @strs = qw(Marry-Ann Nash Michael words 2015 a4b Bash);
my @sorted_strs = 
	map $_->[0],
	sort {
		$a->[1] cmp $b->[1];
	}
	map {
		my $str = $_;
		$str =~ tr/A-Z/a-z/;
		$str =~ tr/a-z//cd;
		[$_, $str];
	}
	@strs;
	
print "@sorted_strs";