use warnings;
use strict;
use 5.010;

die "Please supply file names." unless @ARGV;

for my $file (@ARGV){
	say "$file belongs me, and it is readable and writeable." if -r -w -o $file;
}