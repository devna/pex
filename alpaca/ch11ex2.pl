#!perl

use strict;

{ package LivingCreature;
  sub speak {
    my $class = shift;
	if(@_) {
	  print "a $class goes '@_'!\n";
	} else {
	  print "a $class goes ", $class->sound, "!\n";
	}
  }
}

{ package Animal;
  our @ISA = qw(LivingCreature);
  sub sound {die "all Animals should define a sound"};
  sub speak {
	my $class = shift;
	die "animals can't talk!" if @_;
	$class->SUPER::speak;
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

{ package Person;
  use base qw(LivingCreature);
  sub sound {'hmmmm'};
}

Person->speak;
Person->speak('Hello world');