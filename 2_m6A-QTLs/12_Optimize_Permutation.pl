#!/usr/bin/env  perl
use  strict;
use  warnings;
use  v5.12;
## Perl5 version >= 5.12
###################################################################################################################################################################################################





###################################################################################################################################################################################################
my $input_g  = '';  ## such as "11_cis_permutation/1_BA9"   
my $output_g = '';  ## such as "12_Optimize_Permutation/1_BA9"

{
## Help Infromation
my $HELP = '
        ------------------------------------------------------------------------------------------------------------------------------------------------------
        ------------------------------------------------------------------------------------------------------------------------------------------------------     
        Usage:
               perl 12_Optimize_Permutation.pl    [-version]    [-help]    [-in inputDir]    [-out outDir]      
        For instance:
               nohup time  perl 12_Optimize_Permutation.pl   -in 11_cis_permutation/1_BA9   -out 12_Optimize_Permutation/1_BA9     > 12_Optimize_Permutation.1_BA9.runLog.txt  2>&1    &

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
$input_g  = '11_cis_permutation/1_BA9';          ## This is only an initialization value or suggesting value, not default value.
$output_g = '12_Optimize_Permutation/1_BA9';     ## This is only an initialization value or suggesting value, not default value.

## Available Arguments 
my $available = "   -version    -help   -in   -out    ";
my $boole = 0;
while( my ($key, $value) = each %args ) {
    if ( ($key =~ m/^\-/) and ($available !~ m/\s$key\s/) ) {say    "\n\tCann't recognize $key";  $boole = 1; }
}
if($boole == 1) {
    say  "\tThe Command Line Arguments are wrong!";
    say  "\tPlease see help message by using 'perl 12_Optimize_Permutation.pl  -help' \n";
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

opendir(my $DH_input_g, $input_g)  ||  die;
my @inputFiles_g = readdir($DH_input_g);
my $groupname = $input_g;
$groupname =~ s/^\S+\/// or die;
###################################################################################################################################################################################################





###################################################################################################################################################################################################
say   "\n\n\n\n\n\n##################################################################################################";




open(OUT2, ">", "$output_g/number.txt") or die;

for ( my $i=0; $i<=$#inputFiles_g; $i++ ) {
        my $temp = $inputFiles_g[$i];
        next unless $temp =~ m/^(\d+)\.(\d+)$/;
        my $num1 = $1;
        my $num2 = $2;
 
        next unless ( -e   "$input_g/$temp/$groupname.permutation.txt");
        open(IP1, "<", "$input_g/$temp/$groupname.permutation.txt") or die;
        my @lines1 = <IP1>; 
        open(OUT1, ">", "$output_g/$temp.$groupname.permutation.txt") or die;

        my $n1=0;
        my $n2=0;
        my $n3=0;
        my $n4=0;
        for (my $j=0; $j<=$#lines1; $j++) {
            $lines1[$j] =~ m/^(\S+)\s(\S+)\s(\d+)\s(\d+)\s([-+])\s(\d+)\s(\S+)\s(\S+)\s(\S+)\s(\S+)\s(\S+)\s(\S+)\s(\S+)\s(\S+)\s(\S+)\s(\S+)\s(\S+)\s(\S+)\s(\S+)\s(\S+)\s(\S+)\n$/   or die  "Error-1: $lines1[$j]\n\n";
            my $distance  = $7;
            my $pvalue    = $21;
            if( $distance eq  "NA" ) {  next;  }
            $distance = abs($distance)/1000;
            if( ($distance <  100.0) and ($pvalue < 0.1) )  {print   OUT1   $lines1[$j]; $n1++; }
            if( ($distance >= 100.0) and ($pvalue < 0.01) ) {print   OUT1   $lines1[$j]; $n2++; }
            $n4++;
        }
        $n3 = $n1 + $n2;
        say("############$temp");
        say($n1);
        say($n2);
        say($n3);
        say($n4);

        my $n5 = `cut -f 1 -d " "  $output_g/$temp.$groupname.permutation.txt |    wc -l`;   ## uniq | wc -l
        $n5 =~ s/\s//g or die;
        if( ($n5 > 100) and ($num2<=22) ){print   OUT2   "$n5\t$num1\t$num2\n"  ;}else{print   "$n5\t$num1\t$num2\n"};
        say("### n3: $n3. n5: $n5.\n\n\n");
        close(IP1);
        close(OUT1);
}

close(OUT2);


system("Rscript 12_Optimize_Permutation.R  $output_g/number.txt  $output_g/figures");

print("\n\n\n\n\n#########################################\n");
###################################################################################################################################################################################################






###################################################################################################################################################################################################
say   "\n\n\n\n\n\n##################################################################################################";
say   "\tJob Done! Cheers! \n\n\n\n\n";





## END









