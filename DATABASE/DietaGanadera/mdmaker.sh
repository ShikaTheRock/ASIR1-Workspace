#!/bin/bash

file=DietaGanadera.md
F_file=DietaGanadera.pdf
sql=$(ls . | grep ".sql")
numsql=$(ls . | grep ".sql" | wc -l)


for op in $(echo $sql); do
    echo "# $op" >> $file
    echo "" >> $file
    echo "\`\`\`sql" >> $file
    cat $op >> $file
    echo "" >> $file
    echo "\`\`\`" >> $file
    echo "" >> $file

    nonSql=$(echo $op | awk -F "." '{print $1}')
    echo "" >> $file
    echo "## DESC $nonSql" >> $file
    echo "" >> $file
        echo "\`\`\`" >> $file
    cat $nonSql >> $file
    echo "" >> $file
        echo "\`\`\`" >> $file
    echo "" >> $file

done

echo "" >> $file
echo "# Diagrama" >> $file
echo "" >> $file
echo "![Diagrama Foto](1.png)" >> $file
echo "" >> $file


pandoc $file -o $F_file --template=eisvogel.latex