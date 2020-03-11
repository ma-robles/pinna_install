if [[ -n "$1" ]]; then
        git clone https://github.com/ma-robles/p_code.git /home/pi/p_code
        ssh 132.248.8.29
        sudo apt install sshpass vim
        sudo ./update_localrc.sh $1
        ./load_cron.sh $1
else
        echo "Error!"
        cat README.md
fi
