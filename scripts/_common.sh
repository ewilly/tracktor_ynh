#!/bin/bash

#=================================================
# COMMON VARIABLES AND CUSTOM HELPERS
#=================================================

myynh_install() {
	pushd $install_dir
		ynh_hide_warnings ynh_exec_as_app npm install
		ynh_hide_warnings ynh_exec_as_app npm run build
	popd

	mkdir -p $data_dir/uploads
}

# Set permissions
myynh_set_permissions () {
	chown -R $app: "$install_dir"
	chmod u=rwx,g=rx,o= "$install_dir"
	chmod -R o-rwx "$install_dir"

	chown -R $app: "$data_dir"
	chmod u=rwx,g=rx,o= "$data_dir"
	chmod -R o-rwx "$data_dir"
}
