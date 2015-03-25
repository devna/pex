#!perl

use strict;
use FindBin qw($Bin);
use lib "$Bin/lib";

require "ch10ex1.pm";

my ($sec, $min, $hour, $mday, $mon, $year, $wday) = localtime;
my $ooday = Oogaboogoo::date::trans_day($wday);
my $oomon= Oogaboogoo::date::trans_mon($mon);
print "Today is $ooday, $oomon $mday, $year";