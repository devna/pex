#!perl

use strict;

my @size_lt_1k = grep {-s $_ < 1000} @ARGV;
print map {" " x 4 . $_ . "\n"} @size_lt_1k;