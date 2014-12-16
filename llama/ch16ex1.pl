#!perl

use warnings;
use strict;

chdir "/" or die "Can't change to root directory: $!";
exec "ls", "-l" or die "Can't list directoy: $!";