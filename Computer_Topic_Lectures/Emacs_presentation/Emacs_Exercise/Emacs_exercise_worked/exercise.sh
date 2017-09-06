#!/usr/bin/env sh

#fake data
#push sim bed to file
#echo -e "chr10\t1\t2\nchr2\t5000\t5001\nchr1\t1\t2\nchr22\t1\t2\nchr22\t1000\t1001\nchr1\t1000\t1001\nchr2\t2000\t2001" > sim.bed

####################start exercise here##################
#open emacs in Emacs_exercise folder
#emacs -nw

#split pane
#C-x 2

#move to pane and start terminal
#C-x o
#M-x term

#while the focus is in the terminal change it to line mode
#C-c C-j

#what is the name of the bed file? 
#use ls to find this out
#use either up/down arrows or use keyboard shortcuts (C-n, C-p, C-f, C-b, etc.)!
#Copy in terminal and paste into script window

#select/copy
#C-space
#M-w

#move back to script window
#C-x o
#C-y

#now write a script to sort the bed file

#!/usr/bin/env sh

bed_file=sim.bed

#bedtools website
sort -k1,1 -k2,2n ${bed_file} > a

#biostars answer
sort -k1,1V -k2,2n ${bed_file} > b

diff -y a b
