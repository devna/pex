use warnings;
use strict;

use File:Basename;

my $symlink = @ARGV[0] eq "-s";
shift @ARGV if $symblink;

my ($source, $dest) = @ARGV;

if(-d $dest){
	my $base = basename $dest;
	$dest = $dest . $base;
}

if($symblink){
	symlink $source, $dest or die "Can't create symbol link from $source to $dest: $!.";
} else {
	link $source, $dest or die "Can't link from $source to $dest: $!.";
}