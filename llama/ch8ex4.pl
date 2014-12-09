#!perl -w

while(<>){
	chomp;
	if(/\b(?<word>\w*a)\b/){
		print "Matched: |$`<$&>$'|\n";
		print "'word' contains '$+{word}'\n";
	} else {
		print "No match: |$_|\n";
	}
}