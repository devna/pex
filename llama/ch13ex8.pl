use warnings;
use strict;

for(<* .*>){
	my $dest = readlink $_;
	print "$_ point to $dest\n" if defined $dest;
}