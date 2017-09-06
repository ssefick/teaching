###############################################
#!/usr/bin/env sh
###############################################

###############################################
##module block
module load blast+
###############################################

###############################################
##variable block
wd=/home/aubsas/GuestLectureII/class_materials
##out_dir is the same as wd
###############################################

###############################################
##commands
##These represent an interactive analysis
##this script represent a reproducible document
##Commands that are decididly interactive are commented out

cd ${wd}

#begin History 
 makeblastdb -in ATcp.fasta -dbtype nucl
 makeblastdb -in ATmt.fasta -dbtype nucl
 makeblastdb -in ATchrV.fasta -dbtype nucl
 # now lets examine the genomic resources and make a link to them 
## less /apps/bio/unzipped/genomes/Arabidopsis_thaliana/CHR_I/formatdb.log 
 # these files look old there are newer versions of AT genome out but we will not need them for our purposes since gene membership on cp, mt and nc does not change rapidly.
 # now lets link to the Arabidopsis_thaliana folder so we don't have to write such long paths.
 ln -s /apps/bio/unzipped/genomes/Arabidopsis_thaliana/ . 
## less test.fasta 
 # Now we will create a set of outfiles using 1 nc databaste, cp, and mt databases
 blastn -query test.fasta  -db ATmt.fasta -outfmt 7 > qtest_dbATmt.blastn_out
 blastn -query test.fasta  -db ATcp.fasta -outfmt 7 > qtest_dbATcp.blastn_out
 blastn -query test.fasta  -db Arabidopsis_thaliana/CHR_I/NC_003070.gbk -outfmt 7 > qtest_dbCHR_I.blastn_out
 # now lets look at a confounding result
## grep ATMG00020.1 *blastn_out
 # notice that the nc results for CHR_I look horrible. We will clean these up with sed later. Also notice that this transcript of MT origin has multiple nt level hits to the nuclear genome. This is most concerning. 
 # the way to solve this problem is to limit reported hits. We also want all blast databases searched at the same time so now we will combine all into 1 database statement. 
##  blastn -help
 blastn -max_target_seqs 1 -query test.fasta -db "ATchrV.fasta ATmt.fasta ATcp.fasta Arabidopsis_thaliana/CHR_I/NC_003070.gbk Arabidopsis_thaliana/CHR_II/NC_003071.gbk Arabidopsis_thaliana/CHR_III/NC_003074.gbk Arabidopsis_thaliana/CHR_IV/NC_003075.gbk"  -outfmt 7 -out  qtest_dbTotal.blastn_out
## less qtest_dbTotal.blastn_out 
## less qtest_dbTotal.blastn_out grep ATMG00020 qtest_dbTotal.blastn_out 
## grep ATMG00020 qtest_dbTotal.blastn_out 
## less qtest_dbTotal.blastn_out 
 # now the above grep shows us that we have limited the hits to 1 per genome. However, lessing the file shows that each transcript has multiple hits. This is showing the exons. Since we are looking at cds data we don't have introns included. This reflected in the output of -outfmt 7. 
 # now we will start using awk to count how many transcripts hit to each genome.
## less qtest_dbTotal.blastn_out 
## awk  '$1 ~!/#/ {print $1,$2,$11}' qtest_dbTotal.blastn_out 
## awk  '$1 ~!/#/ && $11 <= 1e-5 {print $1,$2,$11}' qtest_dbTotal.blastn_out 
 
# use egrep to show how expression works then sed to clean expression and replace with label NT

## awk  '$1 ~!/#/ && $11 <= 1e-5 {print $1,$2}' qtest_dbTotal.blastn_out |egrep '[1-5]_/home.*'
## awk  '$1 ~!/#/ && $11 <= 1e-5 {print $1,$2}' qtest_dbTotal.blastn_out |sed 's/[1-5]_/home.*/NT/'
## awk  '$1 ~!/#/ && $11 <= 1e-5 {print $1,$2}' qtest_dbTotal.blastn_out |sed 's/[1-5]_\/home.*/NT/'
## awk  '$1 ~!/#/ && $11 <= 1e-5 {print $1,$2}' qtest_dbTotal.blastn_out |sed 's/[1-5]_\/home.*/NT/'| sort | uniq | awk '{print $2}' | sort | uniq -c | sort -n 
 # The above script extracts the following # 76 MT, 132 CP, 370 NT.
 ##grep -c ">" test.fasta 
 # we are missing 1 fasta entry where did it go. 
## less qtest_dbTotal.blastn_out 
## grep -B 4 " 0 hits" qtest_dbTotal.blastn_out  
 # My bad read the output wonky 
 # BLASTN 2.2.29+
 # Query: ATMG00665.1
 # Database: ATmt.fasta ATcp.fasta Arabidopsis_thaliana/CHR_I/NC_003070.gbk Arabidopsis_thaliana/CHR_II/NC_003071.gbk Arabidopsis_thaliana/CHR_III/NC_003074.gbk Arabidopsis_thaliana/CHR_IV/NC_003075.gbk
 # 0 hits found

# here I am using the master file with origin labels on it. But it can be done with test.fasta as well.  
	
##  grep ATMG00665.1 subset_cDNA_tair.fasta 
##  grep ATMG00665.1 subset_cDNA_tair.fasta | cut -b 2- No-hit.list 
 grep ATMG00665.1 test.fasta | cut -b 2- >No-hit.list
 select_contigs.pl -n No-hit.list test.fasta No-hit.fasta
## blastn -query No-hit.fasta  -db ATmt.fasta  -outfmt 7

# Still no hit. 

## cat No-hit.fasta 
## grep -v ">" No-hit.fasta | wc 
 # chrM is only 23 nucletides long. So it is no problem that it was excluded.  All present and accounted for. 
 
 awk  '$1 ~!/#/ && $11 <= 1e-5 {print $1,$2}' qtest_dbTotal.blastn_out |sed 's/[1-5]_\/home.*/NT/'| sort | uniq | awk '{print $2}' | sort | uniq -c | sort -n > test_genome.table
###############################################

 ###############################################
 ## R
 ## plot the test_genome.table outside of the shell...
 # R command for plotting pdf();barplot( TG$V1, names.arg=TG$V2,main="Number of Transcripts per Genome" ) ; dev.off()
