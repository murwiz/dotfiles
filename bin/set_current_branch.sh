#!bash
name=${1:-BRANCHNAME}
branch=$(/usr/bin/git rev-parse --abbrev-ref HEAD)
eval export $name=$branch
eval echo $name=\$$name
