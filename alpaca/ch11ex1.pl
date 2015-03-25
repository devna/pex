#!perl

use strict;

{ package Animal;
  sub speak {
	my $class = shift;
	print "a $class goes ", $class->sound, "!\n";
  }
}

{ package Cow;
  use base qw(Animal);
  sub sound {'moooo'};
}

{ package Horse;
  use base qw(Animal);
  sub sound {'neigh'};
}

{ package Sheep;
  our @ISA = qw(Animal);
  sub sound {'baaah'};
}

{ package Mouse;
  our @ISA = qw(Animal);
  sub sound {'squeak'};
  sub speak{
	my $class = shift;
	$class->SUPER::speak;
	print "[but you can barely hear it!]\n";
  }
}

my @pasture = qw(Cow Horse Sheep Mouse);
for my $beast (@pasture){
  $beast->speak;
}