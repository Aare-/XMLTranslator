package Modules::XMLHandler;
use strict;
use warnings;

use Exporter qw(import);

use XML::SAX;
use Modules::SHGenCSV;

our @EXPORT_OK = qw(convertXMLtoCSV);

sub convertXMLtoCSV {
	my ($in, $out, $lang, $info) = @_;	
 
	my $handler = Modules::SHGenCSV->new;

	#reading template info
	my @xmllines = ();
	open my $info_file, '<', $info or die "\nCould not open $info: $!\n"; 	
	while( my $line = <$info_file>) {					
		$handler->setXmlLines($line);
	}
 	close $info_file or die "\nCould not close $info: $!\n"; 	 	

 	#start parsing
 	my $parser = XML::SAX::ParserFactory->parser(
        Handler => $handler
  	);  
  	$parser->parse_uri($in); 	

  	my @lines = $handler->getLines;

  	#creating array  	
	open my $out_file, ">:encoding(utf8)", $out or die "\nCould not create file $out: $!\n";
	print $out_file "\"ID\";\"Raw\";\"$lang\"\n";
	my $counter = 1;	
	for (@lines) {	    
		my @arr = ("\"$counter\"", "\"$_\"", "\" \"");		
    	print $out_file join(";",@arr)."\n";	    
	    $counter++;
	}
	close $out_file or die "\nCould not close $out: $!";
  	
}
1;