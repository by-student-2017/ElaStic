# Usage
- It never happened again. I don't recommend it.

## Step by step
1. ElaStic_Setup
2. (input your calculation conditions)
3. bash ElaStic_WIEN2k_init.sh
4. ElaStic_Analyze
5. ElaStic_Result
6. cat ElaStic_2nd.out

## Troubleshooting
- If the RMTs overlap, an error will be displayed. Therefore, you need to set a larger RMT reduction rate. Increase the number immediately after "-red" in "ElaStic_WIEN2k_init.sh" shown below (the example below shows changing from the initial "-red 7.0" to "-red 8.0"). It is better to increase the value as long as it does not overlap, but since adding distortion makes it difficult to predict, a slightly larger value may be fine.
```
WIEN2k_init_lapw_silent.csh -b -red 10.0 -vxc 13  -ecut -10.0  -in1_rkmax 8.0  -in2_method GAUSS  -in2_gmax 14  -in2_smear 0.01  -mix 0.1  -kgen_numk 2500  -kgen_shift 0  -inM_method PORT  -inM_tolf 0.1
```
- If it doesn't work, give it permission to run:
```
cd $HOME/ElaStic
chmod +x *
```
- Problems may occur if you are using Elastic2020 etc. at the same time. It is recommended to specify the absolute path and run it. An example is shown below.
```
python3 $HOME/ElaStic/ElaStic_Setup
# (input your calculation conditions)
bash $HOME/ElaStic/ElaStic_WIEN2k_init.sh
python3 $HOME/ElaStic/ElaStic_Analyze
python3 $HOME/ElaStic/ElaStic_Result
cat ElaStic_2nd.out
```

