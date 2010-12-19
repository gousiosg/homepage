#!/usr/bin/env perl
# (C) Copyright 2010 - Georgios Gousios <gousiosg@gmail.com>
# All rights reserved.
#
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions are met:
#
#  * Redistributions of source code must retain the above copyright notice, this
#    list of conditions and the following disclaimer.
#  * Redistributions in binary form must reproduce the above copyright notice,
#    this list of conditions and the following disclaimer in the documentation
#    and/or other materials provided with the distribution.
#
# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
# AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
# IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
# ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE
# LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
# CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
# SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
# INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
# CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
# ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
# POSSIBILITY OF SUCH DAMAGE.

use strict;
use File::Copy;

my $BIBDIR = $ENV{'BIB'};
my $TOOLSDIR = $ENV{'TOOLS'};

my $inputfile  = $ARGV[0];
my @tmpfiles;

open( IN, "< $inputfile" ) or die "Could not open file $inputfile";
open( OUT, "> $inputfile.out" ) or die "Could not open file $inputfile.out";

push (@tmpfiles, "$inputfile.out");

while (<IN>) {
  if (m/<!-- \s*bibincl:(.*)\s*-->/) {
    #print OUT $_;
    print OUT getbib($1);
  } 
  else {
    print OUT $_;
  }
}

move( "$inputfile.out", "$inputfile" );

sub getbib {
  my $bibline = shift;
  
  (my $refs, my $file) = split ('#', $bibline);
  my @refs = split(',', $refs);
  
  chomp ($file); chop ($file);
  
  if (! -e $TOOLSDIR.'/'.$file) {
    print STDERR "Copying file $BIBDIR/$file to $TOOLSDIR\n";
    copy($BIBDIR.'/'.$file, $TOOLSDIR) || die "$!";
    push (@tmpfiles, $TOOLSDIR.'/'.$file);
  }
  
  $file =~ s/(.*).bib/$1/;
  my $pid = $$;
  
  open (TMP, ">$TOOLSDIR/bibinput$pid.aux") or die "Cannot open tmp file: ";
  push (@tmpfiles, "$TOOLSDIR/bibinput$pid.aux");
  
  print TMP "\\relax"."\n";
  print TMP "\\bibstyle{$TOOLSDIR/html-n}"."\n";
  print TMP "\\bibdata{". $file . "}\n";
  for my $ref (@refs) {
    print TMP "\\citation{$ref}"."\n";
  }
  
  close (TMP);

  system("cd $TOOLSDIR && ./bib2xhtml.pl -s empty -c -r bibinput$pid.aux >tmp$pid.html");
  push (@tmpfiles, "$TOOLSDIR/tmp$pid.html");

  open (HTML, "$TOOLSDIR/tmp$pid.html") or die "Cannot open $TOOLSDIR/tmp$pid.html: $!";
  my @lines = <HTML>;
 
  my $biblines, my $read = 0;
  for my $line (@lines) {
    if ($line =~ m/BEGIN BIBLIOGRAPHY/) {
      $read = 1;
      next;
    }
    
    if ($line =~ m/END BIBLIOGRAPHY/) {
      #$biblines = $biblines . $line;
      $read = 0;
    }
    
    if ($read) {
      $biblines = $biblines . $line;
    }
    
  }
  
  return $biblines;
}

unlink @tmpfiles;









