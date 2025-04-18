#!/bin/bash

name="matvey"
age=54
x=4
y=6

new=$(($x+$y))
new_age=$(($age-$new))
#echo "привет" $name "тебе"  $new_age


#echo $(($1 $2 $3))



# if [[ $new_age -gt 18 && $new_age -lt 12 ]]; then
# 		echo "ты большой"
# 	elif [[ $new_age -gt 18 ]]; then
# 		echo "ты пиздец большой"
# 	elif [[ $new_age -gt 60 ]]; then 
# 		echo "ты старче"
# fi



arr1=(343 f)
arr2=(2 33 34 556 65)



#echo ${arr1[@]}
#echo ${arr2[@]}
#echo ${!arr1[@]} # индексы масива выводит 
#echo ${#arr1[@]} #сумма индексов 



for i in "${arr1[@]}"; do
	echo $i
done



for (( i=0; i<10; i++ )); do
	echo $i
done

n=0
while [ $n -lt 5 ]; do
	echo $n
	n=$(($n+1))
done



my_scripts () {
	echo "все твои скрипты"
	cd /home/matvey/Documents/DevOps/scripts
	ls -l;
}

my_scripts



















