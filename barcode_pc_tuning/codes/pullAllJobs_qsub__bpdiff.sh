echo ""> jobs_qsub_with_diff.sh
#for f in `find . -name 'run*bp*diff*.sh'`;do echo qsub -q all.q -pe smp 1 -P rssrbfx -N job_1 -l h_vmem=12G $f >> jobs_qsub_with_diff.sh;done
for f in `find . -name 'run*bp*diff*.sh'`;do echo bash $f >> jobs_qsub_with_diff.sh;done
