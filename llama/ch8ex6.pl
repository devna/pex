#!perl -w

while(<>){
	chomp;
	if(/\s+$/){
		print "Found: $_|\n";
	} else {
		print "Not found\n";
	}
}