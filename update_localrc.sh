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
