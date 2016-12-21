# <p align="center">How Run?

```sh
# Install dependencies.
# Tested on Ubuntu 14.04. For other OSs, check out https://github.com/yagop/telegram-bot/wiki/Installation
sudo apt-get install libreadline-dev libconfig-dev libssl-dev lua5.2 liblua5.2-dev lua-socket lua-sec lua-expat libevent-dev make unzip git redis-server autoconf g++ libjansson-dev libpython-dev expat libexpat1-dev

# Let's install the Self-Bot.
cd $HOME
git clone https://github.com/Fox-Team/Self-Bot-V4
cd Self-Bot-V4

# Now Set Sudo Yours
Go to bot/self-bot.lua
Line [268] :
    sudo_users = {},
Add Telegram ID [[Not username]] ( For Get Your Telegram ID go to ThisBot > https://telegram.me/userinfobot )
And Save It

# Now Resume To run
cd ..
chmod +x launch.sh
./launch.sh install
./launch.sh # Phone Number # Telegram Code

```
