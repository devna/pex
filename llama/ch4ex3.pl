#!perl -w

use strict;

sub above_average{
	my @list = @_;
	my $average = average(@list);
	my @result;
	for my $elem (@list){
		if($elem > $average){
			push @result, $elem;
		}
	}
	@result;
}

sub average{
	my @list = @_;
	my ($sum, $num) = (0, 0);
	for my $elem (@list){
		$sum += $elem;
		$num++;
	}
	$sum / $num;
}

my @fred = above_average(1..10);
print "\@fred is @fred\n";
print "(Should be 6 7 8 9 10)\n";
my @barney = above_average(100, 1..10);
print "\@barney is @barney\n";
print "(Should be just 100)\n";