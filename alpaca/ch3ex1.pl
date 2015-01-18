#!perl

use strict;
use Cwd qw(getcwd);
use File::Spec;

my $dir = getcwd;
opendir DIR, $dir or die "Open current directory failed: $!";
foreach my $file (readdir DIR) {
	print " " x 4 . File::Spec -> catfile($dir, $file) . "\n" unless $file =~ /^\./;
}
closedir DIR;