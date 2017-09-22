#!/bin/bash
# 
# Adds "Allow from " directive with ip to .htaccess file
# Written by Sebastian Schön
# www.schoenmedia.de
# 
# .htacces has to contain "Deny from all" directive
# 
# Arguments: 
# 	htaccess 	- path to .htaccess file
# 	user 		- username to mark for override purpose
# 	ip			- ip to allow access
#	
# Example usage as remote script:
# 	e.g in .zsrhc or .bash_profile
# 		alias allowIP_project_name=" ssh user@server 'bash -s' < /path/to/script/allowIP.sh /var/www/share/default/htdocs/.htaccess"	
#	
#	command then (first argument is already in the alias):
#		allowIP_project_name user ip
 	

htaccess="$1"
user="$2"
ip="$3"

date=$(date  +%Y-%m-%d)
mark="# $user"

allow_from=$(echo "Allow from" ${ip} ${mark} ${date})

if ! cat $htaccess | /bin/grep -q "$mark"; then
        mark="Deny from all"
        sed -i "/$mark/s/.*/$mark \n $allow_from/1" ${htaccess}

else
        sed -i "/$mark/s/.*/$allow_from/1" ${htaccess}
fi
