# serverscripts
Script to perform usefull task on server

## htaccess_allowIp

Adds "Allow from " directive with ip to .htaccess file

.htacces has to contain "Deny from all" directive

Arguments: 
	htaccess 	- path to .htaccess file
	user 		- username to mark for override purpose
	ip			- ip to allow access
	
Example usage as remote script:
	e.g in .zsrhc or .bash_profile
		alias allowIP_project_name=" ssh user@server 'bash -s' < /path/to/script/allowIP.sh /var/www/share/default/htdocs/.htaccess"	
	
	command then (first argument is already in the alias):
		allowIP_project_name user ip
