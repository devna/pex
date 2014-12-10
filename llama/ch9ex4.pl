use warnings;
use strict;

$^I = '.bak';
while(<>){
	if(/^#!/){
		$_ .= "## Copyright (C) 2014 by Aaron\n";
	}
	print;
}