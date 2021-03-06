#!/bin/bash
pkg_name="insync"
pkg_ok=""
echo "---   $pkg_name installation."
pkg_ok=$(dpkg-query -W --showformat='${Status}\n' $pkg_name|grep "install ok installed")
pkg_version=$(dpkg-query -W --showformat='${Version}\n' $pkg_name)
echo Checking for $pkg_name: $pkg_ok $pkg_version
if [ -z "$pkg_ok" ] || [ "" == "$pkg_ok" ]; then
	echo "No $pkg_name. Setting up $pkg_name."
	cd /tmp
	wget -qO - https://d2t3ff60b2tol4.cloudfront.net/services@insynchq.com.gpg.key \ | sudo apt-key add -
	rm /etc/apt/sources.list.d/insync.list
	echo 'deb http://apt.insynchq.com/mint sarah non-free contrib' >> /etc/apt/sources.list.d/insync.list
	aptitude update -y
	aptitude install $pkg_name -y
fi
