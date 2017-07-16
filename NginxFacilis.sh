
#!/bin/bash 
apt-get update

#instalando servidor Nginx (servidor de alta performance)
apt-get install nginx

#permitir o tráfego na porta 80
ufw allow 'Nginx HTTP'

#instalando o MariaDB  (banco de dados mysql)
apt-get install mariadb-client mariadb-server

#instalando o PHP7 (suporte a liguagem php)
apt-get install php7.1-cli php7.1-fpm php7.1-mysql php7.1-curl php-memcached php7.1-dev php7.1-mcrypt php7.1-sqlite3 php7.1-mbstring


# instalando o HHVM
wget -O - http://dl.hhvm.com/conf/hhvm.gpg.key | apt-key add -
echo deb http://dl.hhvm.com/debian jessie main | tee /etc/apt/sources.list.d/hhvm.list
apt-get install hhvm
/usr/share/hhvm/install_fastcgi.sh
defaults hhvm update-rc.d
/usr/bin/update-alternatives --install /usr/bin/php php /usr/bin/hhvm 60


#instalando o phpMyAdmin (gerenciador de banco de dados)
apt-get install phpmyadmin


# RkHunter pacote que cuida da segurança do servidor
apt-get install rkhunter


#Jailkit
apt-get install build-essential autoconf automake1.9 libtool flex bison debhelper binutils-gold python
wget https://olivier.sessink.nl/jailkit/jailkit-2.19.tar.gz
tar xvfz jailkit-2.19.tar.gz
cd jailkit-2.19
dpkg -i jailkit_2.19-1_amd64.deb


# instalando o PureFtp (gerenciador de SSH)
apt-get install pure-ftpd-common pure-ftpd

# instalando pacote LetsEncrypt (para certificação digital)


#instalando o ISPConfig 3.1
wget --no-check-certificate -O installer.tgz "https://github.com/servisys/ispconfig_setup/tarball/master"
tar zxvf installer.tgz
cd *ispconfig*
bash install.sh


#instalando o composer
curl -sS https://getcomposer.org/installer | php
sudo mv composer.phar /usr/local/bin/composer
