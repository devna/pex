use warnings;
use strict;

my %last_name = (fred => 'flintstone', barney => 'rubble', wilma => 'flintstone');
print "Please input first name: ";
chomp(my $first_name = <STDIN>);
print "Last name for $first_name is: $last_name{$first_name}";