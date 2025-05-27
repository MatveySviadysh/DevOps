File=$1

>sorted_${File}
echo "имя файла:" sorted_${File}

echo "Колличество унникальных строк:">>sorted_${File}
cat $File  | uniq |wc -l >> sorted_${File}
cat sorted_${File}


echo "отсортированный файл:">>sorted_${File}
sort -n $File>>sorted_${File}
