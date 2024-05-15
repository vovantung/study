#!/bin/bash

sudo apt update -y

sudo apt install git -y

sudo apt install curl -y

dpkg -l "ibus-unikey"
if [ $? = '0' ]
then 
    printf "Ibus-unikey is installed\r\n"
elif [ $? = '1' ]
then
    sudo apt install ibus-unikey -y
fi

sudo apt remove mysql-server -y
sudo apt autoremove -y

sudo rm -rf /var/lib/mysql && rm -rf /var/log/mysqld.log && rm -rf /etc/my.cnf

sudo apt install mysql-server -y

sudo mysql_secure_installation --use-default

sudo mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY 'Phan@123'; FLUSH PRIVILEGES;"

echo "use mysql; CREATE USER 'vothingocuyen'@'localhost' IDENTIFIED WITH mysql_native_password BY 'Phan@123'; FLUSH PRIVILEGES;" > create_user_with_password.sql

sudo mysql < create_user_with_password.sql

sudo snap install mysql-workbench-community

wget -O - https://apt.corretto.aws/corretto.key | sudo gpg --dearmor -o /usr/share/keyrings/corretto-keyring.gpg && \
echo "deb [signed-by=/usr/share/keyrings/corretto-keyring.gpg] https://apt.corretto.aws stable main" | sudo tee /etc/apt/sources.list.d/corretto.list

sudo apt-get update;
sudo apt-get install -y java-22-amazon-corretto-jdk

sudo apt install maven -y

sudo snap install intellij-idea-community --classic

wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb

sudo apt install ./google-chrome-stable_current_amd64.deb

sudo apt-get install ripgrep
