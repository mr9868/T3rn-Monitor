## T3rn executor Monitor server

installation step :
```
apt install screen bc jq curl -y;
git clone https://github.com/mr9868/T3rn-Monitor;
cd T3rn-Monitor;
nano config;
chmod +x t3rn.sh;
screen -S t3rn_monitor -d -m bash t3rn.sh
```
> [!IMPORTANT]
> * This is only works on bash linux system !
>
> * You must fill required variable on the config file !
>

