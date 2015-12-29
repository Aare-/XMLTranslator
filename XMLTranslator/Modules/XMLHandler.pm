package Modules::XMLHandler;
use strict;
use warnings;

use Exporter qw(import);

use XML::SAX;
use Modules::MySAXHandler;

our @EXPORT_OK = qw(convertXMLtoCSV);

sub convertXMLtoCSV {
	my ($in, $out, $lang, $info) = @_;	
 
	my $handler = Modules::MySAXHandler->new;

	#reading template info
	my @xmllines = ();
	open my $info_file, '<', $info or die "\nCould not open $info: $!\n"; 	
	while( my $line = <$info_file>) {					
		$handler->setXmlLines($line);
	}
 	close $info_file; 	 	

 	#start parsing
 	my $parser = XML::SAX::ParserFactory->parser(
        Handler => $handler
  	);  
  	$parser->parse_uri($in); 	

  	my @lines = $handler->getLines;
  	
}
1;