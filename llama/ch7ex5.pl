use warnings;
use strict;

while(<>){
	if(/([^ ])\1/){
		print;
	}
}