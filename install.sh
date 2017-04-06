#!/bin/bash
echo "deb http://cran.rstudio.com/bin/linux/ubuntu xenial/" >> /etc/apt/sources.list
gpg --keyserver keyserver.ubuntu.com --recv-key E084DAB9
gpg -a --export E084DAB9 | apt-key add -

locale-gen en_US.UTF-8 && update-locale && apt-get update -y && \
    apt-get install -y bzip2 make build-essential curl wget r-base nginx git

R -e "install.packages('shiny', repos='https://cran.rstudio.com/')"

apt-get install -y gdebi-core
wget https://download3.rstudio.org/ubuntu-12.04/x86_64/shiny-server-1.5.3.838-amd64.deb
yes | gdebi shiny-server-1.5.3.838-amd64.deb
