# ElaStic

---

## Features
- Language: Python3 (Migrating from python2 to python3)
- Calculation target
  - Mode: energy: WIEN2k, exciting and QE (Quantum Espresso, PWscf)
  - Mode: stress: QE (Quantum Espresso, PWscf) (WIEN2k and exciting: SORRY, Not implemented yet)
  - Version: WIEN2k: ver.16, exciting: neon series, QE: v6.8 or Later
- External Tools:
  - SGROUP: Determine space group and symmetry operations (included in adon_v1_0.tar.gz)
  - DFT Code: Supports Exciting, WIEN2k, and Quantum ESPRESSO
- Output:
  - Second- and third-order elastic constants (ElaStic_2nd.out, ElaStic_3rd.out)
  - full second-order elastic tensors (elastic constants) for all crystal lattice types
  - third-order elastic constants for cubic, hexagonal, and rhombohedral crystals
  - Generation of deformed structures, evaluation of energy and stress, and analysis using polynomial fitting
- Further improvements are difficult for me (By STUDENT), so I will leave it to future researchers.

---

## Elastic Installation
1. sudo apt update
2. sudo apt -y install gfortran make build-essential grace
3. sudo apt -y install python3 python3-numpy python3-matplotlib
4. cd $HOME
5. git clone https://github.com/by-student-2017/ElaStic.git
6. cd ElaStic
7. tar xvf adon_v1_0.tar.gz
8. cd SpaceGroups
9. make
10. cd ..
11. cp SpaceGroups/sgroup ./sgroup
12. chmod +x *
13. echo 'export ElaSticROOT=$HOME/ElaStic' >> ~/.bashrc
14. echo 'export PATH="$ElaSticROOT:$PATH"' >> ~/.bashrc

---

## Usage
1. python3 $HOME/ElaStic/ElaStic_Setup
2. (run exciting, WIEN2k or QE) (QE: *.in -> *.out)
3. python3 $HOME/ElaStic/ElaStic_Analyze
4. (From the figures shown in ElaStic_2nd.in or ElaStic_3rd.in, specify the eta_max and Fit_order for a fit that is converging at a plateau and not too large in order.)
5. python3 $HOME/ElaStic/ElaStic_Result

---

## Tutorial
- The tutorial directory contains a readme.md file that explains how to calculate the code. Please refer to it.

---

## Postprocessing
- ElaStic_xyz2XYZ: Transformation of tensors using coordinate transformation
- ElaStic_Analyze_B0: Analysis of strain dependence of bulk modulus B0 and its pressure derivative B0'
- Note: B0' is a very useful alternative index for the third-order elastic constant, and can evaluate nonlinearity while keeping computational costs low. By using ElaStic_Analyze_B0, stable results and physical validity can be achieved.

---

## ElaStic_Analyze_B0: Role and Significance

`ElaStic_Analyze_B0` is a post-processing tool within the ElaStic package designed to analyze the dependence of the **bulk modulus B0** and its **pressure derivative B0' (dB/dP)** on the strain range and polynomial fit order.

- **B0**: Measures the resistance of a crystal structure to volume compression. Typically evaluated using an equation of state (EOS), such as the Murnaghan EOS.
- **B0'**: Describes how B₀ changes under pressure. It is closely related to third-order elastic constants and reflects nonlinear mechanical responses.

### Technical Challenges

1. **B0' Depends on Higher-Order Fits**  
   Accurate evaluation of B0' requires fitting the energy–volume curve with third-order or higher polynomials. This is physically tied to third-order elastic constants (Cijk), which capture anharmonic effects in the crystal.

2. **High Computational Cost for Third-Order Calculations**  
   - Requires a large number of distorted structures (typically 10–20 or more).
   - Each DFT calculation (especially stress-based) can take minutes to hours.
   - High-quality fitting demands low-noise data, which increases computational burden.

3. **Result Stability Depends on Strain Range and Fit Order**  
   - Excessive strain may lead to nonphysical behavior (e.g., structural instability).
   - Too small strain may be dominated by numerical noise.
   - Overfitting can occur with high-order polynomials, reducing physical reliability.

### Recommended Strategies

1. **Use B0' as a Proxy for Third-Order Elastic Constants**  
   - B0' can be evaluated relatively cheaply via EOS fitting.
   - Combining B₀′ with empirical models (e.g., Slack or Cezairliyan) allows indirect incorporation of third-order effects.

2. **Optimize Fit Range and Polynomial Order**  
   - Use `ElaStic_Analyze_B0` to visualize plateau regions in the EOS fit.
   - Select `eta_max` and `Fit_order` based on stable regions.
   - Typical values: strain range +/- 0.02, polynomial order 2–3.

