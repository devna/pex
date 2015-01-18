#!perl

use strict;
use Business::ISBN;

my $isbn10 = Business::ISBN -> new('0596102062');
print 'Country code: ' . $isbn10 -> group_code . "\n";
print 'Publisher code: ' . $isbn10 -> publisher_code . "\n";