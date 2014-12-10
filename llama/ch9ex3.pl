use warnings;
use strict;

my $in = $ARGV[0];
if(! defined($in)){
	die "useage: $0 filename";
}

my $out = $in . ".out";

if(!(open IN, "<$in")){
	die "Can't open file $in: $!";
}
if(!open(OUT, ">$out")){
	die "Can't write file $out: $!";
}

while(<IN>){
	s/Fred/\0/ig;
	s/Wilma/Fred/gi;
	s/\0/Wilma/g;
	print OUT $_;
}