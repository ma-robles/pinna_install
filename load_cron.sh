id=$1
cronfile="aire_cron.bak"
echo "# m h  dom mon dow   command" > $cronfile
echo "*/30 * * * * cd /home/pi/p_code/; python3 new_update_ftp.py 132.248.8.31 pembu p3mbu "$id" > /home/pi/ftp.log 2>&1" >> $cronfile
echo '* * * * * cd /home/pi/p_code/; sshpass -v -p"m4rR_cc405" scp minute.cca marr-cca@132.248.8.29:~/minute_'$id'.cca  > /home/pi/rt.log 2>&1' >> $cronfile
echo "15  */6 * * * cd /home/pi/p_code/; git reset --hard origin/master; git pull > /home/pi/git.log 2>&1" >> $cronfile
echo '17 * * * * cd /home/pi/; sshpass -p"m4rR_cc405" scp *.log marr-cca@132.248.8.29:~/'$id >> $cronfile
echo '55 * * * * sudo reboot' >> $cronfile
cat $cronfile
crontab $cronfile
rm $cronfile
