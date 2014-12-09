#!perl -w

while(<>){
	chomp;
	if(/\b(?<word>\w*a)\b(?<follow>.{0,5})/){
		print "Matched: |$`<$&>$'|\n";
		print "'word' contains '$+{word}', followed 5 characters '$+{follow}'\n";
	} else {
		print "No match: |$_|\n";
	}
}