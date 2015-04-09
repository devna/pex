package My::List::Util;

use 5.020000;
use strict;
use warnings;

require Exporter;

our @ISA = qw(Exporter);

# Items to export into callers namespace by default. Note: do not export
# names by default without a very good reason. Use EXPORT_OK instead.
# Do not simply export all your public functions/methods/constants.

# This allows declaration	use My::List::Util ':all';
# If you do not need this, moving things directly into @EXPORT or @EXPORT_OK
# will save memory.
our %EXPORT_TAGS = ( 'all' => [ qw(sum shuffle) ] );

our @EXPORT_OK = ( @{ $EXPORT_TAGS{'all'} } );

our @EXPORT = qw(sum shuffle);

our $VERSION = '0.01';


# Preloaded methods go here.
sub sum {
	my @list = @_;
	my $sum = 0;
	$sum += $_ foreach @list;
	$sum;
}

sub shuffle {
	my $list_ref = shift;
	my $i = @$list_ref;
	while($i--){
		my $j = int rand($i+1);
		@$list_ref[$i, $j] = @$list_ref[$j, $i];
	}
}

1;
__END__
# Below is stub documentation for your module. You'd better edit it!

=head1 NAME

My::List::Util - Chapter 17 exercise 1

=head1 SYNOPSIS

  use My::List::Util;
  sum(@list);
  shuffle($list_ref);

=head1 DESCRIPTION

Chapter 17 exercise 1

=head2 EXPORT

None by default.

=head1 AUTHOR

Aaron, E<lt>nzw0402@gmail.comE<gt>

=head1 COPYRIGHT AND LICENSE

Copyright (C) 2015 by Aaron

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself, either Perl version 5.20.0 or,
at your option, any later version of Perl 5 you may have available.


=cut
