use warnings;
use strict;

use File:Basename;

my ($source, $dest) = @ARGV;

if(-d $dest){
	my $base = basename $dest;
	$dest = $dest . $base;
}

rename $source, $dest or die "Can't rename from $source to $dest: $!.";