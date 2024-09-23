#!/bin/bash

count=$1

i=1
for (( i=1; i<=count; i++ )); do
    rm -f "p$i.c"
    echo -e "/* Name: p$i.c\n * Author: Amrut Wali\n * Description: \n */\n\n#include <stdio.h>\n\nint main(void)\n{\n\treturn 0;\n}" > "p$i.c"
done
