#!/usr/bin/env  perl
use  strict;
use  warnings;
use  v5.12;
## Perl5 version >= 5.12
###################################################################################################################################################################################################





###################################################################################################################################################################################################
my $input_g  = '';  ## such as "8a_filter-m6A-Peaks/merged.onlyregions.bed"   
my $output_g = '';  ## such as "9a_final-m6A-Peaks/Final.m6A.Peaks.bed"

{
## Help Infromation
my $HELP = '
        ------------------------------------------------------------------------------------------------------------------------------------------------------
        ------------------------------------------------------------------------------------------------------------------------------------------------------     
        Usage:
               perl 9a_final-m6A-Peaks.pl.pl    [-version]    [-help]    [-in inputDir]    [-out outDir]      
        For instance:
               nohup time  perl 9a_final-m6A-Peaks.pl   -in 8a_filter-m6A-Peaks/merged.onlyregions.bed   -out 9a_final-m6A-Peaks/Final.m6A.Peaks.bed     > 9a_final-m6A-Peaks.runLog.txt  2>&1    &

        ----------------------------------------------------------------------------------------------------------
        Optional arguments:
        -version        Show version number of this program and exit.

        -help           Show this help message and exit.

        Required arguments:
        -in inputDir        "inputDir" is the name of input path that contains your files.  (no default)

        -out outDir         "outDir" is the name of output path that contains your running results of this step.  (no default)
        -----------------------------------------------------------------------------------------------------------

        ------------------------------------------------------------------------------------------------------------------------------------------------------
        ------------------------------------------------------------------------------------------------------------------------------------------------------
';

## Version Infromation
my $version = "    2022-09-01.";

## Keys and Values
if ($#ARGV   == -1)   { say  "\n$HELP\n";  exit 0;  }       ## when there are no any command argumants.
if ($#ARGV%2 ==  0)   { @ARGV = (@ARGV, "-help") ;  }       ## when the number of command argumants is odd.
my %args = @ARGV;

## Initialize  Variables
$input_g  = '8a_filter-m6A-Peaks/merged.onlyregions.bed';   ## This is only an initialization value or suggesting value, not default value.
$output_g = '9a_final-m6A-Peaks/Final.m6A.Peaks.bed';     ## This is only an initialization value or suggesting value, not default value.

## Available Arguments 
my $available = "   -version    -help   -in   -out    ";
my $boole = 0;
while( my ($key, $value) = each %args ) {
    if ( ($key =~ m/^\-/) and ($available !~ m/\s$key\s/) ) {say    "\n\tCann't recognize $key";  $boole = 1; }
}
if($boole == 1) {
    say  "\tThe Command Line Arguments are wrong!";
    say  "\tPlease see help message by using 'perl 9a_final-m6A-Peaks.pl.pl  -help' \n";
    exit 0;
}

## Get Arguments 
if ( exists $args{'-version' }   )     { say  "\n$version\n";    exit 0; }
if ( exists $args{'-help'    }   )     { say  "\n$HELP\n";       exit 0; }
if ( exists $args{'-in'      }   )     { $input_g  = $args{'-in'      }; }else{say   "\n -in   is required.\n";   say  "\n$HELP\n";    exit 0; }
if ( exists $args{'-out'     }   )     { $output_g = $args{'-out'     }; }else{say   "\n -out  is required.\n";   say  "\n$HELP\n";    exit 0; }

## Conditions
$input_g  =~ m/^\S+$/    ||  die   "\n\n$HELP\n\n";
$output_g =~ m/^\S+$/    ||  die   "\n\n$HELP\n\n";

## Print Command Arguments to Standard Output
say  "\n
        ################ Arguments ###############################
                Input   File:  $input_g
                Output  File:  $output_g
        ###############################################################
\n";
}
###################################################################################################################################################################################################





###################################################################################################################################################################################################
say   "\n\n\n\n\n\n##################################################################################################";
say   "Running ......";
sub myMakeDir  {
    my $path = $_[0];
    if ( !( -e $path) )  { system("mkdir  -p  $path"); }
    if ( !( -e $path) )  { mkdir $path  ||  die;       }
}

my  $output_g2 = $output_g;
$output_g2 =~ s/\/\S+$//  or  die;
&myMakeDir($output_g2);

open(INPUT,  "<", $input_g)  or die;
open(OUTPUT, ">", $output_g) or die;
my @lines1 = <INPUT>; 
###################################################################################################################################################################################################





###################################################################################################################################################################################################
say   "\n\n\n\n\n\n##################################################################################################";



for (my $j=1; $j<=$#lines1; $j++) {
        $lines1[$j] =~ m/^(\S+)\s+(\d+)\s+(\d+)\s+(\S+)\s+(\S+)\s+([-+])/   or die  "##$lines1[$j]##\n\n";
        my $name1   = $4;
        my $strand1 = $6;

        $name1 =~ m/^(chr\d+)\.\.\.(\d+)\.\.\.(\d+)\.\.\.([-+])\.\.\./  or die;
        my $chrom2  = $1;
        my $start2  = $2;
        my $end2    = $3;
        my $strand2 = $4;
        ($strand2 eq $strand1)  or die;
        my $length = $end2 - $start2;
        print   OUTPUT   "$chrom2\t$start2\t$end2\t$name1\t$length\t$strand1\n";
}




print("\n\n\n\n\n#########################################\n");
###################################################################################################################################################################################################














###################################################################################################################################################################################################
say   "\n\n\n\n\n\n##################################################################################################";
say   "\tJob Done! Cheers! \n\n\n\n\n";





## END




