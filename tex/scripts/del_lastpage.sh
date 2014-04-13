#!/bin/bash
##
## del_lastpage.sh for  in /home/phil/Travail/Doctorat/these/tex
##
## Made by phil
## Login   <phil@fr.thalesgroup.com>
##
## Started on  dim. 13 avril 2014 10:26:21 CEST phil
## Last update dim. 13 avril 2014 15:19:22 CEST phil
##

set -x

page_count=`pdfinfo "$INFILE" | grep 'Pages:' | awk '{print $2}'`

page_count=$(( $page_count - 1 ))
pdftk "$INFILE" cat 1-$page_count output "$OUTFILE"

