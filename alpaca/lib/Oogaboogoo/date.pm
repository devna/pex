#!perl

package Oogaboogoo::date;

use strict;
use Exporter;
use base qw(Exporter);

our @EXPORT = qw(trans_day);
our @EXPORT_OK = qw(trans_mon);
our %EXPORT_TAGS = (all => [@EXPORT, @EXPORT_OK]);

my @day = qw(ark dip wap sen pop sep kir);
my @month = qw(diz pod bod rod sip wax lin sen kun fiz nap dep);

sub trans_day{
	my $num = shift @_;
	die "$num is not a valid day" if $num <0 and $num >6;
	$day[$num];
}

sub trans_mon{
	my $num = shift @_;
	die "$num is not a valid month" if $num < 0 and $num > 11;
	$month[$num];
}

1;