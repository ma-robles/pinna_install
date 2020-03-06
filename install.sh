rclocal0="/etc/rc.local"
id=$1
echo "generating... " $id
#rclocal0="rclocal.bak"
rclocal="rc.local_"$id
head $rclocal0 -n -1 > $rclocal
echo "touch /home/pi/startup.log" >> $rclocal
echo "date >> /home/pi/startup.log" >> $rclocal
echo 'cd /home/pi/p_code; python3 com.py "'$id'_" &' >> $rclocal
echo ' ' >> $rclocal
echo 'exit 0' >> $rclocal
cat $rclocal
cp $rclocal $rclocal0
rm $rclocal

cronfile="aire_cron.bak"
echo "# m h  dom mon dow   command" > $cronfile
echo "*/30 * * * * cd /home/pi/p_code/; python3 new_update_ftp.py 132.248.8.31 pembu p3mbu "$id" > /home/pi/ftp.log 2>&1" >> $cronfile
echo '* * * * * cd /home/pi/p_code/; sshpass -v -p"m4rR_cc405" scp minute.cca marr-cca@132.248.8.29:~/minute_'$id'.cca  > /home/pi/rt.log 2>&1' >> $cronfile
echo "15  */6 * * * cd /home/pi/p_code/; git pull > /home/pi/git.log 2>&1" >> $cronfile
echo '17 * * * * cd /home/pi/; sshpass -p"m4rR_cc405" scp *.log marr-cca@132.248.8.29:~/'$id >> $cronfile
cat $cronfile
crontab $cronfile
rm $cronfile
