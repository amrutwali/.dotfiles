ls -alF | grep "^-.*\(\w\*\)$" | awk '{print $NF}' | sed 's/\*//g' | fzf -m --header="Select executables to delete (tab to multi select)" --preview="ls -alF | grep '{}\*'" | xargs rm
