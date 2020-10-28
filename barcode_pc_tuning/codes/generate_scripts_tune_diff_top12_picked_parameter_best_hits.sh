rm ./picked_parameter/run*
input_dir=/sc1/groups/bfx-red/analysis/datainsights/users/guoy28/projects/carrier_screening/fragment_bias_2020sep/data/200917_Size_Bias_BC4_Barcoded_Adaptor_Templates_Full_recovered_from_20200921
for mode in left 
do 
    for bp in 500 1500 3000 6000
    do
        for f in $input_dir/${bp}_bp/*hqr.fastq.gz;
        do
            for match in 6 
            do
                for mismatch in  -6 
                do 
                    for gap in  -4
                    do
                        for extension in -4 
                        do      
                            if [ $gap -gt $mismatch ]
                            then
                                if [ $extension -gt $mismatch ]
                                then
                                    matchScore=$(bc<<< "scale = 2;12.75* $match")  # 15*0.85 = 12.75
                                    mismatchScore=$(bc<<< "scale =2;0.15 * $mismatch") # 15 * 0.01 = 0.15
                                    gapScore=$(bc <<< "scale =2; 2.1 *  $gap") # 15 * 2 * 0.07 = 2.1   
                                    extensionScore=$(bc <<< "scale =2; 2.1 *  $extension") # 15 * 2 * 0.07 = 2.1   
                                    totalScore=$(bc <<< "scale =2;$matchScore + $mismatchScore + $gapScore + $extensionScore")
  
                                    for cutoff in  58
                                    do 
                                         for length_cutoff in 30 
                                         do
                                             for diff12 in 6
                                             do 
                                                 echo bash /home/xues7/barcode_pc_tuning/codes/run_analysis_flexible_arguments_${mode}_diff12_detect_best.sh $match $mismatch $gap $extension $cutoff $length_cutoff `echo $(basename $f)|cut -d"." -f1` $bp $diff12> ./picked_parameter/run_`echo $(basename $f)|cut -d"." -f1`_match${match}_mismatch${mismatch}_gap${gap}_extension${extension}_mode${mode}_cutoff${cutoff}_length_cutoff${length_cutoff}_bp${bp}_diff12$diff12.sh
                                                 echo $match $mismatch $gap $extension $cutoff $length_cutoff $diff12 
                                             done
                                         done
                                    done
                                fi
                            fi
                         done
                    done
                done 
            done
         done
    done
done

