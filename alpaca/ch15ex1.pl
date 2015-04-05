#!perl

use strict;
use FindBin qw($Bin);
use lib "$Bin/lib";

use Oogaboogoo::date qw(trans_day trans_mon);

my ($sec, $min, $hour, $day, $mon, $year) = localtime;
my $o_day = trans_day($day);
my $o_mon = trans_mon($mon);
$year += 1900;
print "Today of Oogaboogoo is $o_day, $o_mon, $year.\n";