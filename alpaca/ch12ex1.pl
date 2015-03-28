#!perl

use strict;

{ package Animal;
  use Carp qw(croak);

  sub speak {
	my $either = shift;
	print $either-> name, " goes ", $either->sound, "!\n";
  }
  
  sub named {
	ref(my $class = shift) and croak "class name needed";
	my $name = shift;
	my $self = {Name=>$name, Color=>$class->default_color};
	bless $self, $class;
  }
  
  sub default_color {
    "black";
  }
  
  sub sound {
	croak "subclass must define a sound method";
  }
  
  sub name {
	my $either = shift;
	ref $either ? $either->{Name} : "an unnamed $either";
  }
  
  sub set_name {
	ref(my $self=shift) or croak "instance variable 'Name' needed";
	$self->{Name} = shift;
  }
  
  sub color {
	my $either = shift;
	ref $either ? $either->{Color} : $either->default_color;
  }
  
  sub set_color {
	ref(my $self=shift) or croak "instance variable 'Color' needed";
	$self->{Color} = shift;
  }
}

{ package Horse;
  use base qw(Animal);
  sub sound {'neigh'};
}

{ package Sheep;
  our @ISA = qw(Animal);
  sub sound {'baaah'};
  sub default_color {'white'};
}

my $tv_horse = Horse->named('Mr. Ed');
$tv_horse->set_name('Mister Ed');
$tv_horse->set_color('grey');
print $tv_horse->name, ' is ', $tv_horse->color, "\n";
print Sheep->name, ' colored ', Sheep->color, ' goes ', Sheep->sound, "\n";
