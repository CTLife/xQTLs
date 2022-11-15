#!/usr/bin/env  perl
use  strict;
use  warnings;
use  v5.12;
## Perl5 version >= 5.12
###################################################################################################################################################################################################





###################################################################################################################################################################################################
my $input_g  = '';  ## such as "1_BAM/IP"   
my $GTF_g    = '';  ## such as "2_Regions/finalMergedPeaks.sorted.gtf.gz"
my $output_g = '';  ## such as "3_rawReadsNum/finalMergedPeaks/IP"


{
## Help Infromation
my $HELP = '
        ------------------------------------------------------------------------------------------------------------------------------------------------------
        ------------------------------------------------------------------------------------------------------------------------------------------------------     
        Usage:
               perl 3_rawReadsNum.pl    [-version]    [-help]    [-in inputDir]   [-gtf GTFfile]    [-out outDir]      
        For instance:
               nohup time  perl 3_rawReadsNum.pl   -in 1_BAM/IP    -gtf 2_Regions/finalMergedPeaks.sorted.gtf.gz    -out 3_rawReadsNum/finalMergedPeaks/IP     > 3_rawReadsNum.1.runLog.txt  2>&1    &

        ----------------------------------------------------------------------------------------------------------
        Optional arguments:
        -version        Show version number of this program and exit.

        -help           Show this help message and exit.

        Required arguments:
        -in inputDir        "inputDir" is the name of input path that contains BAM files.  (no default)

        -out outDir         "outDir" is the name of output path that contains results.  (no default)
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
$GTF_g    = '2_Regions/finalMergedPeaks.sorted.gtf.gz';      ## This is only an initialization value or suggesting value, not default value.
$output_g = '3_quan/finalMergedPeaks/IP';                    ## This is only an initialization value or suggesting value, not default value.

## Available Arguments 
my $available = "   -version    -help   -in  -gtf   -out    ";
my $boole = 0;
while( my ($key, $value) = each %args ) {
    if ( ($key =~ m/^\-/) and ($available !~ m/\s$key\s/) ) {say    "\n\tCann't recognize $key";  $boole = 1; }
}
if($boole == 1) {
    say  "\tThe Command Line Arguments are wrong!";
    say  "\tPlease see help message by using 'perl 3_rawReadsNum.pl  -help' \n";
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
        &myMakeDir("$output_g/forward/$temp");
        &myMakeDir("$output_g/reverse/$temp");
        &myMakeDir("$output_g/forward/f.$temp");
        &myMakeDir("$output_g/reverse/f.$temp");
        system( "  featureCounts    -O  -M  --fraction  -s 1   -T 16      -a $GTF_g    -o $output_g/forward//$temp/$temp         $input_g/$temp.bam   >   $output_g/forward/$temp.runLog.txt    2>&1 " );   
        system( "  featureCounts    -O  -M  --fraction  -s 1   -T 16  -f  -a $GTF_g    -o $output_g/forward/f.$temp/f.$temp      $input_g/$temp.bam   >   $output_g/forward/f.$temp.runLog.txt  2>&1 " );   
        system( "  featureCounts    -O  -M  --fraction  -s 2   -T 16      -a $GTF_g    -o $output_g/reverse/$temp/$temp          $input_g/$temp.bam   >   $output_g/reverse/$temp.runLog.txt    2>&1 " );   
        system( "  featureCounts    -O  -M  --fraction  -s 2   -T 16  -f  -a $GTF_g    -o $output_g/reverse/f.$temp/f.$temp      $input_g/$temp.bam   >   $output_g/reverse/f.$temp.runLog.txt  2>&1 " );                             
}

print("\n\n\n\n\n#########################################\n");
###################################################################################################################################################################################################




###################################################################################################################################################################################################
say   "\n\n\n\n\n\n##################################################################################################";
say   "\tJob Done! Cheers! \n\n\n\n\n";





## END




