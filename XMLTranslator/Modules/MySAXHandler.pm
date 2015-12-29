package Modules::MySAXHandler;
use strict;
use warnings;

use XML::SAX;
use base qw(XML::SAX::Base);

use Exporter qw(import);
our @EXPORT_OK = qw(setXmlLines getLines);

my @cache = ();
my @xmllines = ();
my @capturedlines = ();
my $capture = 0;

sub setXmlLines {	
	my ( $self, $line ) = @_;
	push @xmllines, $line;	
}

sub start_document {
	my ($self, $doc) = @_;
	# process document start event
}

sub start_element {
	my ($self, $el) = @_;
	
	push @cache, $el->{Name};
	$capture = 0;
	foreach my $line (@xmllines) {	
		my $joined = join(".", @cache);
		chomp($joined);
		chomp($line);

		if($line eq $joined) {
			$capture = 1;			
		}
	}	
}

sub characters {
	my ($self, $el) = @_;
	if($capture) {
		push @capturedlines, $el->{Data};		
	}
}

sub getLines {
	return @capturedlines;
}

sub end_element {
	my ($self, $el) = @_;
	pop @cache;
	$capture = 0;
}

1;