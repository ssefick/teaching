#!/usr/bin/env sh

files=`ls ../ | egrep "[0-9]_Allopatric_Speciation.odg"`

for i in ${files}; do

soffice --headless --convert-to png ../${i}

done