3. **Reduce Computational Cost**  
   - Prefer energy-based EOS fitting over stress-based methods.
   - Use fast tools like `thermo_pw` or `ElaStic_Result_Stress_3rd`.
   - For screening purposes, apply Slater approximation or Murnaghan EOS for quick estimates.

### Practical Workflow (Recommended for Exploratory and Precision Use)

- **Exploratory Use**:  
  Apply Slater approximation and evaluate B₀′ via EOS fitting. Avoid full third-order tensor calculations.

- **Precision Use**:  
  Use `ElaStic_Analyze_B0` to determine optimal `eta_max` and `Fit_order`. If necessary, prepare `ElaStic_3rd.in` for full third-order evaluation.

- **Slack Model Enhancement**:  
  Incorporate B0' into the empirical constant A of the Slack model using the formula for improved thermal conductivity predictions.

---

## References
- [1] R. Golesorkhtabar, P. Pavone, J. Spitaler, P. Puschnig, and C. Draxl, ElaStic: A tool for calculating second-order elastic constants from first principles, Comp. Phys. Commun. 184, 1861 (2013).: https://exciting-code.org/elastic/
- [2] excitingscripts: https://github.com/sr76/excitingscripts/
- [3] excitingscripts 1.0.0: https://pypi.org/project/excitingscripts/
- [4] Elastic1.0-wien2k: https://github.com/jazairdz/Elastic1.0-wien2k
- [5] WT16: https://rashid-phy.github.io/me/wien2k.html
- [6] https://www.youtube.com/@phy22: https://www.youtube.com/hashtag/physicsschool20
- [7] exciting-neon.21/tools/tutorial_scripts: http://exciting.wikidot.com/neon-how-to-calculate-stress-tensor

---

## Test
- OS: Ubuntu 22.04 LTS (WLS2, Windows 11)
- Python: 3.10.12
- Numpy: 1.21.5
- Matplotlib: 3.5.1
- QE: 6.3 or Later
- lxml: 4.8.0
- exciting: neon-21
- WIEN2k: ver.16
- gfortran: gcc version 11.4.0 (Ubuntu 11.4.0-1ubuntu1~22.04)

## QE v6.8 Installation
1. sudo apt update
2. sudo apt -y install gfortran g++ build-essential make libopenblas-dev libopenmpi-dev libfftw3-dev
3. sudo apt -y install gnuplot ghostscript
3. wget https://github.com/QEF/q-e/archive/refs/tags/qe-6.8.tar.gz
4. tar xvf qe-6.8.tar.gz
5. cd q-e-qe-6.8
6. ./configure
7. make pwall
8. sudo make install

## Exciting neon-21 Installation
1. sudo apt update
2. sudo apt -y install gfortran g++ build-essential make libopenblas-dev libopenmpi-dev libfftw3-dev
3. sudo apt -y install gnuplot ghostscript
4. sudo apt -y install python3-all-dev graphviz xsltproc
5. sudo apt install hdf5-helpers libhdf5-dev libhdf5-openmpi-dev fftw3-dev
6. pip3 install lxml
7. cd $HOME
8. mkdir exciting.neon-21
9. cd exciting.neon-21
10. wget https://exciting-code.org/uploads/exciting/exciting.neon-21.tar.gz
11. tar xvf exciting.neon-21.tar.gz
12. cp build/platforms/make.inc.gfortran10+.hdf5.fftw3 build/make.inc
13. make mpi
14. echo 'export EXCITINGROOT="$HOME/exciting.neon-21"' >> ~/.bashrc
15. echo 'export PATH="$EXCITINGROOT/bin:$PATH"' >> ~/.bashrc
16. echo 'export PATH="$EXCITINGROOT/tools/tutorial_scripts:$PATH"' >> ~/.bashrc

## Exciting neon.0.1 Installation
1. sudo apt update
2. sudo apt -y install gfortran g++ build-essential make libopenblas-dev libopenmpi-dev libfftw3-dev
3. sudo apt -y install gnuplot ghostscript
4. sudo apt -y install python3-all-dev graphviz xsltproc
5. pip3 install lxml
6. cd $HOME
7. wget https://github.com/exciting/exciting/archive/refs/tags/neon.0.1.tar.gz
8. tar xvf neon.0.1.tar.gz
9. cd exciting-neon.0.1
10. cp build/platforms/make.inc.gfortran10+ build/make.inc
11. make mpi
12. echo 'export EXCITINGROOT="$HOME/exciting-neon.0.1"' >> ~/.bashrc
13. echo 'export PATH="$EXCITINGROOT/bin:$PATH"' >> ~/.bashrc
14. echo 'export PATH="$EXCITINGROOT/tools/tutorial_scripts:$PATH"' >> ~/.bashrc

## requirements.txt
```
pip freeze > requirements.txt
```

---
