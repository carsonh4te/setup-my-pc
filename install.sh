#!/bin/bash

# general variables
_user=$(whoami)
_pwd=$(pwd)
_prefix="[setuphelper]"

# symbolic link for keep ref anywhere
echo "$_prefix Creating symbolic link 'setuphelper' on /usr/local/bin/ path..."
if [[ $_user != "root" ]]; then
	sudo rm /usr/local/bin/setuphelper # case already exist
	sudo ln -s $_pwd/bin/setuphelper.sh /usr/local/bin/setuphelper
else
	rm /usr/local/bin/setuphelper
	ln -s $_pwd/bin/setuphelper.sh /usr/local/bin/setuphelper
fi

# adding execution permission to the scripts in bin path
echo "$_prefix Adding execution permission to the scripts in $_pwd/bin path..."
chmod +x ./bin/*.sh

# setting up the user profile configs (to be persistent between users logins sessions)
echo "$_prefix Setting up the user profile configs (to be persistent between users logins sessions)..."
for _profiles in ~/.*rc; do
	echo -e "\n export SMPCPATH=$_pwd" >> $_profiles
done

export APPPATH=$_pwd