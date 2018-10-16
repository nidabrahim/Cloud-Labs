#!/bin/bash

#SBATCH --job-name=povrayJob
#SBATCH --dependency=singleton
#SBATCH --partition=long

cd /tmp/
cp -r /home/etud/yonidabrah/results/ RAC/
cd RAC

convert glsbng*.png -delay 6 -quality 100 glsbng.gif

cp glsbng.gif /home/etud/yonidabrah/results/
cd ../
rm -rf RAC

