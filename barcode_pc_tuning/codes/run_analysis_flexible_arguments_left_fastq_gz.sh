outputdir=/home/xues7/barcode_pc_tuning/results/nodiff/
mkdir $outputdir/match$1_mismatch$2_gap$3_extension$4_left_cutoff$5_length_cutoff$6_bp$8 
inputdir=/sc1/groups/bfx-red/analysis/datainsights/users/guoy28/projects/carrier_screening/fragment_bias_2020sep/data/200917_Size_Bias_BC4_Barcoded_Adaptor_Templates_Full_recovered_from_20200921
/home/xues7/bacon_garlic/src/bc_picker.py  --match_score $1 --mismatch_score $2 --gap_score $3 --extension_score $4 --max_iter 10000 --stats_file $outputdir/match$1_mismatch$2_gap$3_extension$4_left_cutoff$5_length_cutoff$6_bp$8/$7_stats --prefix match$1_mismatch$2_gap$3_extension$4_left_cutoff$5_length_cutoff$6_bp$8__$7 --bc_config left --cutoff $5  --length_cutoff $6 --length_cutoff2 $6 --bc_direction r   $inputdir/$8_bp/$7.hqr.fastq.gz  /home/xues7/barcode_pc_tuning/bc4_data/barcodes.fa --random_select --purpose test_accuracy --target_sequence "CGATCACATGCGCAC" 

