use warnings;
use strict;
use 5.010;

my $debug = $ENV{DEBUG} // 1;
my $rand_num = int(1 + rand 100);
say "The random num is $rand_num" if $debug;

print "Please guess a num: ";
while(<STDIN>){
	chomp;
	if($_ =~ /quit|exit|^\s*$/i){
		last;
	} elsif ($_ == $rand_num){
		say "Your are right!";
		last;
	} 
		
	print $_ > $rand_num ? "Too high, try again: " : "Too low, try again: ";
}
