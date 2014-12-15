use warnings;
use strict;

print "Please input sentence: ";
chomp(my $sentence = <STDIN>);
print "Please input sub string: ";
chomp(my $sub = <STDIN>);

my @indexes;
my $pos = -1;
while(1){
	$pos = index($sentence, $sub, $pos+1);
	last if $pos == -1;
	push @indexes, $pos;
}
print "The indexes are: @indexes";