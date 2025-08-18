# Usage

## Step by step
1. ElaStic_Setup
2. (input your calculation conditions)
3. bash ElaStic_WIEN2k_init.sh
4. ElaStic_Analyze
5. ElaStic_Result
6. cat ElaStic_2nd.out

## Troubleshooting
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
```
