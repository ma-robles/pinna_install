if [[ -n "$1" ]]; then
        sudo ./update_localrc.sh $1
        ./load_cron.sh $1
else
        echo "Error!"
fi
