#!/usr/bin/env  perl
use  strict;
use  warnings;
use  v5.12;
## Perl5 version >= 5.12
###################################################################################################################################################################################################





###################################################################################################################################################################################################
my $input_g  = '';  ## Group name, such as "1_BA9"  
my $output_g = '';  ## Output path, such as "7_Covariates/1_BA9"
{
## Help Infromation
my $HELP = '
        ------------------------------------------------------------------------------------------------------------------------------------------------------
        ------------------------------------------------------------------------------------------------------------------------------------------------------     
        Usage:
               perl 7_Covariates.pl    [-version]    [-help]    [-in inputDir]    [-out outDir]      
        For instance:
               nohup time  perl 7_Covariates.pl   -in 1_BA9   -out 7_Covariates/1_BA9     > 7_Covariates.1_BA9.runLog.txt  2>&1    &

        ----------------------------------------------------------------------------------------------------------
        Optional arguments:
        -version        Show version number of this program and exit.

        -help           Show this help message and exit.

        Required arguments:
        -in inputDir        "inputDir" is the name of input path that contains your files.  (no default)

        -out outDir         "outDir" is the name of output path that contains your running results of this step.  (no default)
        
        -known knownFactors  File with known factors.
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
$input_g  = '1_BA9';             ## This is only an initialization value or suggesting value, not default value.
$output_g = '7_Covariates';      ## This is only an initialization value or suggesting value, not default value.

## Available Arguments 
my $available = "   -version    -help   -in   -out    ";
my $boole = 0;
while( my ($key, $value) = each %args ) {
    if ( ($key =~ m/^\-/) and ($available !~ m/\s$key\s/) ) {say    "\n\tCann't recognize $key";  $boole = 1; }
}
if($boole == 1) {
    say  "\tThe Command Line Arguments are wrong!";
    say  "\tPlease see help message by using 'perl 7_Covariates.pl  -help' \n";
    exit 0;
}

## Get Arguments 
if ( exists $args{'-version' }   )     { say  "\n$version\n";    exit 0; }
if ( exists $args{'-help'    }   )     { say  "\n$HELP\n";       exit 0; }
if ( exists $args{'-in'      }   )     { $input_g  = $args{'-in'      }; }else{say   "\n -in   is required.\n";    say  "\n$HELP\n";    exit 0; }
if ( exists $args{'-out'     }   )     { $output_g = $args{'-out'     }; }else{say   "\n -out  is required.\n";    say  "\n$HELP\n";    exit 0; }

## Conditions
$input_g  =~ m/^\S+$/    ||  die   "\n\n$HELP\n\n";
$output_g =~ m/^\S+$/    ||  die   "\n\n$HELP\n\n";

## Print Command Arguments to Standard Output
say  "\n
        ################ Arguments ###############################
                Input   Path:  $input_g
                Output  Path:  $output_g
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

&myMakeDir($output_g);
## Genotype Matrix, Phenotype Matrix, Known factors.
## PCA for Genotype, PCA for phenotype, and PEER factors for phenotype.

my $input_g2 = $input_g;
$input_g2 =~ s/^\d_// or die;
$input_g2 = "$input_g2"."_samples.vcf";

my $genoMatrix= "../0_Genotype_Phenotype/1_Genotype/5_eachBrainRegion_MAF20/$input_g2";
my $pheMatrix = "4_INT/$input_g/logOR_INT.txt";
my $known_g   = "0_Regions/knownFactors/$input_g.knownFactors.all.txt";

my $PCA_Genotype = "6_PCA_Genotype/$input_g/$input_g2.pca";
my $PCA_Phe      = "5_PCA_Phenotype/$input_g/Full.logOR_INT.pca";
###################################################################################################################################################################################################





###################################################################################################################################################################################################
say   "\n\n\n\n\n\n##################################################################################################";






## Genotype matrix
say("############################################################### 1. Genotype matrix:\n\n"); 
my $sampleOrder = `grep -P "^#CHROM"  $genoMatrix` ;
print("\n\n## Column order of genotype: $sampleOrder##\n\n");
print("\n\n\n\n\n");




## Phenotype matrix
say("############################################################### 2. Phenotype matrix:\n\n");
open(INPUT_1, "<", $pheMatrix) or die;  ##phenotype matrix
my $firstLine = <INPUT_1>;
close(INPUT_1);
$firstLine =~ s/\s+$//g;

print("\n\n## Column order of phenotype matrix: $firstLine##\n\n");
($sampleOrder =~ m/\t$firstLine\n$/) or die  "\n\nError-2:#$sampleOrder#$firstLine#\n\n";

my $count = ($firstLine =~ s/\t/\t/g);
$count = $count+1;
print("\ncount:$count\n");
print("\n\n\n\n\n");




say("############################################################### 0.PEER factors for phenotype:\n\n");
## PEER factors for phenotype
system( " python  0_Regions/knownFactors/1_peer_wrapper.py  -i  $pheMatrix                   -o  $output_g/PEER   -n $count " ); 
system( " Rscript 0_Regions/knownFactors/2_peer_analysis.R  -i  $output_g/PEER/model.hdf5    -o  $output_g/PEER " ); 
system( "cp $output_g/PEER/factors.T.txt   $output_g/PEER/factors.T.backup.txt" ); ## the column order?
system( "sed   -i '1d' $output_g/PEER/factors.T.txt" );
my $PEER_Phe = "$output_g/PEER/factors.T.txt"; ## no head


print("\n\n\n\n\n");
print("genoMatrix:    $genoMatrix\n");
print("pheMatrix:     $pheMatrix\n");
print("known factors: $known_g\n");
print("PCA_Genotype:  $PCA_Genotype\n");
print("PCA_Phe:       $PCA_Phe\n");
print("PEER_Phe:      $PEER_Phe\n");
print("\n\n\n\n\n");




say("############################################################### 3.Known factors for each group:\n\n");
## Known factors for each group
open(INPUT_2, "<", $known_g ) or die;  ## knownFactors matrix
my $firstLine2 = <INPUT_2>;
close(INPUT_2);
print("\n\n## Column order of knownFactors matrix: $firstLine2##\n\n");

($firstLine2 =~ m/\t$firstLine\n$/) or die  "\n\nError-3:#$firstLine2#$firstLine#\n\n";

system("cp -f  $known_g  $known_g.nohead");  
system( "sed   -i '1d'   $known_g.nohead"  );
system( "head   -n 1     $known_g   > $known_g.onlyhead"  );
print("\n\n\n\n\n");

## Combine known factors and the top N PEER factors
for(my $n=1; $n<=$count; $n++) {
    system( "head   -n $n   $output_g/PEER/factors.T.txt            > $output_g/PEER/$n.txt"  );
    system( "cat   $known_g.onlyhead  $output_g/PEER/$n.txt         > $output_g/PEER/factors.$n.txt"  );
    system( "cat   $output_g/PEER/factors.$n.txt  $known_g.nohead   > $output_g/PEER/factors.withKnown.$n.txt"  );
}





say("############################################################### 4.PCA for genotype :\n\n");
system("Rscript  7_Covariates.R  $PCA_Genotype   $PCA_Genotype.columnSorted");
open(INPUT_4, "<", "$PCA_Genotype.columnSorted" ) or die;  ## knownFactors matrix
my $firstLine4 = <INPUT_4>;
close(INPUT_4);
print("\n\n## Column order of genotype PCA: $firstLine4##\n\n");
($firstLine4 =~ m/\t$firstLine\n$/) or die  "\n\nError-4:#$firstLine4#$firstLine#\n\n";
print("\n\n\n\n\n");




say("############################################################### 5. PCA for phenotpe:\n\n");
##### PCA for phenotpe
system("Rscript  7_Covariates.R  $PCA_Phe   $PCA_Phe.columnSorted");
&myMakeDir("$output_g/PCA");
open(INPUT_5, "<", "$PCA_Phe.columnSorted" ) or die;  
my $firstLine5 = <INPUT_5>;
close(INPUT_5);
print("\n\n## Column order of phenotype PCA: $firstLine5##\n\n");
($firstLine5 =~ m/\t$firstLine\n$/) or die  "\n\nError-4:#$firstLine5#$firstLine#\n\n";

for(my $n=1; $n<=$count; $n++) {
    my $m = $n + 1;
    system( "head -n $m  $PCA_Phe.columnSorted                 > $output_g/PCA/PCA.$n.txt"  );
    system( "cat   $output_g/PCA/PCA.$n.txt  $known_g.nohead   > $output_g/PCA/PCA.withKnown.$n.txt"  );
}
print("\n\n\n\n\n");





&myMakeDir("$output_g/Correlation");
system( "Rscript 0_Regions/knownFactors/3_heatmap.R  --knownFactors=$known_g  --peerFactors=$output_g/PEER/factors.T.backup.txt    --PCAs=$PCA_Phe.columnSorted   --genotypes=$PCA_Genotype.columnSorted    --output=$output_g/Correlation "  );                                                    



print("\n\n\n\n\n#########################################\n");
###################################################################################################################################################################################################


 
 


###################################################################################################################################################################################################
say   "\n\n\n\n\n\n##################################################################################################";
say   "\tJob Done! Cheers! \n\n\n\n\n";





## END




