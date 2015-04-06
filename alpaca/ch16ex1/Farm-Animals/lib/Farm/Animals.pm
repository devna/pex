package Farm::Animals;

use 5.020000;
use strict;
use warnings;
use Carp qw(croak);

require Exporter;

our @ISA = qw(Exporter);

# Items to export into callers namespace by default. Note: do not export
# names by default without a very good reason. Use EXPORT_OK instead.
# Do not simply export all your public functions/methods/constants.

# This allows declaration	use Farm::Animals ':all';
# If you do not need this, moving things directly into @EXPORT or @EXPORT_OK
# will save memory.
our %EXPORT_TAGS = ( 'all' => [ qw(	) ] );

our @EXPORT_OK = ( @{ $EXPORT_TAGS{'all'} } );

our @EXPORT = qw();

our $VERSION = '0.01';

# Preloaded methods go here.
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

1;
__END__

=head1 NAME

Farm::Animals - Abstract animal interface

=head1 SYNOPSIS

  use Farm::Animals;

=head1 DESCRIPTION

Stub documentation for Farm::Animals, created by h2xs. 

=head2 EXPORT

None by default.

=head1 SEE ALSO

Chapter 12 exercise 1.

=head1 AUTHOR

Aaron <nzw0402@gmail.com>

=head1 COPYRIGHT AND LICENSE

Copyright (C) 2015 by Aaron

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself, either Perl version 5.20.0 or,
at your option, any later version of Perl 5 you may have available.

=cut
