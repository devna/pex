#!perl

use warnings;
use strict;

print `date` =~ /^(Sat|Sun)/ ? "go play" : "go to work";