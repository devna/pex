#!perl -w

while(<>){
	chomp;
	if(/YOUR_PATTERN_GOES_HERE/){
		print "Matched: |$`<$&>$'|\n";
	} else {
		print "No match: |$_|\n";
	}
}