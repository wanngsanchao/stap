#!/bin/bash

install(){
	tar -zxvf systap_rpms.tar.gz && yum -y localinstall ./systap_rpms/*.rpm
	if [ $? -ne 0 ];then
		echo -e "\033[1;31mrpm install failed\033[0m\n"
		exit
	elif ln -s /usr/src/kernels/3.10.0-514.el7.x86_64 /usr/src/kernels/3.10.0-x86_64;then
		rm -rf systap_rpms.tar
		echo -e "\033[4;31mrpms install successfully and please \"./mgt.sh -t\"\033[0m\n"
	fi	
}

uninstall(){
	for i in `cat ./systap_rpms1/rpms`
	do
		yum -y remove $i
	done

	rm -rf /usr/src/kernels/3.10.0-x86_64 
	rm -rf systap_rpms

	if [ $? -ne 0 ];then
		echo -e "\033[4;31mrpms uninstall unsuccessfully\033[0m\n"
	fi
}

systap_test(){
	stap -ve 'probe begin {printf("hello systap\n");exit()}'
}

usage(){

cat << EOF
usage:
./mgt -i => "install systap rpms"
./mgt -u => "uninstall systap rpms"
./mgt -t => "stap -ve 'probe begin {printf("hello systap\n");exit()}'"
EOF
}

case $1 in
	-i)
		install
		;;
	-u)
		uninstall
		;;
	-t)
		systap_test
		;;
	*)
		usage
		;;
esac

