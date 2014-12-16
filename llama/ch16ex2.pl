#!perl

use warnings;
use strict;

open STDOUT, ">ls.out" or die "Can't redirect stdout";
open STDERR, ">ls.err" or die "Can't redirect stderr";

chdir "/" or die "Can't change to root directory: $!";
exec "ls", "-l" or die "Can't list directoy: $!";