#!/bin/bash

# css=$(find $1 ! -path "$1/node_modules/*" -name '*.css' -type f | wc -l)
# js=$(find $1 ! -path "$1/node_modules/*" -name '*.js' -type f | wc -l)
# jsx=$(find $1 ! -path "$1/node_modules/*" -name '*.jsx' -type f | wc -l)
# ts=$(find $1 ! -path "$1/node_modules/*" -name '*.ts' -type f | wc -l)
# tsx=$(find $1 ! -path "$1/node_modules/*" -name '*.tsx' -type f | wc -l)
# scss=$(find $1 ! -path "$1/node_modules/*" -name '*.scss' -type f | wc -l)
# html=$(find $1 ! -path "$1/node_modules/*" -name '*.html' -type f | wc -l)
#
# if [ "$css" -gt 0 ]; then
#     echo -e "CSS:\t\t\t$css"
# fi
# if [ "$js" -gt 0 ]; then
#     echo -e "JS:\t\t\t$js"
# fi
# if [ "$jsx" -gt 0 ]; then
#     echo -e "JSX:\t\t\t$jsx"
# fi
# if [ "$ts" -gt 0 ]; then
#     echo -e "TS:\t\t\t$ts"
# fi
# if [ "$tsx" -gt 0 ]; then
#     echo -e "TSX:\t\t\t$tsx"
# fi
# if [ "$scss" -gt 0 ]; then
#     echo -e "SCSS:\t\t\t$scss"
# fi
# if [ "$html" -gt 0 ]; then
#     echo -e "HTML:\t\t\t$html"
# fi
#
echo -e "\nFiletype\t\tNo. of files\t\tNo. of lines\n"

file_types=("css" "js" "jsx" "ts" "tsx" "scss" "html" "json")

output=""

for ext in "${file_types[@]}"; do
  count=$(find "$1" ! -path "$1/node_modules/*" -name "*.$ext" -type f | wc -l)
  lines=$(find "$1" ! -path "$1/node_modules/*" -name "*.$ext" -type f -exec wc -l {} + | awk '{total += $1} END {print total}')

  if [ "$count" -gt 0 ]; then
    output+="${ext^^}:\t\t\t$count files \t\t$lines lines\n"
  fi
done

echo -e "$output" | sort -r -k 4,4nr



