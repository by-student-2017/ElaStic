#!/bin/bash

# Note: "$EXCITINGROOT" = "$HOME/ElaStic"

# Set number of threads and CPUs
export OMP_NUM_THREADS=1
NCPUs=$(($(nproc) / 2))

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
1
2
case.elastic.in
0.030
6
EOF

# Run ElaStic_Setup with the input file
python3 $HOME/ElaStic/ElaStic_Setup_ESPRESSO < set_energy_2nd.txt

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

# Return to the main directory and run ElaStic_Analyze_Energy
python3 $HOME/ElaStic/ElaStic_Analyze

sed -i s/eta_max[0-9]*/0.030/g ElaStic_2nd.in
sed -i s/Fit_order[0-9]*/4/g ElaStic_2nd.in

# Return to the main directory and run ElaStic_Result
python3 $HOME/ElaStic/ElaStic_Result

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
