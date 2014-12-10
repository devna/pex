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
	s/Fred/Larry/ig;
	print OUT $_;
}