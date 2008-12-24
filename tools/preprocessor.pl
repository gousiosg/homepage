#!/usr/bin/env perl
# (C) Copyright 2008 - Georgios Gousios <gousiosg@gmail.com>
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

my $INCLUDEDIR = $ENV{'INCL'};

my $inputfile  = $ARGV[0];
my $outputfile = $ARGV[1];

if ( !-e $inputfile ) { die "$inputfile: No such file"; }
if ( !-T $inputfile ) { die "$inputfile: Not a text file"; }

#if (! -d $inputfile) {die "$inputfile is a directory, file expected";}

#Global time resolution, seems useful more often than not
(
  my $sec,  my $min,  my $hour, my $mday, my $mon,
  my $year, my $wday, my $yday, my $isdst
  )
  = localtime(time);

copy( $inputfile, "$inputfile.tmp" );

my $replaced = 1;

while ($replaced) {
  $replaced = 0;
  open( IN, "< $inputfile.tmp" ) or die "Could not open file $inputfile.tmp";
  open( OUT, "> $inputfile.tmp.out" )
    or die "Could not open file $inputfile.tmp.out";

  while (<IN>) {
    if ( $_ =~ /<!--(incl.*)-->/ ) {
      print OUT include($1);
      $replaced = 1;
    }
    elsif ( $_ =~ /<!--(changed.*)-->/ ) {
      print OUT changed($inputfile);
      $replaced = 1;
    }
    elsif ( $_ =~ /<!--(news.*)-->/ ) {
      print OUT news($1);
      $replaced = 1;
    }
    else {
      print OUT $_;
    }
  }

  close IN;
  close OUT;
  move( "$inputfile.tmp.out", "$inputfile.tmp" );
}

move( "$inputfile.tmp", $outputfile ) || die "Cannot create file $outputfile";

#include a file from the include directory
#at the designated location.
# argument format:
# incl:FILENAME
sub include {
  my $arg = shift;
  ( my $cmd, my $incl ) = split( /:/, $arg );

  $incl = lc($incl);
  my $result = "";
  open( INPUT, "< $INCLUDEDIR/$incl.inc" )
    or die "Cannot find include file: $INCLUDEDIR/$incl.inc";
  while (<INPUT>) {
    $result = $result . $_;
  }
  return $result;
}

#get the date a file was changed from the SCM
sub changed {
  my $arg  = shift;
  my $date = `LANG=C svn info $arg| grep \"Date\"`;
  if ( $date =~ /\((.*)\)/ ) {
    return $1;
  }
  else {
    return $mday / $mon / $year;
  }
}

sub news {
  
}
