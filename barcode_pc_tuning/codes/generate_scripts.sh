#rm ./500bp/*
#rm ./1500bp/*
#rm ./3000bp/*
#rm ./6000bp/*
inputdir=/sc1/groups/bfx-red/analysis/datainsights/users/guoy28/projects/carrier_screening/fragment_bias_2020sep/data/200917_Size_Bias_BC4_Barcoded_Adaptor_Templates_Full_recovered_from_20200921
for mode in left 
do 
    for bp in 500 1500 3000 6000
    do
        for f in $inputdir/${bp}_bp/*.gz;
        do
            for match in 1 2 4 6
            do
                for mismatch in -1 -2 -4 -6
                do 
                    for gap in -1 -2 -4 -6
                    do
                        for extension in -1 -2 -4 -6
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
  
                                    for cutoff in  $(bc <<< "scale =0;$totalScore*0.75/1")  $(bc <<< "scale =0;$totalScore*0.9/1") $(bc <<< "scale =0;$totalScore/1") $(bc <<< "scale =0;$totalScore*1.05/1") $(bc <<< "scale =0;$totalScore*1.1/1") $(bc <<< "scale =0;$totalScore*1.2/1")
                                       do 
                                       for length_cutoff in 30 50 70 100
                                           do echo bash /home/xues7/barcode_pc_tuning/codes/run_analysis_flexible_arguments_${mode}_fastq_gz.sh  $match $mismatch $gap $extension $cutoff $length_cutoff `echo $(basename $f)|cut -d"." -f1` $bp > ./${bp}bp/run_`echo $(basename $f)|cut -d"." -f1`_match${match}_mismatch${mismatch}_gap${gap}_extension${extension}_mode${mode}_cutoff${cutoff}_length_cutoff${length_cutoff}_bp$bp.sh
                                           echo $match $mismatch $gap $extension $cutoff 
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