## Results: Diamond Si (Energy and 2nd order)
```
    The output of ElaStic code
    Today is Mon Aug 18 21:18:50 2025

    Symmetry of the second-order elastic constant matrix in Voigt notation.
    for, space group-number between 207 and 230, Cubic I structure.

               C11     C12     C12      0       0       0
               C12     C11     C12      0       0       0
               C12     C12     C11      0       0       0
                0       0       0      C44      0       0
                0       0       0       0      C44      0
                0       0       0       0       0      C44

    Elastic constant (stiffness) matrix in GPa:

       168.2        61.7        61.7         0.0         0.0         0.0
        61.7       168.2        61.7         0.0         0.0         0.0
        61.7        61.7       168.2         0.0         0.0         0.0
         0.0         0.0         0.0        92.9         0.0         0.0
         0.0         0.0         0.0         0.0        92.9         0.0
         0.0         0.0         0.0         0.0         0.0        92.9


    Elastic compliance matrix in 1/GPa:

     0.00740    -0.00199    -0.00199     0.00000     0.00000     0.00000
    -0.00199     0.00740    -0.00199     0.00000     0.00000     0.00000
    -0.00199    -0.00199     0.00740     0.00000     0.00000     0.00000
     0.00000     0.00000     0.00000     0.01077     0.00000     0.00000
     0.00000     0.00000     0.00000     0.00000     0.01077     0.00000
     0.00000     0.00000     0.00000     0.00000     0.00000     0.01077

 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    Voigt bulk  modulus, B_V =    97.22  GPa
    Voigt shear modulus, G_V =    77.02  GPa

    Reuss bulk  modulus, B_R =    97.22  GPa
    Reuss shear modulus, G_R =    71.56  GPa

    Hill bulk  modulus,  B_H =    97.22  GPa
    Hill shear modulus,  G_H =    74.29  GPa

 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    Voigt Young modulus,  E_V =   182.78  GPa
    Voigt Poisson ratio, nu_V =     0.19

    Reuss Young modulus,  E_R =   172.39  GPa
    Reuss Poisson ratio, nu_R =     0.20

    Hill Young modulus,   E_H =   177.62  GPa
    Hill Poisson ratio,  nu_H =     0.20

 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    Elastic Anisotropy in polycrystalline, AVR =    3.670 %

 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    Eigenvalues of elastic constant (stiffness) matrix:

           106.5
           291.7
           106.5
            92.9
            92.9
            92.9

 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    Pughs modulus ratio, k=G/B (Voigt):    0.792
    Pughs modulus ratio, k=G/B (Reuss):    0.736
    Pughs modulus ratio, k=G/B (Hill) :    0.764

    Note:
    The Pughs modulus ratio k equals shear modulus divided by bulk modulus.
    It is used to estimate ductility and brittleness of materials.
    A value below 0.5 suggests ductile behavior, while above 0.5 indicates brittleness.
    This ratio is useful in mechanical design and failure prediction.
    It provides insight into bonding nature and structural integrity.

 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    Vickers hardnesses (Voigt) (Tian  model, 2012):   15.291 [GPa]
    Vickers hardnesses (Voigt) (Chen  model, 2011):   16.333 [GPa]
    Vickers hardnesses (Voigt) (Teter model, 1998):   11.629 [GPa]
    Vickers hardnesses (Reuss) (Tian  model, 2012):   13.354 [GPa]
    Vickers hardnesses (Reuss) (Chen  model, 2011):   13.996 [GPa]
    Vickers hardnesses (Reuss) (Teter model, 1998):   10.806 [GPa]
    Vickers hardnesses (Hill)  (Tian  model, 2012):   14.308 [GPa]
    Vickers hardnesses (Hill)  (Chen  model, 2011):   15.148 [GPa]
    Vickers hardnesses (Hill)  (Teter model, 1998):   11.218 [GPa]

    Note (VASP case)
    Hill = Voigt-Reuss-Hill (VRH) Approximation (averages)
    For HvChen (= Vickers hardnesses (Chen  model, 2011))
    covalent and ionic crystals: Root Mean Square Error (RMSE) = 4.4
    covalent and ionic crystals: Mean Absolute Error (MAE)     = 2.1
    bulk metallic glasses:       Root Mean Square Error (RMSE) = 0.9
    bulk metallic glasses:       Mean Absolute Error (MAE)     = 0.8

    Note (Vickers Hardness and Structural Implications)
    Vickers hardness Hv estimates resistance to plastic deformation.
    It correlates with yield strength and fracture toughness.
    Useful for predicting wear resistance and indentation behavior.
    High Hv indicates strong atomic bonding and low ductility.
    Hv helps assess crack initiation and propagation under stress.
    Important for evaluating surface stability and coating durability.
    Guides material selection for cutting tools and structural components.
    Also used to estimate void formation resistance and microstructural integrity.

 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    Universal Anisotropy Index:    0.381

    Note: Universal Elastic Anisotropy Index and Microstructural Effects
    Au measures overall elastic anisotropy in polycrystalline materials.
    Influences GP zone formation by controlling stress field directionality.
    Helps assess delamination risk and interfacial energy variation.
    Guides stacking orientation in composite design for stress optimization.
    Useful for predicting void formation in anisotropic stress environments.

 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    Zener Anisotropy Ratio:    1.744

    Note: Zener Ratio and Structural Behavior
    Zener ratio quantifies elastic anisotropy in cubic crystals.
    It helps predict crack propagation direction in anisotropic stress fields.
    Guides selection of slip systems for dislocation motion.
    Important for epitaxial growth where lattice matching affects stability.
    Also used to evaluate directional stress concentration at interfaces.

 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    Gruneisen constant (Voigt) (Slater approximation):    1.115
    Gruneisen constant (Reuss) (Slater approximation):    1.129
    Gruneisen constant (Hill)  (Slater approximation):    1.121

    Note:
    The Gruneisen parameter gamma describes lattice anharmonicity.
    In the Slater approximation, gamma is estimated from bulk modulus B and shear modulus G.
    This method does not require phonon data and enables fast thermal property estimation.
    Gamma affects the following properties:
      - Thermal expansion coefficient: alpha = gamma * Cv / (B * V)
      - Heat capacity temperature dependence (Debye model correction)
      - Lattice thermal conductivity (via phonon-phonon scattering, e.g., Slack model)
      - Phonon lifetime and scattering rate (related to anharmonicity)
      - Pressure dependence of vibrational properties and equation of state
      - Melting point under pressure (Lindemann theory)
      - Temperature dependence of elastic constants
    Even as an approximation, gamma links mechanical stiffness to thermal behavior.

 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    vl = sound velocity (longitudinal wave) [m/s], vt = sound velocity (transverse waves) [m/s]
    vl/vt ratio:    1.625

    Note (Hill Average and Physical Property Relations)
    Hill average is the mean of Voigt and Reuss bounds for bulk and shear moduli.
    It provides stable input for property models derived from elastic constants.
    Used in Gruneisen parameter estimation via Slater approximation:
        gamma is calculated from bulk modulus B and shear modulus G.
    Used in hardness models:
        Hv is empirically modeled as a function of G and B in Tian, Chen, and Teter formulas.
    Used in ductility prediction: Pugh ratio k = G/B.
    Used in sound velocity estimation: vl = sqrt((B + 4/3 G)/rho), vt = sqrt(G/rho).
    vl/vt ratio relates to Poisson ratio and elastic anisotropy.
    These relations support thermal conductivity, EOS, and mechanical stability analysis.

 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


    ... Have a G00D Day, Week, Month, Year, and Century (if you are lucky) ...
               Bye-Bye! Tschuess! Ciao! Poka! Zia Jian! KhodaHafez!
```
