use warnings;
use strict;

print "Please input directory name(default is your home directory): ";
chomp(my $dir = <STDIN>);
unless($dir =~ /^\s*$/){
	chdir $dir or die "Can't change to directory $dir: $!.";
} else {
	chdir or die "Can't change to your home directory: $!.";
}

opendir CURDIR, "." or die "Can't open current directory: $!.";
my @file_list = sort readdir CURDIR;
print "File list of current directory: " if @file_list;
print join "\n", @file_list;