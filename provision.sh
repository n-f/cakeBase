#!/bin/sh

yum -y install vim git zip unzip

#httpdインストール
yum -y install httpd

#confコピー
cp /vagrant/httpd_vagrant.conf /etc/httpd/conf.d/

#mariadbインストール
yum -y install mariadb mariadb-server

#epel,remi インストール
yum -y install epel-release
rpm -Uvh http://rpms.famillecollet.com/enterprise/remi-release-7.rpm

#phpと必要なモジュールをインストール
yum -y install --enablerepo=remi,epel,remi-php70 php php-intl php-mbstring php-pdo php-mysqlnd

#composerインストール
curl -sS https://getcomposer.org/installer | php
mv composer.phar /usr/local/bin/composer

#ライブラリインストール
cd /vagrant/src/app
yes | /usr/local/bin/composer install

#mariadb起動、自動起動設定
systemctl start mariadb
systemctl enable mariadb

#httpd起動、自動起動設定
systemctl start httpd
systemctl enable httpd
