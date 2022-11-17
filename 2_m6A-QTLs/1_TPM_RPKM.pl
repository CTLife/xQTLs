#!/usr/bin/env  perl
use  strict;
use  warnings;
use  v5.12;
## Perl5 version >= 5.12
###################################################################################################################################################################################################





###################################################################################################################################################################################################
my $input_g  = '';  ## such as "1_BAM/IP"   
my $GTF_g    = '';  ## such as "2_Regions/finalMergedPeaks.sorted.gtf"
my $output_g = '';  ## such as "1_TPM_RPKM/finalMergedPeaks/IP"


{
## Help Infromation
my $HELP = '
        ------------------------------------------------------------------------------------------------------------------------------------------------------
        ------------------------------------------------------------------------------------------------------------------------------------------------------     
        Usage:
               perl 1_TPM_RPKM.pl    [-version]    [-help]    [-in inputDir]   [-gtf GTFfile]    [-out outDir]      
        For instance:
               nohup time  perl 1_TPM_RPKM.pl   -in 1_BAM/IP    -gtf 2_Regions/finalMergedPeaks.sorted.gtf    -out 1_TPM_RPKM/finalMergedPeaks/IP     > 1_TPM_RPKM.1.runLog.txt  2>&1    &

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
my $version = "    2022-12-01.";

## Keys and Values
if ($#ARGV   == -1)   { say  "\n$HELP\n";  exit 0;  }       ## when there are no any command argumants.
if ($#ARGV%2 ==  0)   { @ARGV = (@ARGV, "-help") ;  }       ## when the number of command argumants is odd.
my %args = @ARGV;

## Initialize  Variables
$input_g  = '1_BAM/IP';                                      ## This is only an initialization value or suggesting value, not default value.
$GTF_g    = '2_Regions/finalMergedPeaks.sorted.gtf';      ## This is only an initialization value or suggesting value, not default value.
$output_g = '3_quan/finalMergedPeaks/IP';                    ## This is only an initialization value or suggesting value, not default value.

## Available Arguments 
my $available = "   -version    -help   -in  -gtf   -out    ";
my $boole = 0;
while( my ($key, $value) = each %args ) {
    if ( ($key =~ m/^\-/) and ($available !~ m/\s$key\s/) ) {say    "\n\tCann't recognize $key";  $boole = 1; }
}
if($boole == 1) {
    say  "\tThe Command Line Arguments are wrong!";
    say  "\tPlease see help message by using 'perl 1_TPM_RPKM.pl  -help' \n";
    exit 0;
}

## Get Arguments 
if ( exists $args{'-version' }   )     { say  "\n$version\n";    exit 0; }
if ( exists $args{'-help'    }   )     { say  "\n$HELP\n";       exit 0; }
if ( exists $args{'-in'      }   )     { $input_g  = $args{'-in'      }; }else{say   "\n -in   is required.\n";   say  "\n$HELP\n";    exit 0; }
if ( exists $args{'-gtf'     }   )     { $GTF_g    = $args{'-gtf'     }; }else{say   "\n -gtf  is required.\n";   say  "\n$HELP\n";    exit 0; }
if ( exists $args{'-out'     }   )     { $output_g = $args{'-out'     }; }else{say   "\n -out  is required.\n";   say  "\n$HELP\n";    exit 0; }

## Conditions
$input_g  =~ m/^\S+$/    ||  die   "\n\n$HELP\n\n";
$GTF_g    =~ m/^\S+$/    ||  die   "\n\n$HELP\n\n";
$output_g =~ m/^\S+$/    ||  die   "\n\n$HELP\n\n";

## Print Command Arguments to Standard Output
say  "\n
        ################ Arguments ###############################
                Input   Path:  $input_g
                         GTF:  $GTF_g
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
&myMakeDir("$output_g/forward");
&myMakeDir("$output_g/reverse");

opendir(my $DH_input_g, $input_g)  ||  die;
my @inputFiles_g = readdir($DH_input_g);
###################################################################################################################################################################################################





###################################################################################################################################################################################################
say   "\n\n\n\n\n\n##################################################################################################";




for ( my $i=0; $i<=$#inputFiles_g; $i++ ) {
        my $temp = $inputFiles_g[$i];
        next unless $temp =~ m/\.bam$/;
        $temp =~ s/\.bam$// or die;
        print "$temp\n";
        system( "stringtie   $input_g/$temp.bam  --rf  -G $GTF_g  -o $output_g/reverse/$temp/$temp  -l sr.$temp  -p 16  -A $output_g/reverse/$temp.abundance.txt  -B  -e   > $output_g/reverse/$temp.runLog.txt  2>&1   " );
        system( "stringtie   $input_g/$temp.bam  --fr  -G $GTF_g  -o $output_g/forward/$temp/$temp  -l SF.$temp  -p 16  -A $output_g/forward/$temp.abundance.txt  -B  -e   > $output_g/forward/$temp.runLog.txt  2>&1   " );      
}



print("\n\n\n\n\n#########################################\n");
###################################################################################################################################################################################################



 



 


###################################################################################################################################################################################################
say   "\n\n\n\n\n\n##################################################################################################";
say   "\tJob Done! Cheers! \n\n\n\n\n";





## END




