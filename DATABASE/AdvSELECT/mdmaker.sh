#!/bin/bash

file=Empresa.md
F_file=Empresa.pdf
db="dbempresanomina"

sql=$(ls . | grep ".sql$")
numsql=$(ls . | grep ".sql" | wc -l)


cat <<EOF > $file
---
title: "Empresa"
author: "ShikaTheRock!"

titlepage: true
titlepage-rule-height: 0
toc: true
toc-own-page: true
titlepage-text-color: #000000
lang: es
---

EOF


for op in $(echo $sql); do
    echo "# $op" >> $file
    echo "" >> $file
    echo "\`\`\`" >> $file
    echo "" >> $file
    cat $op >> $file
    echo "" >> $file
    echo "\`\`\`" >> $file
    echo "" >> $file
    cat $op | grep -q ^select
    if [ $? -eq 0 ]; then
        mariadb -u root --password="1984" $db < $HOME/ASIR1/ASIR1-Workspace/DATABASE/AdvSELECT/$op > $HOME/ASIR1/ASIR1-Workspace/DATABASE/AdvSELECT/$op.txt

        echo "## Resultados de $op" >> $file
        echo "" >> $file
        echo "\`\`\`" >> $file
        echo "" >> $file
        cat $op.txt >> $file
        echo "" >> $file
        echo "\`\`\`" >> $file
        echo "" >> $file
    fi

done


pandoc $file -o $F_file \
--pdf-engine=xelatex \
--listings \
-V listings-options="breaklines=true,columns=fullflexible,numbers=left" \
--template=eisvogel.latex