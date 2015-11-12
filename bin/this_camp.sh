camp=$1
if [ ! "$camp" ]
then
    camp=${PWD#$HOME/}
fi
camp=${camp%%/*}
if [ "$camp" ]; then echo $camp; exit; fi
town=${camp%%/*}
if [ "$town" ]; then echo $town; exit; fi
exit

