#!/usr/bin/perl
use strict;
use warnings;

use File::Basename qw(dirname);
use Cwd  qw(abs_path);
use lib dirname(dirname abs_path $0) . '/modules';

use Modules::XMLHandler qw(test);
use Modules::Help qw(showHelp);

sub getValueForParameter {	
	my @param = @{$_[0]};
	my $i = 0;	

	foreach my $elem (@ARGV) {
		if(($elem eq $param[0] || $elem eq $param[1]) && ($i + 1) < scalar(@ARGV)) {
			return $ARGV[$i + 1];		
		}

		$i++;
	}

	return 0;
}

sub getInfoPath {
	my $in = $_[0];
	my $info = getValueForParameter(["-i", "--info"]);
	if(!$info) {
		$info = "translate.info";		
	}
	my @in_split = File::Spec->splitdir( $in );
	splice(@in_split, -1);
	$info = File::Spec->catfile(@in_split, $info);	

	return $info;
}

# copy array
my @argvs = @ARGV;

for (;;) {
	my $command = shift @argvs or die showHelp();

	# http://perlmaven.com/switching-in-perl-5.10 (ノಠ益ಠ)ノ彡┻━┻
	if($command eq "-h" || $command eq "--help") {
		die showHelp();	
	} elsif($command eq "-c" || $command eq "--convert") {
		my $in = shift @argvs or die showHelp("\nMissing input file parameter\n");
		my $out = shift @argvs or die showHelp("\nissing output file parameter\n");
		my $lang = getValueForParameter(["-l", "--language"]) or die showHelp("\nMissing language parameter\n");		
		my $info = getInfoPath($in);
		
		print("INFO: ".$info);		


		die "\nDone.\n";
	} elsif($command eq "-d" || $command eq "--deconvert") {	
		my $in = shift @argvs or die showHelp("\nMissing input file parameter\n");
		my $out = shift @argvs or die showHelp("\nMissing output file parameter\n");
		my $lang = getValueForParameter(["-l", "--language"]) or die showHelp("\nMissing language parameter\n");		
		my $info = getInfoPath($in);

		die "\nDone.\n";	
	} else {
		unless(($command eq "-l" || $command eq "--language" ||
			 $command eq "-i" || $command eq "--info")) {
			die showHelp();	
		} else {
			#all of the skippable commands take argument
			shift @argvs;
		}
	}
}