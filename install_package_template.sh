#!/bin/bash
pkg_name=""
update_arg=$1
update=0
if [ $update_arg ] && [ "-u" == $update_arg ]; then
	update=1
fi
echo "---   $pkg_name installation."
pkg_ok=$(dpkg-query -W --showformat='${Status}\n' $pkg_name|grep "install ok installed")
echo Checking for $pkg_name: $pkg_ok
if [ "" == "$pkg_ok" ] || [ $update == "1" ]; then
	echo "No $pkg_name. Setting up $pkg_name."
	cd /tmp
	wget -O - {}.key | apt-key add -
	echo "deb " >> /etc/apt/sources.list.d/{}.list
	aptitude update -y
	aptitude install $pkg_name

	rm {}.deb
	curl -O -J -L {}
	dpkg -i {}
	apt-get install -f -y
fi