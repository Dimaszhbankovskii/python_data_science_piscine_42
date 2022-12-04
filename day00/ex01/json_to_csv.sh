#!/bin/bash

ARG=$1

if [[ -z $ARG ]]
then
	INPUT_FILE='../ex00/hh.json'
else
	INPUT_FILE=$ARG
fi

OUT_FILE='hh.csv'

FILTER_FILE='filter.jq'

cat $INPUT_FILE | jq -r -f $FILTER_FILE > $OUT_FILE

# flags for JQ:
#	-r / --raw-output:
#		With this option, if the filter's result is a string then it will be written directly 
#		to standard output rather than being formatted as a JSON string with quotes.
#		This can be useful for making jq filters talk to non-JSON-based systems.
#
#	-f filename / --from-file filename:
#		Read filter from the file rather than from a command line, like awk's -f option.
#		You can also use '#' to make comments.
#
#	File filter.jq:
#	-	map(. as $row | $cols | map($row[.])) as $rows
#			takes all objects in the outer array, and iterates through all the object keys (id, created_at, name, has_test, alternate_url)
#			and appends the values to an array, which gives you an array of arrays with the values, which is what you want when you're transforming JSON into CSV.
#
#	-	$cols, $rows[] | @csv
#			puts the column headers first in the array, and then each of the arrays that are transformed to lines by piping them to @csv ,
#			which formats the output as… csv.