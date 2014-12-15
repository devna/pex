use warnings;
use strict;

my %last_name = qw{ fred flintstone Wilma Flintstone Barney Rubble betty rubble Bamm-Bamm Rubble PEBBLES FLINTSTONE};
my @seq_last_names = sort {"\L$last_name{$a}" cmp "\L$last_name{$b}" or "\L$a" cmp "\L$b"} keys %last_name;
printf "%10s => %s\n", $_, $last_name{$_} foreach (@seq_last_names);