use warnings;
use strict;

use File:Basename;

my ($source, $dest) = @ARGV;

if(-d $dest){
	my $base = basename $dest;
	$dest = $dest . $base;
}

link $source, $dest or die "Can't link from $source to $dest: $!.";