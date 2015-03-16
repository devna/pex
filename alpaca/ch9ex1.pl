#!perl

use strict;

my @sorted = 
   map $_->[0],
   sort {$a->[1] <=> $b->[1]}
   map [$_, -s $_],
   glob "d:/gitrepos/pex/llama/*";
   
print map $_ . "\n", @sorted;