#!perl

use strict;
use IO::Dir;

foreach my $dir (@ARGV){
        my $dir_fh = IO::Dir->new($dir);
        while(defined(my $file = $dir_fh->read)){
                next if $file =~ /^\./;
                print "$file\n"; 
        }
}

