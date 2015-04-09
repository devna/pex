package Test::My::List::Util;

use 5.020000;
use strict;
use warnings;

use base qw(Exporter);
our @EXPORT = qw(sum_ok not_sum_ok);
our $VERSION = '0.01';

use Test::Builder;

my $test = Test::Builder->new();
sub sum_ok {
	my $actual = shift;
	my $expect = shift;
	
	if($actual == $expect){
		$test->ok(1);
	} else {
		$test->diag(
			"The sum is not right!\n",
			"\tActual: $actual\n",
			"\tExpect: $expect\n",
		);
		$test->ok(0);
	}
}

sub not_sum_ok {
	my $actual = shift;
	my $expect = shift;
	
	if($actual == $expect){
		$test->diag(
			"The sum is right!\n",
			"\tActual: $actual\n",
			"\tExpect: $expect\n"
		);
		$test->ok(0);
	} else {
		$test->ok(1);
	}
}

1;