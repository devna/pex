# Before 'make install' is performed this script should be runnable with
# 'make test'. After 'make install' it should work as 'perl My-List-Util.t'

#########################

use strict;
use warnings;

use Test::More tests => 10;
BEGIN { use_ok('My::List::Util') };

#########################

ok(defined &sum, "The sum() routine exists.");

is(sum(1,1), 2, "1 + 1 = 2");
is(sum(1,2,3), 6, "1 + 2 + 3 = 6");
is(sum(-1), -1, "-1 = -1");
is(sum(), 0, "Sum of empty list is 0");
is(sum(1, 'hello'), 1, "Sum of 1 and a string is 1");
is(sum('hello', 'world'), 0, "Sum of two string is 0");

ok(defined &shuffle, "The shuffle() routine exists.");

my $array = [qw(a b c d e f g)];
my $shuffled = [@$array];
shuffle($shuffled);
my $count = 0;
foreach my $idx (0..$#$array) {
	$count++ if $shuffled->[$idx] eq $array->[$idx];
}
cmp_ok($count, '<', $#$array-2, "At least two positions are different.");