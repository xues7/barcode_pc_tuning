for f in `find /sc1/groups/bfx-red/analysis/datainsights/users/guoy28/projects/carrier_screening/fragment_bias_2020sep/data/200917_Size_Bias_BC4_Barcoded_Adaptor_Templates_Full_recovered_from_20200921/ -name "*.hqr.fastq.gz"`;
do 
outputgz=/home/xues7/barcode_pc_tuning/bc4_data/4_exp_fasta/$(basename $f).fasta  

output_script=/home/xues7/barcode_pc_tuning/codes/scripts_fastq_fasta_gz/$(basename $f)_2fastagz.sh
echo "python /home/xues7/FASTQ_to_FASTA/FASTQ_to_FASTA.py  $f  $outputgz gz" > $output_script


echo "gzip $outputgz" >>$output_script
done
