use warnings;
use strict;
use 5.010;

my $rand_num = int(1 + rand 100);

print "Please guess a num: ";
while(<STDIN>){
	chomp;
	if($_ =~ /quit|exit|^\s*$/i){
		last;
	} elsif ($_ == $rand_num){
		print "Your are right!";
		last;
	} 
		
	print $_ > $rand_num ? "Too high, try again: " : "Too low, try again: ";
}
