# ElaStic

---

## Features
- Language: Python3 (Migrating from python2 to python3)
- External Tools:
  - SGROUP: Determine space group and symmetry operations (included in adon_v1_0.tar.gz)
  - DFT Code: Supports Exciting, WIEN2k, and Quantum ESPRESSO
- Output:
  - Second- and third-order elastic constants (ElaStic_2nd.out, ElaStic_3rd.out)
  - full second-order elastic tensors (elastic constants) for all crystal lattice types
  - third-order elastic constants for cubic, hexagonal, and rhombohedral crystals (energy mode only)
  - Generation of deformed structures, evaluation of energy and stress, and analysis using polynomial fitting

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
12. echo 'export PATH="$HOME/ElaStic:$PATH"' >> ~/.bashrc

---

## Usage
1. python3 $HOME/ElaStic/ElaStic_Setup
2. (run exciting, WIEN2k or QE) (QE: *.in -> *.out)
3. python3 $HOME/ElaStic/ElaStic_Analyze
4. (From the figures shown in ElaStic_2nd.in or ElaStic_3rd.in, specify the eta_max and Fit_order for a fit that is converging at a plateau and not too large in order.)
5. python3 $HOME/ElaStic/ElaStic_Result

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

---

## Test
- OS: Ubuntu 22.04 LTS (WLS2, Windows 11)
- Python: 3.10.12
- Numpy: 1.21.5
- Matplotlib: 3.5.1
- QE: 6.3 or Later

---
