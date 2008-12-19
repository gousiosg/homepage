#!/usr/bin/env perl

use strict;
use File::Copy;


my $inputfile = $ARGV[1];
my $outputfile = $ARGV[2];

if (! -e $inputfile) {die "$inputfile: No such file";}
if (! -T $inputfile) {die "$inputfile: Not a text file";}
if (! -d $inputfile) {die "$inputfile is a directory, file expected";}

copy($inputfile, $inputfile.tmp);

open (IN, "< $inputfile") or die "Could not open file $inputfile";

move($inputfile.tmp, $outputfile);
