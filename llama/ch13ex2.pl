use warnings;
use strict;

print "Please input directory name(default is your home directory): ";
chomp(my $dir = <STDIN>);
unless($dir =~ /^\s*$/){
	chdir $dir or die "Can't change to directory $dir: $!.";
} else {
	chdir or die "Can't change to your home directory: $!.";
}

my @file_list = sort glob "* .*";
print "File list of $dir: \n" if @file_list;
foreach (@file_list){
	print "$_\n";
}