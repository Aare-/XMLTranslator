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

Tool for converting xml files to csv files for easy collaboration with translators.
Converting xml file to csv requires creating .info file with informations about the structure of the xml document. .info file consists of searate lines of data, each line describes path to the nested node in xml file that you wish to export. For example given the xml file:

<root>
    <line>test</line>
</root>

If one wish to export content of the 'line' node .info file should contain one line:

root.line

The default name of the .info file is translate.info but you can specify custom one using command line argument.

Arguments: [-h --help] [-c --convert s s] [-l --language s] [-i --info s]
where:
  -h  show this help text

  mandatory:
    -c input_xml output_csv  convert xml file to the csv file     

  optional:
    -l language to convert to (default English)
    -i path to the configuration file (default translate.info from the same directory as input file)	  
";
}

1;
