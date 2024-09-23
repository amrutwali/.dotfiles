find ~/ -name 'node_modules' ! -wholename '*\.*' -type d |
    xargs du -sh |
    sort -hr |
    fzf -m --header "Select the ones to delete" --preview 'cat $(dirname {})/package.json' |
    awk '{print $2}' |
    # xargs -r rm -rf 
    xargs -r | 
    sed 's/ /\n/g' 
