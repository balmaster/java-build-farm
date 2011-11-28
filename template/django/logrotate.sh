${hosting_site_dir}/logs/*.log {
	weekly
	missingok
	rotate 4
	compress
	delaycompress
	notifempty
	create 640 root adm
	endscript
}
