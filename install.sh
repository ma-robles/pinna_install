rclocal0="/etc/rc.local"
echo "generating... " $1
#rclocal0="rclocal.bak"
rclocal="rc.local_"$1
head $rclocal0 -n -1 > $rclocal
echo "touch /home/pi/startup.log" >> $rclocal
echo "date >> /home/pi/startup.log" >> $rclocal
echo 'cd /home/pi/p_code; python3 com.py "'$1'_" &' >> $rclocal
echo ' ' >> $rclocal
echo 'exit 0' >> $rclocal
cp $rclocal $rclocal0
rm $rclocal

cronfile="aire_cron.bak"
echo "# m h  dom mon dow   command" > $cronfile
echo "*/30 * * * * cd /home/pi/p_code/; python3 new_update_ftp.py 132.248.8.31 pembu p3mbu " $1 " > /home/pi/ftp.log 2>&1" >> $cronfile
echo '* * * * * cd /home/pi/p_code/; sshpass -v -p"m4rR_cc405" scp minute.cca marr-cca@132.248.8.29:~/minute_'$1'.cca  > /home/pi/rt.log 2>&1' >> $cronfile
echo "15  */6 * * * cd /home/pi/p_code/; git pull > /home/pi/git.log 2>&1" >> $cronfile
echo '17 * * * * cd /home/pi/; sshpass -p"m4rR_cc405" scp *.log marr-cca@132.248.8.29:~/'$1 >> $cronfile
crontab $cronfile
rm $cronfile
