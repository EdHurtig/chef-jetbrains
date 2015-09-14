action :install do
  run_context.include_recipe 'java'

  name = new_resource.name.downcase

  product = new_resource.product || new_resource.name

  if new_resource.download_url
    url = new_resource.download_url
  else
    case product
    when 'RubyMine'
      url = "#{node['jetbrains']['download_base_url']}/ruby/#{product}-#{new_resource.version}.tar.gz"
    when 'PhpStorm'
      url = "#{node['jetbrains']['download_base_url']}/webide/#{product}-#{new_resource.version}.tar.gz"
    when 'ideaIU'
      url = "#{node['jetbrains']['download_base_url']}/idea/#{product}-#{new_resource.version}.tar.gz"
    when 'ideaIC'
      url = "#{node['jetbrains']['download_base_url']}/idea/#{product}-#{new_resource.version}.tar.gz"
    when 'clion'
      url = "#{node['jetbrains']['download_base_url']}/cpp/#{product}-#{new_resource.version}.tar.gz"
    when 'pycharm-community'
      url = "#{node['jetbrains']['download_base_url']}/python/#{product}-#{new_resource.version}.tar.gz"
    when 'pycharm-professional'
      url = "#{node['jetbrains']['download_base_url']}/python/#{product}-#{new_resource.version}.tar.gz"
    when 'WebStorm'
      url = "#{node['jetbrains']['download_base_url']}/webstorm/#{product}-#{new_resource.version}.tar.gz"
    when 'AppCode'
      url = "#{node['jetbrains']['download_base_url']}/objc/#{product}-#{new_resource.version}.tar.gz"
    else
      fail "#{product} is not a recognized Jetbrains product, please specify a download_url manually"
    end
  end

  ark name do
    url url
    version new_resource.version
    path "#{node['jetbrains']['install_base_folder']}/#{name}-#{new_resource.version}"
  end
end
