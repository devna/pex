#!perl -w

@names = qw/fred betty barney dino wilma pebbles bamm-bamm/;
print "Please input numbers(one number per line, Control-Z for end):\n";
chomp(@idxes = <STDIN>);
print "Names in list are:\n";
foreach $idx (@idxes){
	print "$names[$idx - 1]\n";
}