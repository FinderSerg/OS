#!/bin/bash

cp ../2/build/main .
cp ../2/build/main2 .

#2

R=10
N1=44
N2=45
r1=8
r2=10
a1=7
a2=9
a3=3
a4=4
t1=-7
t2=-6

root=$(pwd)
tree=()
#4

for (( i=1; i<=${R}; i++ ))
do  
   mkdir ${i}
   cd ${i}
   tree[i]=$(pwd)
done 

#5

cd ${tree[${r1}]}
mkdir files2/
${root}/main ${N1} 5 $(pwd) 1 ${root}

#6

cd ${tree[${r2}]} 
mkdir files1/
${root}/main ${N2} 5 $(pwd) 2 ${root}

#7

cd ${tree[${r1}]}
tar -cf 7.tar.gz files2
mv 7.tar.gz ${tree[${a1}]}

#8

cd ${tree[${r2}]}
tar -cf 8.tar.gz files1
mv 8.tar.gz ${tree[${a2}]}

#9

array=$(ls ${tree[${r1}]})
IFS=$'\n' sorted=($(sort <<<"${array[*]}"))
unset IFS
printf "%s\n" "${sorted[@]}" > ${tree[${r1} + ${t1}]}/sort_res9.txt

#10

array=$(ls ${tree[${r2}]})
IFS=$'\n' sorted=($(sort <<<"${array[*]}"))
unset IFS
printf "%s\n" "${sorted[@]}" > ${tree[${r2} + ${t2}]}/sort_res10.txt

#11
cd ${tree[${a1}]}
cp ${tree[${r1} + ${t1}]}/sort_res9.txt .
tar -rf 7.tar.gz sort_res9.txt
rm sort_res9.txt

#12
cd ${tree[${a2}]}
cp ${tree[${r2} + ${t2}]}/sort_res10.txt .
tar -rf 8.tar.gz sort_res10.txt
rm sort_res10.txt

#13
cd ${tree[${a1}]}
tar -xf 7.tar.gz -C ${tree[${a3}]}

#14
cd ${tree[${a2}]}
tar -xf ${tree[${a2}]}/8.tar.gz -C ${tree[${a4}]}