#!/bin/bash

# Set number of threads and CPUs
export OMP_NUM_THREADS=1
NCPUs=$(($(nproc) / 2))

SETUP-excitingroot.sh

echo "For example, input on ElaStic_Setup"
echo "exciting  ---------=>  1"
echo ">>>> Please choose (1, 2, or 3): 1"
echo ""
echo "Energy  ---=>  1"
echo ">>>> Please choose the method of the calculation (choose '1' or '2'): 1"
echo ""
echo "2nd  ---=>  2"
echo ">>>> Please choose the order of the elastic constant (choose '2' or '3'): 2"
echo ""
echo ">>>> Please enter the exciting input file name: input.xml"
echo "The suggested value is between 0.030 and 0.150: 0.050"
echo ">>>> Please enter the number of the distorted structures [odd number > 4]: 11"

ElaStic_Setup

cd Structures_exciting

# Run Exciting calculations for each Dst*_*,in file
for infile in Dst*_*.xml; do
  
  # base = Dst01_01
  base="${infile%.xml}"
  
  # subdir = Dst01
  subdir="${base%%_*}"
  
  cp ${infile} input.xml
  
  # output file (e.g., Dst01_01.out)
  outfile="${infile%.in}.out"
  
  echo "Running $infile -> $outfile"
  mpirun -np ${NCPUs} exciting_purempi
  
  cp *_ini.xml "$outfile"
  
  cp "$outfile" "./../${subdir}/${base}/$outfile"
done

cd ../
