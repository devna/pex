#!perl

use strict;

{ package Animal;
  use Carp qw(croak);
  use Scalar::Util qw(weaken);
  
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
  
  sub DESTROY {
	my $self = shift;
	print '[', $self->name, " has died.]\n";
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
  sub DESTROY {
	my $self = shift;
	$self->SUPER::DESTROY;
	print "[", $self->name, " has gone off to the glue factory.].\n";
  }
}

{ package RaceHorse;
  our @ISA = qw(Horse);
  
  dbmopen (our %STANDINGS, "samples/standings", 0666) or die "Can't access standings dbm: $!";
  
  sub named {
	my $self = shift->SUPER::named(@_);
	my $name = $self->name;
	my @standings = split ' ', $STANDINGS{$name} || "0 0 0 0";
	@$self{qw(wins places shows losses)} = @standings;
	$self;
  }
  
  sub DESTROY {
	my $self = shift;
	$STANDINGS{$self->name} = "@$self{qw(wins places shows losses)}";
	$self->SUPER::DESTROY;
  }
  
  sub won { shift->{wins}++; }
  sub placed { shift->{places}++; }
  sub showed { shift->{shows}++; }
  sub lost { shift->{losses}++; }
  sub standings {
	my $self = shift;
	join ", ", map "$self->{$_} $_", qw(wins places shows losses);
  }
}

my $runner = RaceHorse->named('Billy Boy');
$runner->won;
print $runner->name, ' has standings ', $runner->standings, ".\n";