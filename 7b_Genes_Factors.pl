#!/usr/bin/env  perl
use  strict;
use  warnings;
use  v5.12;
## Perl5 version >= 5.12
###################################################################################################################################################################################################





###################################################################################################################################################################################################
my $input_g  = '';  ## such as "4b_keptGenes"   
my $output_g = '';  ## such as "7b_Genes_Factors"
my $known_g  = '';  ## such as PCA_PEER/BA9.knownFactors.all.txt
{
## Help Infromation
my $HELP = '
        ------------------------------------------------------------------------------------------------------------------------------------------------------
        ------------------------------------------------------------------------------------------------------------------------------------------------------     
        Usage:
               perl 7b_Genes_Factors.pl    [-version]    [-help]    [-in inputDir]    [-out outDir]     [-known knownFactors] 
        For instance:
               nohup time  perl 7b_Genes_Factors.pl   -in 4b_keptGenes   -out 7b_Genes_Factors   -known  PCA_PEER/BA9.knownFactors.all.txt > 7b_Genes_Factors.runLog.txt  2>&1    &

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
$input_g  = '4b_keptGenes';          ## This is only an initialization value or suggesting value, not default value.
$output_g = '7b_Genes_Factors';      ## This is only an initialization value or suggesting value, not default value.
$known_g  = 'PCA_PEER/BA9.knownFactors.all.txt'; 

## Available Arguments 
my $available = "   -version    -help   -in   -out   -known ";
my $boole = 0;
while( my ($key, $value) = each %args ) {
    if ( ($key =~ m/^\-/) and ($available !~ m/\s$key\s/) ) {say    "\n\tCann't recognize $key";  $boole = 1; }
}
if($boole == 1) {
    say  "\tThe Command Line Arguments are wrong!";
    say  "\tPlease see help message by using 'perl 7b_Genes_Factors.pl  -help' \n";
    exit 0;
}

## Get Arguments 
if ( exists $args{'-version' }   )     { say  "\n$version\n";    exit 0; }
if ( exists $args{'-help'    }   )     { say  "\n$HELP\n";       exit 0; }
if ( exists $args{'-in'      }   )     { $input_g  = $args{'-in'      }; }else{say   "\n -in   is required.\n";    say  "\n$HELP\n";    exit 0; }
if ( exists $args{'-out'     }   )     { $output_g = $args{'-out'     }; }else{say   "\n -out  is required.\n";    say  "\n$HELP\n";    exit 0; }
if ( exists $args{'-known'   }   )     { $known_g  = $args{'-known'   }; }else{say   "\n -known  is required.\n";  say  "\n$HELP\n";    exit 0; }

## Conditions
$input_g  =~ m/^\S+$/    ||  die   "\n\n$HELP\n\n";
$output_g =~ m/^\S+$/    ||  die   "\n\n$HELP\n\n";
$known_g  =~ m/^\S+$/    ||  die   "\n\n$HELP\n\n";

## Print Command Arguments to Standard Output
say  "\n
        ################ Arguments ###############################
                Input   Path:  $input_g
                Output  Path:  $output_g
                File with known factors: $known_g
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

##opendir(my $DH_input_g, $input_g)  ||  die;
##my @inputFiles_g = readdir($DH_input_g);
###################################################################################################################################################################################################





###################################################################################################################################################################################################
say   "\n\n\n\n\n\n##################################################################################################";

open(INPUT_1, "<", "$input_g/merged.txt") or die;  ##phenotype matrix
my $firstLine = <INPUT_1>;
close(INPUT_1);
$firstLine =~ s/\s+$//g;
print("\n\n##$firstLine##\n\n");
my $count = ($firstLine =~ s/\t/\t/g);
$count = $count+1;
print("\ncount:$count\n");

system( " python  PCA_PEER/1_peer_wrapper.py  -i  $input_g/merged.txt          -o  $output_g/PEER   -n $count " ); 
system( " Rscript PCA_PEER/2_peer_analysis.R  -i  $output_g/PEER/model.hdf5    -o  $output_g/PEER " ); 
system( "cp $output_g/PEER/factors.T.txt   $output_g/PEER/factors.T.backup.txt" ); ## the column order?
system( "sed   -i '1d' $output_g/PEER/factors.T.txt" );

open(INPUT_2, "<", $known_g ) or die;  ## knownFactors matrix
my $firstLine2 = <INPUT_2>;
close(INPUT_2);
$firstLine2 =~ s/\s+$//g;
print("\n\n##$firstLine2##\n\n");
($firstLine2 =~ m/$firstLine/) or die  "\n\nError-1:#$firstLine#$firstLine2#\n\n";
print("\n\n##phenotype matrix:$firstLine##\n##knownFactors matrix:$firstLine2##\n\n");

system("cp $known_g  $known_g.nohead");
system( "sed   -i '1d'   $known_g.nohead"  );
system( "head   -n 1     $known_g   > $known_g.onlyhead"  );

for(my $n=1; $n<=$count; $n++) {
    system( "head   -n $n   $output_g/PEER/factors.T.txt            > $output_g/PEER/$n.txt"  );
    system( "cat   $known_g.onlyhead  $output_g/PEER/$n.txt         > $output_g/PEER/factors.$n.txt"  );
    system( "cat   $output_g/PEER/factors.$n.txt  $known_g.nohead   > $output_g/PEER/factors.withKnown.$n.txt"  );
}



##### PCA for phenotpe
&myMakeDir("$output_g/PCA");
open(INPUT_3, "<", "5b_PCA_Genes/merged.pca" ) or die;  
my $firstLine3 = <INPUT_3>;
close(INPUT_3);
$firstLine3 =~ s/\s+$//g;
print("\n\n##$firstLine3##\n\n");
($firstLine3 =~ m/$firstLine/) or die  "\n\nError-1:#$firstLine#$firstLine3#\n\n";
print("\n\n##phenotype matrix:$firstLine##\n##knownFactors matrix:$firstLine2##\n##Phenotype PCA matrix:$firstLine3\n\n");

for(my $n=1; $n<=$count; $n++) {
    my $m = $n + 1;
    system( "head -n $m  5b_PCA_Genes/merged.pca               > $output_g/PCA/PCA.$n.txt"  );
    system( "cat   $output_g/PCA/PCA.$n.txt  $known_g.nohead   > $output_g/PCA/PCA.withKnown.$n.txt"  );
}

&myMakeDir("$output_g/Correlation");
system( "Rscript PCA_PEER/3_heatmap.R  --knownFactors=$known_g  --peerFactors=$output_g/PEER/factors.T.backup.txt    --PCAs=5b_PCA_Genes/merged.pca   --genotypes=6_PCA_SNP/SNPs.vcf.pca    --output=$output_g/Correlation "  );                                                    

print("\n\n\n\n\n#########################################\n");
###################################################################################################################################################################################################


 
 


###################################################################################################################################################################################################
say   "\n\n\n\n\n\n##################################################################################################";
say   "\tJob Done! Cheers! \n\n\n\n\n";





## END




