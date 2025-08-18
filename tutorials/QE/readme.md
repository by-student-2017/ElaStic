# Usage

## Easy method (energy and 2nd order)
1. bash run_qe_energy_2nd.sh

## Easy method (stress and 2nd order)
1. bash run_qe_energy_2nd.sh

## Step by step (energy and 2nd order)
1. ElaStic_Setup
2. (input your calculation conditions)
3. bash run_qe_energy.sh
4. ElaStic_exciting_analyze.py
   - or ElaStic_Analyze
5. ElaStic_Result
6. cat ElaStic_2nd.out

## Step by step (stress and 2nd order)
1. ElaStic_Setup
2. (input your calculation conditions)
3. bash run_qe_stress.sh
4. ElaStic_exciting_analyze.py
   - or ElaStic_Analyze
5. ElaStic_Result
6. cat ElaStic_2nd.out

## Results: Diamond Si (Energy and 2nd order)
```
ElaStic_2nd.out found in Energy-vs-Strain. Displaying contents:
    The output of ElaStic code
    Today is Mon Aug 18 16:05:36 2025

    Symmetry of the second-order elastic constant matrix in Voigt notation.
    for, space group-number between 207 and 230, Cubic I structure.

               C11     C12     C12      0       0       0
               C12     C11     C12      0       0       0
               C12     C12     C11      0       0       0
                0       0       0      C44      0       0
                0       0       0       0      C44      0
                0       0       0       0       0      C44

    Elastic constant (stiffness) matrix in GPa:

       180.9        43.5        43.5         0.0         0.0         0.0
        43.5       180.9        43.5         0.0         0.0         0.0
        43.5        43.5       180.9         0.0         0.0         0.0
         0.0         0.0         0.0        68.5         0.0         0.0
         0.0         0.0         0.0         0.0        68.5         0.0
         0.0         0.0         0.0         0.0         0.0        68.5


    Elastic compliance matrix in 1/GPa:

     0.00610    -0.00118    -0.00118     0.00000     0.00000     0.00000
    -0.00118     0.00610    -0.00118     0.00000     0.00000     0.00000
    -0.00118    -0.00118     0.00610     0.00000     0.00000     0.00000
     0.00000     0.00000     0.00000     0.01459     0.00000     0.00000
     0.00000     0.00000     0.00000     0.00000     0.01459     0.00000
     0.00000     0.00000     0.00000     0.00000     0.00000     0.01459

 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    Voigt bulk  modulus, B_V =    89.31  GPa
    Voigt shear modulus, G_V =    68.60  GPa

    Reuss bulk  modulus, B_R =    89.31  GPa
    Reuss shear modulus, G_R =    68.60  GPa

    Hill bulk  modulus,  B_H =    89.31  GPa
    Hill shear modulus,  G_H =    68.60  GPa

 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    Voigt Young modulus,  E_V =   163.84  GPa
    Voigt Poisson ratio, nu_V =     0.19

    Reuss Young modulus,  E_R =   163.84  GPa
    Reuss Poisson ratio, nu_R =     0.19

    Hill Young modulus,   E_H =   163.84  GPa
    Hill Poisson ratio,  nu_H =     0.19

 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    Elastic Anisotropy in polycrystalline, AVR =    0.000 %

 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    Eigenvalues of elastic constant (stiffness) matrix:

           137.4
           267.9
           137.4
            68.5
            68.5
            68.5

 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    Pughs modulus ratio, k=G/B (Voigt):    0.768
    Pughs modulus ratio, k=G/B (Reuss):    0.768
    Pughs modulus ratio, k=G/B (Hill) :    0.768

    Note:
    The Pughs modulus ratio k equals shear modulus divided by bulk modulus.
    It is used to estimate ductility and brittleness of materials.
    A value below 0.5 suggests ductile behavior, while above 0.5 indicates brittleness.
    This ratio is useful in mechanical design and failure prediction.
    It provides insight into bonding nature and structural integrity.

 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    Vickers hardnesses (Voigt) (Tian  model, 2012):   13.601 [GPa]
    Vickers hardnesses (Voigt) (Chen  model, 2011):   14.424 [GPa]
    Vickers hardnesses (Voigt) (Teter model, 1998):   10.358 [GPa]
    Vickers hardnesses (Reuss) (Tian  model, 2012):   13.601 [GPa]
    Vickers hardnesses (Reuss) (Chen  model, 2011):   14.424 [GPa]
    Vickers hardnesses (Reuss) (Teter model, 1998):   10.358 [GPa]
    Vickers hardnesses (Hill)  (Tian  model, 2012):   13.601 [GPa]
    Vickers hardnesses (Hill)  (Chen  model, 2011):   14.424 [GPa]
    Vickers hardnesses (Hill)  (Teter model, 1998):   10.358 [GPa]

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

    Universal Anisotropy Index:    0.000

    Note: Universal Elastic Anisotropy Index and Microstructural Effects
    Au measures overall elastic anisotropy in polycrystalline materials.
    Influences GP zone formation by controlling stress field directionality.
    Helps assess delamination risk and interfacial energy variation.
    Guides stacking orientation in composite design for stress optimization.
    Useful for predicting void formation in anisotropic stress environments.

 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    Zener Anisotropy Ratio:    0.998

    Note: Zener Ratio and Structural Behavior
    Zener ratio quantifies elastic anisotropy in cubic crystals.
    It helps predict crack propagation direction in anisotropic stress fields.
    Guides selection of slip systems for dislocation motion.
    Important for epitaxial growth where lattice matching affects stability.
    Also used to evaluate directional stress concentration at interfaces.

 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    Gruneisen constant (Voigt) (Slater approximation):    1.121
    Gruneisen constant (Reuss) (Slater approximation):    1.121
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
    vl/vt ratio:    1.623

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

## Results: Diamond Si (Stress and 2nd order)
```
ElaStic_2nd.out found in Stress-vs-Strain. Displaying contents:
    The output of ElaStic code
    Today is Mon Aug 18 15:58:25 2025

    Symmetry of the second-order elastic constant matrix in Voigt notation.
    for, space group-number between 207 and 230, Cubic I structure.

               C11     C12     C12      0       0       0
               C12     C11     C12      0       0       0
               C12     C12     C11      0       0       0
                0       0       0      C44      0       0
                0       0       0       0      C44      0
                0       0       0       0       0      C44

    Elastic constant (stiffness) matrix in GPa:

      165.2       43.7       43.7       -0.0       -0.0       -0.0
       43.7      165.2       43.7       -0.0       -0.0       -0.0
       43.7       43.7      165.2       -0.0       -0.0       -0.0
       -0.0       -0.0       -0.0       67.8       -0.0       -0.0
       -0.0       -0.0       -0.0       -0.0       67.8       -0.0
       -0.0       -0.0       -0.0       -0.0       -0.0       67.8


    Elastic compliance matrix in 1/GPa:

    0.00681    -0.00142    -0.00142     0.00000     0.00000     0.00000
   -0.00142     0.00681    -0.00142     0.00000     0.00000     0.00000
   -0.00142    -0.00142     0.00681     0.00000     0.00000     0.00000
    0.00000     0.00000     0.00000     0.01474     0.00000     0.00000
    0.00000     0.00000     0.00000     0.00000     0.01474     0.00000
    0.00000     0.00000     0.00000     0.00000     0.00000     0.01474

 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    Voigt bulk  modulus, B_V =    84.22  GPa
    Voigt shear modulus, G_V =    65.00  GPa

    Reuss bulk  modulus, B_R =    84.22  GPa
    Reuss shear modulus, G_R =    64.81  GPa

    Hill bulk  modulus,  B_H =    84.22  GPa
    Hill shear modulus,  G_H =    64.90  GPa

 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    Voigt Young modulus,  E_V =   155.10  GPa
    Voigt Poisson ratio, nu_V =     0.19

    Reuss Young modulus,  E_R =   154.74  GPa
    Reuss Poisson ratio, nu_R =     0.19

    Hill Young modulus,   E_H =   154.92  GPa
    Hill Poisson ratio,  nu_H =     0.19

 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    Elastic Anisotropy in polycrystalline, AVR =    0.146 %

 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    Eigenvalues of elastic constant (stiffness) matrix:

           121.5
           252.7
           121.5
            67.8
            67.8
            67.8

 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    Pughs modulus ratio, k=G/B (Voigt):    0.772
    Pughs modulus ratio, k=G/B (Reuss):    0.769
    Pughs modulus ratio, k=G/B (Hill) :    0.771

    Note:
    The Pughs modulus ratio k equals shear modulus divided by bulk modulus.
    It is used to estimate ductility and brittleness of materials.
    A value below 0.5 suggests ductile behavior, while above 0.5 indicates brittleness.
    This ratio is useful in mechanical design and failure prediction.
    It provides insight into bonding nature and structural integrity.

 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    Vickers hardnesses (Voigt) (Tian  model, 2012):   13.163 [GPa]
    Vickers hardnesses (Voigt) (Chen  model, 2011):   13.979 [GPa]
    Vickers hardnesses (Voigt) (Teter model, 1998):    9.815 [GPa]
    Vickers hardnesses (Reuss) (Tian  model, 2012):   13.093 [GPa]
    Vickers hardnesses (Reuss) (Chen  model, 2011):   13.892 [GPa]
    Vickers hardnesses (Reuss) (Teter model, 1998):    9.786 [GPa]
    Vickers hardnesses (Hill)  (Tian  model, 2012):   13.128 [GPa]
    Vickers hardnesses (Hill)  (Chen  model, 2011):   13.936 [GPa]
    Vickers hardnesses (Hill)  (Teter model, 1998):    9.800 [GPa]

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

    Universal Anisotropy Index:    0.015

    Note: Universal Elastic Anisotropy Index and Microstructural Effects
    Au measures overall elastic anisotropy in polycrystalline materials.
    Influences GP zone formation by controlling stress field directionality.
    Helps assess delamination risk and interfacial energy variation.
    Guides stacking orientation in composite design for stress optimization.
    Useful for predicting void formation in anisotropic stress environments.

 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    Zener Anisotropy Ratio:    1.117

    Note: Zener Ratio and Structural Behavior
    Zener ratio quantifies elastic anisotropy in cubic crystals.
    It helps predict crack propagation direction in anisotropic stress fields.
    Guides selection of slip systems for dislocation motion.
    Important for epitaxial growth where lattice matching affects stability.
    Also used to evaluate directional stress concentration at interfaces.

 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    Gruneisen constant (Voigt) (Slater approximation):    1.120
    Gruneisen constant (Reuss) (Slater approximation):    1.120
    Gruneisen constant (Hill)  (Slater approximation):    1.120

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
    vl/vt ratio:    1.622

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
