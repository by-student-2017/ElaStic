# ElaStic

## Features
- Language: Python3
- External Tools:
  - SGROUP: Determine space group and symmetry operations (included in adon_v1_0.tar.gz)
  - DFT Code: Supports Exciting, WIEN2k, and Quantum ESPRESSO
- Output:
  - Second- and third-order elastic constants (ElaStic_2nd.out, ElaStic_3rd.out)
  - full second-order elastic tensors (elastic constants) for all crystal lattice types
  - third-order elastic constants for cubic, hexagonal, and rhombohedral crystals 
  - Generation of deformed structures, evaluation of energy and stress, and analysis using polynomial fitting

## Elastic Installation
1. sudo apt update
2. sudo apt -y install python3 python3-numpy python3-matplotlib
3. cd $HOME
4. git clone https://github.com/by-student-2017/ElaStic.git
5. cd ElaStic
6. tar xvf adon_v1_0.tar.gz
7. cd SpaceGroups
8. make
9. cd ..
10. cp SpaceGroups/sgroup ./sgroup
11. echo 'export PATH="$HOME/ElaStic:$PATH"' >> ~/.bashrc

## Usage
1. python3 $HOME/Elastic2020/ElaStic_Setup
2. (run exciting, WIEN2k or QE) (QE: *.in -> *.out)
3. python3 $HOME/Elastic2020/ElaStic_Analyze
4. (From the figures shown in ElaStic_2nd.in or ElaStic_3rd.in, specify the eta_max and Fit_order for a fit that is converging at a plateau and not too large in order.)
5. python3 $HOME/Elastic2020/ElaStic_Result

## Postprocessing
- ElaStic_xyz2XYZ: Transformation of tensors using coordinate transformation
- ElaStic_Analyze_B0: Analysis of strain dependence of bulk modulus B0 and its pressure derivative B0'

## References
- [1] R. Golesorkhtabar, P. Pavone, J. Spitaler, P. Puschnig, and C. Draxl, ElaStic: A tool for calculating second-order elastic constants from first principles, Comp. Phys. Commun. 184, 1861 (2013).: https://exciting-code.org/elastic/

## Test
- OS: Ubuntu 22.04 LTS (WLS2)
- Python: 3.10.12
- Numpy: 1.21.5
- Matplotlib: 3.5.1
