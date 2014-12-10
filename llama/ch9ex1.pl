use warnings;
use strict;

sub match3times{
	my ($pattern, $string) = @_;
	if($string =~ /($pattern){3}/){
		print "Matched: <$&>\n";
	} else {
		print "Not match\n";
	}
}

my $what = 'fred|barney';
while(<>){
	match3times($what, $_);
}