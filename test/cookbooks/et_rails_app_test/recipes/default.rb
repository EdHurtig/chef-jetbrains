sp_root = node['nginx']['socketproxy']['root']

package 'curl'
chef_gem 'unicorn'

node['nginx']['socketproxy']['apps'].each do |app, app_conf|
  app_root = File.join(sp_root, app, app_conf['subdir'])
  directory app_root do
    owner node['nginx']['socketproxy']['app_owner']
    mode 0755
    action :create
    recursive true
  end

  cookbook_file File.join(app_root, 'config.ru') do
    source 'test-config.ru'
    owner node['nginx']['socketproxy']['app_owner']
    mode 0644
  end

  execute "webrick_#{app}" do
    command '/opt/chef/embedded/bin/unicorn ' \
      "#{File.join(app_root, 'config.ru')} -p #{app_conf['socket']['port']} -D"
    not_if "netstat -nlpt | awk '{print $4}' | " \
      "grep '0\.0\.0\.0:#{app_conf['socket']['port']}'"
    action :run
  end
end
