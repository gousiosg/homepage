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
# POSSIBILITY OF SUCH DAMAGE
#

use strict;
use File::Copy;

my $NEWSDIR = $ENV{'NEWS'};

my $rsstmpl = <<END;
<item>
   <title>%s</title>
   <link>%s</link>
   <description>%s</description>
   <category>%s</category>
   <pubDate>%s</pubDate>
   <guid>%s</guid>
</item>
END

my $htmltmpl = <<END;
  <div id="date" class="news.date">%s</div>
  <div id="content" class="news.content">%s</div>
  <br/>
END

my $newstmpl = <<END;
  <li>%s: %s</li>
END

my $version = '$Id$';

my $news = "$NEWSDIR/news.pre";
my $html = "$NEWSDIR/news.html.pre";
my $rss = "$NEWSDIR/gousiosg-news.xml";
my $incl = "$NEWSDIR/news.inc.pre";

my $rssout = $ARGV[0];
my $inclout = $ARGV[1];
my $htmlout = $ARGV[2];

if ( !-e $html) { die "$html: No such file"; }
if ( !-e $rss) { die "$rss: No such file"; }
if ( !-e $incl) { die "$incl: No such file"; }

#Open all files
open(NEWS, "< $news") || die "Cannot open file $news";
open(RSSIN, " $rss") || die "Cannot open file $rss";
open(INCLIN, " $incl") || die "Cannot open file $incl";
open(HTMLIN, " $html") || die "Cannot open file $incl";
open(RSS, " > $rssout") || die "Cannot open file $rssout";
open(INCL, " > $inclout") || die "Cannot open file $inclout";
open(HTML, " > $htmlout") || die "Cannot open file $htmlout";

#Adjust file pointers appropriately
while (<RSSIN>) {
  if (/news:update/) {
    print RSS $_;
  } elsif (/news:version/) {
    print RSS $version;
  }  elsif (/news:next/) {
    last;
  } else {
    print RSS $_;
  }
}

while (<HTMLIN>) {
  if (/news:news/) {
    last;
  }
  print HTML $_;
} 

while (<INCLIN>) {
  if (/news:news/) {
    last;
  }
  print INCL $_;
} 

#Start processing news
my $parsing;
while (<NEWS>) {
  /\#\%/ && next;
  /\#\#\%/ && next;
  
  
  
}












