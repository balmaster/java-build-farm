# -*- coding: utf-8 -*-

import os, sys, site
sys.stdout = sys.stderr

site.addsitedir('${hosting_env_dir}')
sys.path.insert(0, '${hosting_site_dir}/env/${hosting_env_site_packages_dir}')
sys.path.insert(0, '${hosting_site_dir}/src')
os.environ['PATH'] = '%s:%s' % ('${hosting_usr_local_bin}', os.environ['PATH'])
os.environ['DJANGO_SETTINGS_MODULE'] = 'settings'
from django.core.handlers.wsgi import WSGIHandler
application = WSGIHandler()

