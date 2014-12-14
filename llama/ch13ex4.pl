use warnings;
use strict;

my $succ = unlink @ARGV;
print "Delete file @ARGV failed: $!." unless $succ;
