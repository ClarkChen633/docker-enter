#!/bin/bash

echo "$('pwd')" > pjpwd
while read line
do
	HOMEPJ=$line
done < pjpwd
rm -rf pjpwd

rm -rf util-linux-2.29/
rm -f ~/.bashrc_docker

# wget https://www.kernel.org/pub/linux/utils/util-linux/v2.29/util-linux-2.29.tar.gz
tar -xzvf util-linux-2.29.tar.gz
cd util-linux-2.29/
#./configure --without-ncurses
./configure
make nsenter
sudo cp -f nsenter /usr/local/bin

cd $HOMEPJ
# wget -P ~ https://github.com/yeasy/docker_practice/raw/master/_local/.bashrc_docker
cp -f $HOMEPJ/.bashrc_docker ~/.bashrc_docker
echo "[ -f ~/.bashrc_docker ] && . ~/.bashrc_docker" >> ~/.bashrc
rm -rf util-linux-2.29/

