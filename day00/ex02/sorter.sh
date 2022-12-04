#!/bin/bash

ARG=$1

if [[ -z $ARG ]]
then
    INPUT_FILE='../ex01/hh.csv'
else
    INPUT_FILE=$ARG
fi

OUT_FILE='hh_sorted.csv'

cat $INPUT_FILE | head -n 1 > $OUT_FILE

cat $INPUT_FILE | tail -n +2 | sort --field-separator=',' --key=2,2 --key=1,1 >> $OUT_FILE

#	head - output the first part of files (without parametr - 10 lines in STDOUT)
#	-n, --lines=[-]NUM
#		print the first NUM lines instead of the first 10; with
#		the leading '-', print all but the last NUM lines of each file
#
#	tail - display the last part of a file
#		The utility displays the contents of file or, by default, its standard input, to the standard output.
#		The display begins at a byte, line or 512-byte block location in the input.
#		Numbers having a leading plus ('+') sign are relative to the beginning of the input,
#		for example, '-c +2' starts the display at the second byte of the input.
#		Numbers having a leading minus ('-') sign or no explicit sign are relative to the end of the input,
#		for example, '-n 2' displays the last two lines of the input. The default starting location is '-n 10'
#		or the last 10 lines of the input.
#	-n (number)
#		The location is number lines.
#
#	sort - sort lines of text files
#	-k, --key=Position1[,Position2]
#		selects a sort key starting at position Position1 and ending at position Position2 (inclusive).
#		Field numbers and character offsets are specified starting from 1
#	-t, --field-separator=SEP
#		use SEP instead of non-blank to blank transition