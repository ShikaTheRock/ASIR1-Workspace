#!/bin/bash

file=lab.md
F_file=lab.pdf
sql=$(ls -v | grep ".sql")
numsql=$(ls -v | grep ".sql" | wc -l)


for op in $(echo $sql); do
    echo "# $op" >> $file
    echo "" >> $file
    echo "\`\`\`sql" >> $file
    cat $op >> $file
    echo "" >> $file
    echo "\`\`\`" >> $file
    echo "" >> $file

    # nonSql=$(echo $op | awk -F "." '{print $1}')
    # echo "" >> $file
    # echo "## DESC $nonSql" >> $file
    # echo "" >> $file
    #     echo "\`\`\`" >> $file
    # cat $nonSql >> $file
    # echo "" >> $file
    #     echo "\`\`\`" >> $file
    # echo "" >> $file

done

# echo "" >> $file
# echo "# Diagrama" >> $file
# echo "" >> $file
# echo "![Diagrama Foto](1.png)" >> $file
# echo "" >> $file


pandoc $file -o $F_file --template=eisvogel.latex