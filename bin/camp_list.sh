shopt -s extglob
if [ "$1" == 'all' ]
then
  camp_where='true'
elif [ "$1" == 'me' ]
then
  camp_where="username = '$USER'"
elif [ -n "$1" ]
then
  camp_where="username = '$1' OR camp_number::text = '$1'"
else
  camp=$($HOME/bin/this_camp.sh)
  camp=${camp#camp}
  if [ -n "$camp" ]
  then
    camp_where="camp_number = '$camp'"
  else
    camp_where="username = '$USER'"
  fi
fi
#echo $camp_where
psql camp camp -c "select camp_number, username, comment
from camps where $camp_where
order by camp_number"

