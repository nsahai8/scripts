#!/bin/bash

# Checking whether user has enough permission to run this script
sudo -n true
if [ $? -ne 0 ]
    then
        echo "This script requires user to have passwordless sudo access"
        exit
fi

#install wget.
sudo yum install wget -y

# Downloading rpm package of elasticsearch
sudo wget --directory-prefix=/opt/ https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-6.0.0-rc2.rpm

# Install rpm package of elasticsearch
sudo rpm -ivh /opt/elasticsearch-6.0.0-rc2.rpm

#start elasticsearch
sudo service elasticsearch start

# Downloading cassandra tar file and extracting the package
sudo wget http://apachemirror.wuchna.com/cassandra/3.11.4/apache-cassandra-3.11.4-bin.tar.gz 
tar -zxf apache-cassandra-3.11.4-bin.tar.gz

# starting cassandra
sh apache-cassandra-3.11.4/bin/cassandra
