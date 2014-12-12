use warnings;
use strict;

use Module::CoreList;

my %modules = %{$Module::CoreList::version{5.008}};
print join "\n", keys %modules;