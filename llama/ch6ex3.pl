use warnings;
use strict;

$ENV{TEST_ENV} = "Test Environment variable";
my $max_len = 0;
for my $key (keys %ENV){
	my $len = length($key);
	if($len > $max_len){
		$max_len = $len;
	}
}
foreach my $key (sort keys %ENV){
	printf "%-${max_len}s  %s\n", $key, $ENV{$key};
}