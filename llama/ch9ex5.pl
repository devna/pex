use warnings;
use strict;

my %add_cr;
foreach(@ARGV){
	$add_cr{$_} = 0;
}

while(<>){
	if(/^## Copyright/){
		delete $add_cr{$ARGV};
	}
}

@ARGV = keys %add_cr;
$^I = '.bak';
while(<>){
	if(/^#!/){
		$_ .= "## Copyright (C) 2014 by Aaron\n";
	}
	print;
}