#!perl

use strict;
use Storable;

my %total_bytes;
my $src_total = 'source total bytes';
my $data_file = 'samples/total.bytes';

if(-e $data_file){
        my $total_ref = retrieve $data_file;
        %total_bytes = %$total_ref;
}

while(<>){
	next if /^#/;
	my ($source, $destination, $bytes) = split;
	$total_bytes{$source}{$destination} += $bytes;
	$total_bytes{$source}{$src_total} += $bytes;
}
store \%total_bytes, $data_file;

my @ord_sources = sort {$total_bytes{$b}{$src_total} <=> $total_bytes{$a}{$src_total}} keys %total_bytes;
for my $src (@ord_sources){
	my @ord_dest = sort {$total_bytes{$src}{$b} <=> $total_bytes{$src}{$a}} keys %{$total_bytes{$src}};
	
	print "$src: $total_bytes{$src}{$src_total} bytes\n";
	foreach my $dest (@ord_dest){
		next if($dest eq $src_total);
		print ' ' x 4 . "=> $dest: $total_bytes{$src}{$dest} bytes\n";
	}
}
