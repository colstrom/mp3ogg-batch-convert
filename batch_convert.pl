#!/usr/bin/perl

#########################################################
# Batch Convert, an addon for Loran T. Hughes' 'mp3ogg' #
#########################################################
#
# Copyright (C) 2004-2011 Chris Olstrom
#

use strict;

# Parent directory your music is stored in.
my $BASE_PATH = '/mnt/hdd1/Music/';

# Where is the list stored (temporarily)?
my $DIRLIST_FILE = '/tmp/dirlist.txt';

# Command used to convert contents of directory to OGG.
my $CONVERT_COMMAND = 'mp3ogg';

system ( "cd $BASE_PATH && find | grep -i -v mp3 | grep -i -v ogg > $DIRLIST_FILE" );

open ( dirlist, $DIRLIST_FILE ) || die ( "Could not open file. $!" );
        my @directories = <dirlist>;
close ( dirlist );

system ( "rm -i $DIRLIST_FILE" );

foreach my $directory (@directories) {
        system ( "cd '$directory' && mp3ogg" );
	system ( "cd $BASE_PATH" );
}


