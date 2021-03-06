#!/bin/bash
pkg_name="pencil"
pkg_ok=""
pkg_version=""
echo "---   $pkg_name installation."
pkg_ok=$(dpkg-query -W --showformat='${Status}\n' $pkg_name|grep "install ok installed")
pkg_version=$(dpkg-query -W --showformat='${Version}\n' $pkg_name)
echo Checking for $pkg_name: $pkg_ok $pkg_version
if [ -z "$pkg_ok" ] || [ -z "$pkg_version" ] || [ "" == "$pkg_ok" ] || [ "3.0.4-49" != "$pkg_version" ]; then
 	echo "No $pkg_name. Setting up $pkg_name."
	cd /tmp
	rm Pencil_3.0.4_amd64.deb
	curl -O -J -L http://pencil.evolus.vn/dl/V3.0.4/Pencil_3.0.4_amd64.deb
	dpkg -i Pencil_3.0.4_amd64.deb
	apt-get install -f -y
fi
