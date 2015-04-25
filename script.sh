
#!/bin/bash

rm /Users/adrianaciccone/Documents/UChicago/2014-2015/Thesis/thesis/FlResults/*

for i in {1..10}
do
	echo "Beginning run # $i"
	python write.py $i
	pyomo solve pyomoSimpleMin.py --summary 
	pyomo solve pyomoSimpleMin.py --json --save-results FlResults/simpleResult_$i.json --summary | grep -A 2 "KhNonNeg\|KlNonNeg" | grep -v "Key" > FlResults/constraints_$i.txt
done

python simplePostProcess.py



#rm /Users/adrianaciccone/Documents/UChicago/2014-2015/Thesis/thesis/jsonResults/*

#for i in {1..2}
#do
#	echo "Beginning run # $i"
#	python write.py $i
#	pyomo solve pyomoSimpleMin.py --summary 
#	pyomo solve pyomoSimpleMin.py --json --save-results jsonResults/simpleResult_$i.json --summary | grep -A 2 "KhNonNeg\|KlNonNeg" | grep -v "Key" > jsonResults/constraints_$i.txt
#done

#python simplePostProcess.py