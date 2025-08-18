#!/bin/bash

# Note: "$EXCITINGROOT" = "$HOME/ElaStic"

# Set number of threads and CPUs
export OMP_NUM_THREADS=1
NCPUs=$(($(nproc) / 2))

# copy pseudo-potentials
cp *.UPF ./Structures_ESPRESSO/

# Navigate to Structures_ESPRESSO directory
cd Structures_ESPRESSO

# Run Quantum ESPRESSO calculations for each Dst*_*,in file
for infile in Dst*_*.in; do
  sed -i '/^[[:space:]]*A[[:space:]]*=/d' "$infile"
  
  # base = Dst01_01
  base="${infile%.in}"
  
  # subdir = Dst01
  subdir="${base%%_*}"
  
  # output file (e.g., Dst01_01.out)
  outfile="${infile%.in}.out"
  
  echo
  echo '        +--------------------------------------+'
  echo '        | SCF calculation of "'${base}'" starts |'
  echo '        +--------------------------------------+'
  echo "Running $infile -> $outfile"
  time mpirun -np ${NCPUs} pw.x < "$infile" > "$outfile"
  date
  
  cp "$outfile" "./../${subdir}/${base}/$outfile"
done

cd ../
