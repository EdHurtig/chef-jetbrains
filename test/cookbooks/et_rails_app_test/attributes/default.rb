set['nginx']['default_site_enabled'] = false
set['nginx']['default']['modules'] = ['socketproxy']

if node['storage']['ephemeral_mounts']
  set['nginx']['log_dir'] = "#{node['storage']['ephemeral_mounts'].first}/nginx"
else
  set['nginx']['log_dir'] = '/mnt/var/log/nginx'
end

set['nginx']['socketproxy']['root'] = '/usr/share/evertrue'
set['nginx']['socketproxy']['app_owner'] = 'deploy'

set['nginx']['socketproxy']['logname'] = 'socketproxy'
