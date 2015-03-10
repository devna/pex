#!perl

use strict;
use IO::Tee;

print "Enter output type [file/scalar/tee] : ";
chomp(my $type = <STDIN>);

my $string;
my $handler;
if($type =~ /^file/i){
        $handler = IO::File->new("samples/$0.out", 'w');
} elsif ($type =~ /^scalar/i){
        $handler = IO::File->new(\$string, 'w');
} elsif ($type =~ /^tee/i){
        $handler = IO::Tee->new(IO::File->new("samples/$0.out", 'w'), IO::File->new(\$string, 'w'));
}

my $date = localtime;
my $dow = (localtime)[6];

print {$handler} "Date: $date\n";
print {$handler} "Day of week: $dow\n";

if($type =~ /^(scalar|tee)/i){
        print $string;
}
