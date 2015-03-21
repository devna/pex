#!perl

use strict;

sub data_for_path{
        my $path = shift;
        if(-f $path or -l $path){
                return undef; 
        }
        if(-d $path){
                my %directory;
                opendir PATH, $path or die "Can't opendir $path: $!";
                my @names = readdir PATH;
                closedir PATH;
                for my $name (@names){
                        next if $name eq '.' or $name eq '..';
                       $directory{$name} = data_for_path("$path/$name"); 
                }
                return \%directory;
        }
        warn "$path is neither a file nor a directory\n";
        return undef;
}

sub dump_data_for_path{
        my $path = shift;
        my $data = shift;
        my $prefix = shift || "";
        
        if(not defined $data){
                print "$prefix$path\n";
               return; 
        }

        my %directory = %$data;

        if(%directory){
                print "$prefix$path, with contents:\n";
                for (sort keys %directory){
                        dump_data_for_path("$path/$_", $directory{$_}, "$prefix  "); 
                } 
        } else {
                print "$prefix$path, an empty directory\n"; 
        }
}

dump_data_for_path(".", data_for_path("."));
