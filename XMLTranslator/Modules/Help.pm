package Modules::Help;
use strict;
use warnings;

use Exporter qw(import);
 
our @EXPORT_OK = qw(showHelp);

sub showHelp {
  foreach my $item (@_){
  	print $item;
  }
  

  return "
****************************
*** XMLTranslator v1.0.0 ***
****************************

Tool for converting xml files to and from the csv files for easy collaboration with translators.

Arguments: [-h --help] [-c --convert s s] [-d --deconvert s s] [-l --language s] [-i --info s]
where:
  -h  show this help text

  mandatory:
    -c input_xml output_csv  convert xml file to the csv file 
    -d input_csv output_xml  convert csv file to the xml file
    -l language to convert / de-convert from

  optional:
    -i path to the configuration file (default translate.info from the same directory as input file)	  
";
}

1;