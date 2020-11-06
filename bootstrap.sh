#!/usr/bin/env bash

export DEBIAN_FRONTEND="noninteractive"

# update apt
sudo apt-get update
sudo apt-get DEBIAN_FRONTEND=noninteractive upgrade -y
sudo apt-get install -y unzip git apt-transport-https default-jre

java -version
echo "Java Home is"
echo $JAVA_HOME

# install the Elastic PGP Key and repo
wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch | sudo apt-key add -
echo "deb https://artifacts.elastic.co/packages/7.x/apt stable main" | sudo tee -a /etc/apt/sources.list.d/elastic-7.x.list

sudo apt-get update
echo "[*] Installing Elastic Search"
sudo apt-get install -y elasticsearch
echo "[+] Done Installing Elastic Search"


# copy over configs
cp /vagrant/configs/elasticsearch/elasticsearch.yml /etc/elasticsearch/
sudo /bin/systemctl daemon-reload
sudo /bin/systemctl enable elasticsearch.service
sudo /bin/systemctl start elasticsearch.service

# install Logstash
echo "[*] Installing Logstash"
sudo apt-get install -y logstash

# copy over configs
cp /vagrant/configs/logstash/logstash.yml /etc/logstash/
cp /vagrant/configs/logstash/pipelines.yml /etc/logstash/
sudo systemctl enable logstash.service
sudo systemctl start logstash.service
echo "[+] Done Installing Logstash"


# Install Kibana
echo "[*] Installing Kibana"
sudo apt-get install -y kibana

# copy over configs
cp /vagrant/configs/kibana/kibana.yml /etc/kibana/

sudo /bin/systemctl daemon-reload
sudo /bin/systemctl enable kibana.service
sudo systemctl start kibana.service
echo "[*] Done Installing Kibana"

# Smoke tests
netstat -pant
curl -XGET http://localhost:9200
