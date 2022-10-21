#!/bin/bash
filename="Userlist.csv"
while IFS=","" " read rec_column1 rec_column2 rec_column3 rec_column4 rec_column5
do
if [[ "$rec_column5" =~ .*Admin.* ]]
then
G="sudo"
else
echo "$rec_column5"
G="$rec_column2"
fi
sudo useradd -p $rec_column4 $rec_column2 --uid $rec_column1 --create-home --groups $G --shell /bin/false
sudo chown /etc/$rec_column2 && sudo chmod 700 /etc/$rec_column2
done < <(tail -n +2 $filename)
