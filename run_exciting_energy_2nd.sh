#!/bin/bash

EXECUTABLE=$EXCITINGROOT/bin/exciting_purempi

# Set number of threads and CPUs
export OMP_NUM_THREADS=1
NCPUs=$(($(nproc) / 2))

# copy pseudo-potentials
cp *.UPF ./Structures_ESPRESSO/

echo "     +---------------------------------------------------------------+"
echo "     |***************************************************************|"
echo "     |*                                                             *|"
echo "     |*                 WELCOME TO THE ElaStic CODE                 *|"
echo "     |*        ElaStic Version 1.1, Release Date: 2013-01-01        *|"
echo "     |*                                                             *|"
echo "     |***************************************************************|"
echo "     +---------------------------------------------------------------+"
echo ""
echo "     Which DFT code would you like to apply for the calculations? "
echo "     exciting  ---------=>  1                                     "
echo "     WIEN2k    ---------=>  2                                     "
echo "     Quantum ESPRESSO --=>  3)"
echo ">>>> Please choose (1, 2, or 3): 3"

# Create a temporary input file for ElaStic_Setup
cat <<EOF > set_energy_2nd.txt
2
2
input.xml
0.005
6
EOF

# Run ElaStic_Setup with the input file
ElaStic_Setup_ESPRESSO < set_energy_2nd.txt

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

# Return to the main directory and run ElaStic_Analyze_Energy
ElaStic_Analyze

sed -i s/eta_max/0.005/g ElaStic_2nd.in
sed -i s/Fit_order/3/g ElaStic_2nd.in

# Return to the main directory and run ElaStic_Result
ElaStic_Result

# Check and display ElaStic_2nd.out in Stress-vs-Strain directory
if [ -f ./Stress-vs-Strain/ElaStic_2nd.out ]; then
    echo "ElaStic_2nd.out found in Stress-vs-Strain. Displaying contents:"
    cat ./Stress-vs-Strain/ElaStic_2nd.out
    echo "see ElaStic_2nd.out file in Stress-vs-Strain directory."
    
elif [ -f ElaStic_2nd.out ]; then
    echo "ElaStic_2nd.out found in current directory. Displaying contents:"
    cat ElaStic_2nd.out
    echo "see ElaStic_2nd.out file in current directory."
    
else
    echo "ElaStic_2nd.out not found in either Stress-vs-Strain or current directory."
fi
