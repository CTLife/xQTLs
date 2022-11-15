#!/usr/bin/env  perl
use  strict;
use  warnings;
use  v5.12;
## Perl5 version >= 5.12
###################################################################################################################################################################################################





###################################################################################################################################################################################################
my $input_g  = '';  ## such as "3_rawReadsNum/finalMergedPeaks/IP/forward "   
my $output_g = '';  ## such as "4_mergedCounts/finalMergedPeaks/IP/forward "

{
## Help Infromation
my $HELP = '
        ------------------------------------------------------------------------------------------------------------------------------------------------------
        ------------------------------------------------------------------------------------------------------------------------------------------------------     
        Usage:
               perl 4_mergedCounts.pl    [-version]    [-help]    [-in inputDir]    [-out outDir]      
        For instance:
               nohup time  perl 4_mergedCounts.pl   -in 3_rawReadsNum/finalMergedPeaks/IP/forward   -out 4_mergedCounts/finalMergedPeaks/IP/forward      > 4_mergedCounts.1.runLog.txt  2>&1    &

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
$input_g  = '3_rawReadsNum/finalMergedPeaks/IP/forward';          ## This is only an initialization value or suggesting value, not default value.
$output_g = '4_mergedCounts/finalMergedPeaks/IP/forward';         ## This is only an initialization value or suggesting value, not default value.

## Available Arguments 
my $available = "   -version    -help   -in   -out    ";
my $boole = 0;
while( my ($key, $value) = each %args ) {
    if ( ($key =~ m/^\-/) and ($available !~ m/\s$key\s/) ) {say    "\n\tCann't recognize $key";  $boole = 1; }
}
if($boole == 1) {
    say  "\tThe Command Line Arguments are wrong!";
    say  "\tPlease see help message by using 'perl 4_mergedCounts.pl  -help' \n";
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
&myMakeDir("$output_g/intermediate");
&myMakeDir("$output_g/final");
opendir(my $DH_input_g, $input_g)  ||  die;
my @inputFiles   = readdir($DH_input_g);
###################################################################################################################################################################################################





###################################################################################################################################################################################################
say   "\n\n\n\n\n\n##################################################################################################";
my @inputFiles_g = ();
for(my $i=0; $i<=$#inputFiles; $i++) {
        my $temp = $inputFiles[$i];
        next unless $temp !~ m/^[.]/;
        next unless $temp !~ m/[~]$/;
        next unless $temp !~ m/\.txt$/;
        next unless $temp !~ m/^f\./;
        $inputFiles_g[++$#inputFiles_g] = $temp;   
}
## @inputFiles_g = sort { (length $a <=> length $b)  ||  ($a cmp $b) } @inputFiles_g;
@inputFiles_g = sort {  ($a cmp $b) } @inputFiles_g;
print "\n\n";
print join('  ', @inputFiles_g), "\n\n";
print "\n\nNumber of files: $#inputFiles_g+1\n\n\n\n";

my @names = ();
my @bedfiles = ();
for ( my $i=0; $i<=$#inputFiles_g; $i++ ) {
        my $temp = $inputFiles_g[$i];
        
        open(FH1, "<", "$input_g/$temp/$temp")  or  die; 
        my @lines1 = <FH1>; 
        open(FH2, ">", "$output_g/intermediate/$temp.bed")  or  die; 
        print FH2 "#chr\tstart\tend\tname\tlength\tstrand\t$temp\n";
        for ( my $j=2; $j<=$#lines1; $j++ ) { 
            $lines1[$j] =~ m/^(\S+)\t(\S+)\t(\S+)\t(\S+)\t(\S+)\t(\d+)\t(\S+)\n$/ or  die;
            my $name1  = $1;
            my $chr1   = $2;
            my $start1 = $3;
            my $end1   = $4;
            my $strand1= $5;
            my $length1= $6;
            my $counts1= $7;  
            
            if($chr1   =~ m/^(chr\d+)\;/) {$chr1   = $1;  }
            if($start1 =~ m/^(\d+)\;/   ) {$start1 = $1;  }
            if($end1   =~ m/\;(\d+)$/   ) {$end1   = $1;  }
            if($strand1=~ m/^([-+])\;/  ) {$strand1= $1;  }
            $start1 = $start1 - 1;
            
            print FH2 "$chr1\t$start1\t$end1\t$name1\t$length1\t$strand1\t$counts1\n";
            if($i==0) {$names[++$#names] = $name1; }else{ ($names[$j-2] eq $name1) or  die  "##$names[$j-2] == $name1##"  ;  }
        }
        close(FH1);
        close(FH2);
         
        if( !( -e "$output_g/final/0.bed")  ) {  system( "cut    -f1-6   $output_g/intermediate/$temp.bed  > $output_g/final/0.bed" ); }
        system( "cut    -f7   $output_g/intermediate/$temp.bed  > $output_g/final/$temp.counts" );
        say($temp);
        $bedfiles[++$#bedfiles] = "$output_g/final/$temp.counts";
}

print "\n\n";
print join('  ', @bedfiles), "\n\n";
print "\n\nNumber of files: $#bedfiles+1\n\n\n\n";

my $files = join('  ', @bedfiles);
system( "paste -d '\t'  $output_g/final/0.bed  $files    > $output_g/merged.bed" );
system( "sort -k1,1   -k2,2n   $output_g/merged.bed     >  $output_g/merged.sorted.bed " );
system( "bgzip   $output_g/merged.sorted.bed" );
system( "tabix  -p bed  $output_g/merged.sorted.bed.gz" );


print("\n\n\n\n\n#########################################\n");
###################################################################################################################################################################################################





###################################################################################################################################################################################################
say   "\n\n\n\n\n\n##################################################################################################";
say   "\tJob Done! Cheers! \n\n\n\n\n";





## END




