#set -x
camp=$($(dirname $0)/this_camp.sh)
[ "$camp" ] || exit
camp_home="$HOME/$camp"
filter=echo
if [ "$1" != '--full' ]
then
    filter="grep -v 'Use of uninitialized value'"
fi
today=$(date +%a)
files=

#camp_is_pgsql=$(test -e "$camp_home/pgsql")
#camp_is_mysql=$(test -e "$camp_home/mysql")

if [[ "$*" == *--deb* ]]
then
    files="$files $(ls $camp_home/interchange/var/log/debug.log $camp_home/catalogs/*/var/log/debug.log 2>/dev/null)"
fi
if [[ "$*" == *--err* ]]
then
    files="$files $(ls $camp_home/interchange/var/log/error.log $camp_home/catalogs/*/var/log/error.log 2>/dev/null)"
fi
if [ -e $camp_home/pgsql ]
then
    if [[ "$*" == *--pg* ]]
    then
        files="$files $(ls $camp_home/pgsql/tmp/pgstartup.log $camp_home/pgsql/tmp/postgresql-$today.log 2>/dev/null)"
    fi
elif [ -e $camp_home/mysql ]
then
    if [[ "$*" == *--my* ]]
    then
        files="$files $(ls $camp_home/mysql/tmp/mysql.log.query 2>/dev/null)"
    fi
fi

if [ -z "$files" ]
then
    [[ "$*" != *--no_int* ]] && files="$files $(ls $camp_home/interchange/var/log/*.log 2>/dev/null)"
    [[ "$*" != *--no_cat* ]] && files="$files $(ls $camp_home/catalogs/*/var/log/*.log 2>/dev/null)"
    [[ "$*" != *--no_ap* ]] && files="$files $(ls $camp_home/httpd/logs/error_log 2>/dev/null)"
    [[ "$*" == *--no_ord* ]] && files="${files/$HOME\/$camp\/catalogs\/*\/var\/log\/order.log/}"
fi

#echo $files
#exit

lines=$(tput lines)
cmd="tail -fq -n ${lines:-2} $files"
echo $cmd
$cmd
#exit
