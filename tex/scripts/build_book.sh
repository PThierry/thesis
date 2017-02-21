#!/bin/sh
##
## build_book.sh
##
## Made by pret
## Login   <pret@thalesgroup.com>
##
## Started on  mar. 21 févr. 2017 11:43:58 CET pret
## Last update mar. 21 févr. 2017 11:49:56 CET pret
##

set -x

input="$1"
output="${1%.pdf}-header.pdf"
pagenum=$(pdftk "$input" dump_data | grep "NumberOfPages" | cut -d":" -f2)
enscript -L1 --header='||$%' --output - <$(for i in $(seq "$pagenum"); do echo $i; done) | ps2pdf - | pdftk "$input" multistamp - output $output
