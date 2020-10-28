echo "">jobs_qsub_no_diff.sh
for f in `find . -name 'run*bp*.sh'`;do echo qsub -q all.q -pe smp 1 -P rssrbfx -N job_1 -l h_vmem=12G $f >> jobs_qsub_no_diff.sh;done
cat jobs_qsub_no_diff.sh |grep -v "diff12" > jobs_qsub_no_diff2.sh
cp jobs_qsub_no_diff2.sh jobs_qsub_no_diff.sh
rm jobs_qsub_no_diff2.sh
