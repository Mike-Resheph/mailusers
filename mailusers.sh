#!/bin/bash
# By Resheph
# Usage ./mailusers.sh <userlist> <mailserver> > output.txt

for user in $(cat $1);
  do
# echo "vrfy $user" | nc -q 2 $2 25 | grep "^252 " | cut -f3 -d" " &
# echo "vrfy $user" | proxychains ncat $2 25 #| grep "^252 " | cut -f3 -d" " &
  echo "vrfy $user" | proxychains nc -n -w 5 $2 25 | grep "^252 " | cut -f3 -d" " &
# echo "vrfy $user" | nc -q 2 $2 25 #| grep "^252 " | cut -f3 -d" " &
# echo "vrfy $user" | ncat -nv $2 25 #| grep "^252 " | cut -f3 -d" " &
  done
