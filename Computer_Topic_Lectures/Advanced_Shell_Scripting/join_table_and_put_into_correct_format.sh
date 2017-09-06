#!/usr/bin/env sh

##################################################################################################
##modules
module load lastz
##################################################################################################

##################################################################################################
##directories
out_dir=/home/ssefick/arctoides/Annotated_VQSR_RGQ_table/
lastz_table_dir=/home/ssefick/arctoides/rhesus_baboon_ref/rheMac3_papAnu2_comparison/maf/vcf_table/
VQSR_Annotated_table_dir=/home/ssefick/arctoides/arctoides_25_updated_filter/vcf_table/
##################################################################################################

mkdir -p ${out_dir}

cd ${out_dir}

##################################################################################################
##find with absolute path
##set up variables
lastz_tables=`find ${lastz_table_dir} | grep non-match\\.vcf | sort`
VQSR_ANNOTATED_tables=`find ${VQSR_Annotated_table_dir} | grep ANNOTATED_vcf_table$ | grep -v chrM | sort`
##################################################################################################

##################################################################################################
##BASH FUNCTION DEFINITIONS

##bash body function#######
body() {
    IFS= read -r header
    printf '%s\n' "$header"
    "$@"
}

export -f body
###########################

###########################
##awk functions#############

###########################
##RGQ and VQSR_PASS
RGQ_VQSR_PASS() {
awk '$0~/RGQ/ || $0~/VQSR_PASS/ || $0~/^#/ {print}'
}

export -f RGQ_VQSR_PASS
###########################

###########################
#CHROM POS REF hg19 papAnu2 sample1 sample2
ben_awk() {
awk 'BEGIN{OFS="\t"} {print $2, $1, $4, $5, $17, $18, $19, $20}'
}

export -f ben_awk
###########################

##################################################################################################

##################################################################################################
##hacky and dumb
awk5() {
awk -v "OFS=\t" '{$5=$5;sub(/:.*/, "", $5); print}'
}
export -f awk5

awk6() {
awk -v "OFS=\t" '{$6=$6;sub(/:.*/, "", $6); print}'
}
export -f awk6

awk7() {
awk -v "OFS=\t" '{$7=$7;sub(/:.*/, "", $7); print}'
}
export -f awk7

awk8(){
awk -v "OFS=\t" '{$8=$8;sub(/:.*/, "", $8); print}'
}
export -f awk8
##################################################################################################


##################################################################################################
##GNU parallel

out_file=`echo $VQSR_ANNOTATED_tables | sed "s/\\/home\\/ssefick\\/arctoides\\/arctoides_25_updated_filter\\/vcf_table\\//\\/home\\/ssefick\\/arctoides\\/Annotated_VQSR_RGQ_table\\//g" | sed s/ANNOTATED_vcf_table/ANNOTATED_vcf_BENFORMAT_table/g`

first() {

    join -1 2 -2 2 -t $'\t' --header <(tail -n+2 $1 | body sort -k 2) <(cat $2 | body sort -k 2) | body sort -k 1n

}

export -f first

parallel --link first {1} {2} '|' RGQ_VQSR_PASS '|' ben_awk '|' awk5 '|' awk6 '|' awk7 '|' awk8 '>' {3} ::: ${lastz_tables} ::: ${VQSR_ANNOTATED_tables} ::: ${out_file}
##################################################################################################
