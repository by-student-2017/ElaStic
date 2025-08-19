# Usage
- When I tried it with diamond Si, the results for the elastic tensor were a bit concerning compared to others, and the time required was about ten times longer than exciting. I don't recommend using WIEN2k because it's possible that my modifications are not working properly (although the use of OpenMP parallelization may also be a reason).
- This is for people who absolutely must stick with WIEN2k. Further improvements are difficult for me to make, so I'll leave it to future researchers.

## Step by step
1. ElaStic_Setup
2. (input your calculation conditions)
3. bash ElaStic_WIEN2k_init.sh
4. ElaStic_Analyze
5. ElaStic_Result
6. cat ElaStic_2nd.out

## Troubleshooting
- If the RMTs overlap, an error will be displayed. Therefore, you need to set a larger RMT reduction rate. Increase the number immediately after "-red" in "ElaStic_WIEN2k_init.sh" shown below (the example below shows changing from the initial "-red 5.0" to "-red 6.0"). It is better to increase the value as long as it does not overlap, but since adding distortion makes it difficult to predict, a slightly larger value may be fine.
```
WIEN2k_init_lapw_silent.csh -b -red 6.0 -vxc 13  -ecut -10.0  -in1_rkmax 8.0  -in2_method GAUSS  -in2_gmax 14  -in2_smear 0.01  -mix 0.1  -kgen_numk 2500  -kgen_shift 0  -inM_method PORT  -inM_tolf 0.1
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
