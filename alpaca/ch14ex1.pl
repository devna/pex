#!perl

use strict;

{ package MyDate;
  our $AUTOLOAD;
  
  use Carp;
  
  my %allowed_methods = (day=>3, month=>4, year=>5);
  my @offset = qw(0 0 0 0 1 1900 0 0 0);
  
  sub new { bless {}, $_[0]; }
  
  sub AUTOLOAD {
	my $method = $AUTOLOAD;
	$method =~ s/.*:://;
	
	unless (exists $allowed_methods{$method}) {
		carp "Unknown method: $method";
		return;
	}
	
	my $slice_idx = $allowed_methods{$method};
	(localtime)[$slice_idx] + $offset[$slice_idx];
  }
}

my $date = MyDate->new();
print "The day is " . $date->day . "\n";
print "The month is " . $date->month . "\n";
print "The year is " . $date->year . "\n";