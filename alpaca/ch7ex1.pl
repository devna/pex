#!perl

use strict;
use File::Find;
use Time::Local;

sub gather_mtime_between{
        my ($start, $stop) = @_;
        my @files;
        return (sub{
                my $mtime = (stat $_)[9];
                push @files, $File::Find::name if $mtime > $start and $mtime < $stop; 
        }, sub{
                @files; 
        });
}

my $target_dow = 5;
my @starting_directories = (".");

my $seconds_per_day = 24 * 60 * 60;
my ($sec, $min, $hour, $day, $mon, $yr, $dow) = localtime;

my $start = timelocal(0, 0, 0, $day, $mon, $yr);
while($dow != $target_dow){
        $start -= $seconds_per_day;
        $dow += 7 if --$dow < 0;
}
my $stop = $start + $seconds_per_day;

my ($gather, $yield) = gather_mtime_between($start, $stop);
find($gather, @starting_directories);
my @files = $yield->();

for my $file (@files){
        my $mtime = (stat $file)[9];
        my $when = localtime $mtime;
        print "$when: $file\n";
}
