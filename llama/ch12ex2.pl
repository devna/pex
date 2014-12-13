use warnings;
use strict;

die "Please supply file names." unless @ARGV;

my $old_name = shift @ARGV;
my $old_age = -M $old_name;
for my $file (@ARGV){
	my $age = -M $file;
	($old_name, $old_age) = ($file, $age) if $old_age < $age;
}

printf "The oldest file is %s, and it's age is %.1fd.\n", $old_name, $old_age;