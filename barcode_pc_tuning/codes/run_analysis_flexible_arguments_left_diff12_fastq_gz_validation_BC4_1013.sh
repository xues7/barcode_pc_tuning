mkdir /home/xues7/barcode_pc_tuning/results/match$1_mismatch$2_gap$3_extension$4_left_cutoff$5_length_cutoff$6_bp$8_diff12$9
input_dir=/sc1/groups/bfx-red/analysis/datainsights/users/guoy28/projects/carrier_screening/fragment_bias_0.1pmol_2020oct/data/201008_Size_bias_with_0.1pmol_DNA_input_0.1nM_on-chip_loading_LSDB_HSRB_dither

/home/xues7/bacon_garlic/src/bc_picker.py  --match_score $1 --mismatch_score $2 --gap_score $3 --extension_score $4 --diff12 $9  --max_iter 10000 --stats_file /home/xues7/barcode_pc_tuning/results/match$1_mismatch$2_gap$3_extension$4_left_cutoff$5_length_cutoff$6_bp$8_diff12$9/$7_stats --prefix match$1_mismatch$2_gap$3_extension$4_left_cutoff$5_length_cutoff$6_bp$8_diff12$9__$7 --bc_config left --cutoff $5  --length_cutoff $6  --bc_direction r   $input_dir/BC4_$8bp/$7.hqr.fastq.gz  /home/xues7/barcode_pc_tuning/bc4_data/barcodes.fa --random_select --purpose test_accuracy --target_sequence "CGATCACATGCGCAC" 

