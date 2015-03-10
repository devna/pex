#!perl

use strict;
use IO::File;

my %output;

while(<>){
        chomp;
        my @splits = split /:/;
        my $key = lc $splits[0];
        $output{$key} = IO::File->new("samples/$key.info", "w") unless exists $output{$key}; 
        print {$output{$key}} $_ . "\n";
}
