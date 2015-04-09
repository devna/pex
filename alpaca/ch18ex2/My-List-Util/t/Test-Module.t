use strict;
use warnings;

use My::List::Util;
use Test::More tests => 2;
use Test::My::List::Util;

my $sum = sum(2, 2);
sum_ok($sum, 4, "$sum is 4");
not_sum_ok($sum, 5, "$sum is not 4");