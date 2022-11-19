#!/usr/bin/env perl
use strict;
use warnings;





########## Keys and Values ##########
my %args = @ARGV;

########## Set Defaults ##########
my $file1_g      = '2_Regions/hg38.gencode.v39.chr1-22.Collapsed.gtf';
my $file2_g      = '8b_filter-Genes/merged.onlyregions.bed';
my $file3_g      = '9b_final-Genes/finalGenes.gtf';

########## Get Arguments ##########
if ( exists $args{'-file1'}   )    { $file1_g  = $args{'-file1'};   }
if ( exists $args{'-file2'}   )    { $file2_g  = $args{'-file2'};   }
if ( exists $args{'-file3'}   )    { $file3_g  = $args{'-file3'};   }

########### Conditions #############
$file1_g      =~ m/^\S+$/ or die;
$file2_g      =~ m/^\S+$/ or die;
$file3_g      =~ m/^\S+$/ or die;

######### Example ###########
# perl   9b_final-Genes.pl   -file1  2_Regions/hg38.gencode.v39.chr1-22.Collapsed.gtf      -file2   8b_filter-Genes/merged.onlyregions.bed      -file3 9b_final-Genes/finalGenes.gtf     



open(INPUT1,    "<",   "$file1_g")     or die "$!"; 
open(INPUT2,    "<",   "$file2_g")     or die "$!"; 
open(OUTPUT,    ">",   "$file3_g")     or die "$!"; 
my @lines1 = <INPUT1>; 
my @lines2 = <INPUT2>; 

for (my $i=0; $i<=$#lines2; $i++) {    
    my $temp2 = $lines2[$i];
    $temp2 =~ m/^(\S+)\s+(\S+)\s+(\S+)\s+(\S+)\s+/ or die;
    my $name2 = $4;
    my $bool2 = 0;
    for (my $j=0; $j<=$#lines1; $j++) {
        my $temp1 = $lines1[$j];
        if($temp1 =~ m/\"$name2\"/){print  OUTPUT $temp1;  $bool2=1;  }
    }    
    if( ($bool2 == 0) ) { print  $name2;} 
}




