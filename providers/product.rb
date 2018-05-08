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
    when 'CLion'
      url = "#{node['jetbrains']['download_base_url']}/cpp/#{product}-#{new_resource.version}.tar.gz"
    when 'pycharm-community'
      url = "#{node['jetbrains']['download_base_url']}/python/#{product}-#{new_resource.version}.tar.gz"
    when 'pycharm-professional'
      url = "#{node['jetbrains']['download_base_url']}/python/#{product}-#{new_resource.version}.tar.gz"
    when 'WebStorm'
      url = "#{node['jetbrains']['download_base_url']}/webstorm/#{product}-#{new_resource.version}.tar.gz"
    when 'datagrip'
      url = "#{node['jetbrains']['download_base_url']}/datagrip/#{product}-#{new_resource.version}.tar.gz"
    when 'goland'
      url = "#{node['jetbrains']['download_base_url']}/go/#{product}-#{new_resource.version}.tar.gz"
    when 'Rider'
      url = "#{node['jetbrains']['download_base_url']}/rider/JetBrains.#{product}-#{new_resource.version}.tar.gz"
    else
      raise "#{product} is not a recognized Jetbrains product, please specify a download_url manually"
    end
  end

  ark name do
    url url
    version new_resource.version
    path "#{node['jetbrains']['install_base_folder']}/#{name}-#{new_resource.version}"
  end
end
