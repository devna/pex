#!perl

use strict;
use Benchmark qw(timethese);

my @files = glob "samples/*";

timethese(-10, {
    'Original' => sub {my @sorted = sort {-s $a<=> -s $b} @files},
    'Schwartzion' => sub {
        my @sorted = map $_->[0],
            sort {$_->[1] <=> $_->[1]}
            map [$_, -s $_],
            @files 
    },
});
