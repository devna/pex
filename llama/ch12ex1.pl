use warnings;
use strict;

sub attrs{
	my $file = shift @_;
	return "doesn't exist." unless -e $file;
	
	my @attrs;
	push @attrs, "readable" if -r $file;
	push @attrs, "writeable" if -w $file;
	push @attrs, "executable" if -x $file;
	return "exists." unless @attrs;
	
	" is" . join " and ", @attrs;
}

for my $file (@ARGV){
	print "$file " . &attrs($file), "\n";
}