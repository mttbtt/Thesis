cd ~/conti/slits_density/results
rm *

cd ~/conti/slits_density/outputs_errors
rm *

cd ~/conti/slits_density



export SEED=1
export DENS=1
export LENGTH=1
export NSLITS=1

for SEED in {0..9}
do
DENS=$( echo "scale=3; 5*($SEED+1)/10" | bc )

NSLITS=9

LENGTH=$( echo "scale=3; ($NSLITS+1)*$SEED" | bc ) 


envsubst '${SEED},${DENS},${NSLITS}, ${LENGTH} ' < slits_density.txt > slits_density_${SEED}.txt
#envsubst '${DENS}' < "slits_density_${SEED}.txt" | sponge "slits_density_${SEED}.txt"   
#envsubst '${NSLITS}' < slits_density_${SEED}.txt > slits_density_${SEED}.txt
#envsubst '${LENGTH}' < slits_density_${SEED}.txt > slits_density_${SEED}.txt
envsubst '${SEED}' < density.sh > density_${SEED}.sh
qsub density_${SEED}.sh 
done

# for SEED in {10..19}
# do 
# NSLITS=$(($SEED-7))
# DENS=$(echo "scale = 3; 15" | bc)
# LENGTH=$(echo "scale=3; 0.5*$NSLITS*$DENS+0.3" | bc) 

# envsubst '${SEED},${DENS},${NSLITS},${LENGTH}' < slits_density.txt > slits_density_${SEED}.txt
# #envsubst '${NSLITS}' < slits_density_${SEED}.txt > slits_density_${SEED}.txt
# #envsubst '${DENS}' < slits_density_${SEED}.txt > slits_density_${SEED}.txt
# envsubst '${SEED}' < density.sh > density_${SEED}.sh
# qsub density_${SEED}.sh 
# done
