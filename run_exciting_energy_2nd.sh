#!/bin/bash

# Set number of threads and CPUs
export OMP_NUM_THREADS=1
NCPUs=$(($(nproc) / 2))

SETUP-excitingroot.sh

# Create a temporary input file for ElaStic_Setup
cat <<EOF > set_stress.txt
1
2
case.elastic.in
0.030
6
EOF

# Run ElaStic_Setup with the input file
ElaStic_Setup < set_stress.txt

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
  
  cp 
  
  cp "$outfile" "./../${subdir}/${base}/$outfile"
done

cd ../

sed -i s/eta_max/0.030/g ElaStic_2nd.in
sed -i s/Fit_order/4/g ElaStic_2nd.in

# Return to the main directory and run ElaStic_Analyze_Energy
ElaStic_Analyze

# Check and display ElaStic_2nd.out in Energy-vs-Strain directory
if [ -f ./Energy-vs-Strain/ElaStic_2nd.out ]; then
    echo "ElaStic_2nd.out found in Energy-vs-Strain. Displaying contents:"
    cat ./Energy-vs-Strain/ElaStic_2nd.out
    echo "see ElaStic_2nd.out file in Energy-vs-Strain directory."
    
elif [ -f ElaStic_2nd.out ]; then
    echo "ElaStic_2nd.out found in current directory. Displaying contents:"
    cat ElaStic_2nd.out
    echo "see ElaStic_2nd.out file in current directory."
    
else
    echo "ElaStic_2nd.out not found in either Energy-vs-Strain or current directory."
fi
