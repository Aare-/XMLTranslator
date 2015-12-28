#!/usr/bin/perl
use strict;
use warnings;

use File::Basename qw(dirname);
use Cwd  qw(abs_path);
use lib dirname(dirname abs_path $0) . '/modules';

use Modules::XMLHandler qw(test);

print "Hello, World!\n";

test();

