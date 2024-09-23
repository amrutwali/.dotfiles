find $1 -name 'node_modules' ! -wholename '*\.*' -type d |
    xargs du -sh |
    sort -hr 
