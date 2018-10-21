#!/bin/sh

#SBATCH --job-name=povrayJob
#SBATCH --array=0-5
#SBATCH --partition=short

cd /tmp/
v='RAC'${SLURM_ARRAY_TASK_ID}
cp -r /home/etud/yonidabrah/povray/ $v
cd $v
ls -l

./povray +A +W800 +H600 +Lshare/povray-3.6/include/ +SF$((${SLURM_ARRAY_TASK_ID}*10 + 1)) +EF$((${SLURM_ARRAY_TASK_ID}*10 + 10))  glsbng.ini

cp *.png /home/etud/yonidabrah/results/

cd ..
rm -rf $v

