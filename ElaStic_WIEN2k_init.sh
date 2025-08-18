#!/bin/bash
#
# AUTHOR:
# Rostam Golesorkhtabar 
# r.golesorkhtabar@gmail.com
# 
# DATE:
# Tue Jan 01 00:00:00 2013
#
# SYNTAX:
# ElaStic_WIEN2k_init
# 
# EXPLANATION:
# 
#__________________________________________________________________________________________________
#dpath=`pwd`
#dirnm=`basename $dpath`
#for dir_num in `ls -d *_??`; do
#    cd $dir_num
#    #******************
#    #x sgroup
#    #cp -f $dir_num.struct_sgroup $dir_num.struct
#    WIEN2k_init_lapw_silent -b -vxc 13  -ecut -10.0  -in1_rkmax 8.0  -in2_method GAUSS  -in2_gmax 14  -in2_smear 0.01  -mix 0.1  -kgen_numk 2500  -kgen_shift 0  -inM_method PORT  -inM_tolf 0.1
#    #cp -f ../$dirnm.in0 $dir_num.in0
#    #******************
#    cd ..
#done
#exit

# Set number of threads and CPUs
#export OMP_NUM_THREADS=1
NCPUs=$(($(nproc) / 2))
export OMP_NUM_THREADS=${NCPUs}

label=`ls -d Dst??`
for Dstn in $label ; do
    cd $Dstn
    Dstn_num_list=`ls -d ${Dstn}_??`
    for Dstn_num in $Dstn_num_list ; do
        cd $Dstn_num/
        cp -f $Dstn_num.xml input.xml
        echo
        echo '        +--------------------------------------+'
        echo '        | SCF calculation of "'${Dstn_num}'" starts |'
        echo '        +--------------------------------------+'
        init_lapw -b -red 5.0 -vxc 13 -ecut -6.0 -rkmax 7.0 -numk 1000 -kgen_shift 0
        time run_lapw -NI -i 200
        #time runsp_lapw -NI -i 200
        date
        cd ../
    done
    cd ../
done
