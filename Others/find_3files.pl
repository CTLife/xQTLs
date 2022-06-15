#!/usr/bin/env perl
use strict;
use warnings;





########## Keys and Values ##########
my %args = @ARGV;



########## Set Defaults ##########
my $file1_g      = 'All.txt';
my $file2_g      = 'merged.bed';
my $file3_g      = 'T.genotype.txt';

########## Get Arguments ##########
if ( exists $args{'-file1'}   )    { $file1_g  = $args{'-file1'};   }
if ( exists $args{'-file2'}   )    { $file2_g  = $args{'-file2'};   }
if ( exists $args{'-file3'}   )    { $file3_g  = $args{'-file3'};   }

########### Conditions #############
$file1_g      =~ m/^\S+$/ or die;
$file2_g      =~ m/^\S+$/ or die;
$file3_g      =~ m/^\S+$/ or die;


######### Example ###########
# perl   find_3files.pl   -file1  All.txt      -file2   merged.bed      -file3 T.genotype.txt






open(INPUT1,    "<",   "$file1_g")     or die "$!"; 
open(INPUT2,    "<",   "$file2_g")     or die "$!"; 
open(INPUT3,    "<",   "$file3_g")     or die "$!"; 

my $common1File = "$file1_g-$file2_g-$file3_g";
my $common2File = "noFind.txt";
open(Common1,   ">",   "$common1File")     or die "$!";   
open(Common2,   ">",   "$common2File")     or die "$!";   



my @lines1 = <INPUT1>; 
my @lines2 = <INPUT2>; 
my @lines3 = <INPUT3>; 

for (my $i=0; $i<=$#lines1; $i++) {
    my $bool1 = 0; 
    my $bool2 = 0; 
    
    my $temp1 = $lines1[$i];
    $temp1 =~ m/^(\S+)\s+(\S+)\s+(\S+)\s+(\S+)\s+(\S+)\s+(\S+)\s+(\S+)\s+(\S+)\s+(\S+)\s+(\S+)\s+(\S+)\s+(\S+)\s+/ or die;
    my $phenotype1 = $1;
    my $genotype1 = "$9...$10";
    $temp1 =~ s/\n// ;
    print  "# $phenotype1 # $genotype1 \n";
    
    my $temp = $temp1;
    
    for (my $j=0; $j<=$#lines2; $j++) {
        my $temp2 = $lines2[$j];
        $temp2 =~ s/\n// ;
        $temp2 =~ m/^(\S+)\s+(\S+)\s+(\S+)\s+(\S+)\s+/ or die "\n$temp2\n\n";
        my $phenotype2 = $4; 
        if($phenotype2 eq $phenotype1)  {$temp = "$temp\t$temp2" ; $bool1=1; last; }
    }
    
    for (my $k=0; $k<=$#lines3; $k++) {
        my $temp3 = $lines3[$k];
        $temp3 =~ s/\n// ;
        $temp3 =~ m/^(\S+)\s+(\S+)\s+(\S+)\s+(\S+)\s+/ or die "\n$temp3\n\n";
        my $genotype3 = "$1...$2"; 
        if($genotype3 eq $genotype1)  {$temp = "$temp\t$temp3" ; $bool2=1; last; }
    }
    
    
    $temp =~ s/\s/\t/g  ;
    $temp =~ s/\//\|/g  ;
    if( ($bool1 == 1) and ($bool2 == 1) ) { print    Common1   "$temp\n";}else{print    Common2   "$temp\n";}
 
}




