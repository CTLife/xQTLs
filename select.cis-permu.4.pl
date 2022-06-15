#!/usr/bin/env  perl
use  strict;
use  warnings;
use  v5.12;
## Perl5 version >= 5.12
###################################################################################################################################################################################################





###################################################################################################################################################################################################
my $input_g  = '';  ## such as "8a_cis_permutation"   
my $output_g = '';  ## such as "8a_cis_permutation.Selected"

{
## Help Infromation
my $HELP = '
        ------------------------------------------------------------------------------------------------------------------------------------------------------
        ------------------------------------------------------------------------------------------------------------------------------------------------------     
        Usage:
               perl select.cis-permu.4.pl    [-version]    [-help]    [-in inputDir]    [-out outDir]      
        For instance:
               nohup time  perl select.cis-permu.4.pl   -in 8a_cis_permutation   -out 8a_cis_permutation.Selected     > selected.runLog.txt  2>&1    &

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
my $version = "    2021-07-27.";

## Keys and Values
if ($#ARGV   == -1)   { say  "\n$HELP\n";  exit 0;  }       ## when there are no any command argumants.
if ($#ARGV%2 ==  0)   { @ARGV = (@ARGV, "-help") ;  }       ## when the number of command argumants is odd.
my %args = @ARGV;

## Initialize  Variables
$input_g  = '8a_cis_permutation';           ## This is only an initialization value or suggesting value, not default value.
$output_g = '8a_cis_permutation.Selected';  ## This is only an initialization value or suggesting value, not default value.

## Available Arguments 
my $available = "   -version    -help   -in   -out  -f ";
my $boole = 0;
while( my ($key, $value) = each %args ) {
    if ( ($key =~ m/^\-/) and ($available !~ m/\s$key\s/) ) {say    "\n\tCann't recognize $key";  $boole = 1; }
}
if($boole == 1) {
    say  "\tThe Command Line Arguments are wrong!";
    say  "\tPlease see help message by using 'perl select.cis-permu.4.pl  -help' \n";
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
opendir(my $DH1, $input_g )  ||  die;
###################################################################################################################################################################################################





###################################################################################################################################################################################################
say   "\n\n\n\n\n\n##################################################################################################";


while( my $filename1 = readdir($DH1) ) {
    if($filename1 =~ m/^\d/) {
                open(my $DH3, "<", "$input_g/$filename1/merged.permutation.txt" )  ||  die;
                my @lines1 = <$DH3>;
                &myMakeDir("$output_g/$filename1");
                open(my $DH4a, ">", "$output_g/$filename1/All.txt"  )  ||  die;
                open(my $DH4b, ">", "$output_g/$filename1/QTLs.bed"  )   ||  die;
                open(my $DH4c, ">", "$output_g/$filename1/phenotype.bed"  )  ||  die;
                
                for ( my $j=0; $j<=$#lines1; $j++ ) {
        	        $lines1[$j] =~ m/^(\S+)\s(\S+)\s(\S+)\s(\S+)\s(\S+)\s(\S+)\s(\S+)\s(\S+)\s(\S+)\s(\S+)\s(\S+)\s(\S+)\s(\S+)\s(\S+)\s(\S+)\s(\S+)\s(\S+)\s(\S+)\s(\S+)\s(\S+)\n$/  or  die  "\n\n\n#$lines1[$j]#\n\n\n";
        	        my $phe_id    = $1; 
        	        my $phe_chr   = $2;     
        	        my $phe_from  = $3;   
        	        my $phe_to    = $4;     
        	        my $phe_strd  = $5;   
        	        my $n_var     = $6;   
        	        my $dist      = $7; 
        	        my $var_id    = $8; 
        	        my $var_chr   = $9;    
        	        my $var_from  = $10; 
        	        my $var_to    = $11; 
        	        my $dof1      = $12;   
        	        my $dof2      = $13; 
        	        my $bml1      = $14; 
        	        my $bml2      = $15;  
        	        my $nom_pval  = $16;  
        	        my $r_squared = $17;  
        	        my $slope     = $18;  
        	        my $adj_emp_pval  = $19;  
        	        my $adj_beta_pval = $20;  
        	        
        	        if( $adj_beta_pval < 0.1 ) { print $DH4a  $lines1[$j]; }    
        	        if( $adj_beta_pval < 0.1 ) { print $DH4b  "$var_chr\t$var_from\t$var_to\t$var_id\t$dist\n"; }    
        	        if( $adj_beta_pval < 0.1 ) { print $DH4c  "$phe_chr\t$phe_from\t$phe_to\t$phe_id\t$dist\t$phe_strd\n"; }    
                }
                close($DH4a);
                close($DH4b);
                close($DH4c);
                system(  "wc  -l  $output_g/$filename1/QTLs.bed   >> $output_g/number.txt" );  
            }        

}

 



print("\n\n\n\n\n#########################################\n");
###################################################################################################################################################################################################
 




###################################################################################################################################################################################################
say   "\n\n\n\n\n\n##################################################################################################";
say   "\tJob Done! Cheers! \n\n\n\n\n";





## END




