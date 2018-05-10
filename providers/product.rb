action :install do
  run_context.include_recipe 'java'

  name = new_resource.name.downcase

  product = new_resource.product || new_resource.name

  version = new_resource.version

  if new_resource.download_url
    url = new_resource.download_url
  else
    case product
    when 'RubyMine'
      url_dir = '/ruby/'
    when 'PhpStorm'
      url_dir = '/webide/'
    when 'ideaIU'
      url_dir = '/idea/'
    when 'ideaIC'
      url_dir = '/idea/'
    when 'CLion'
      url_dir = '/cpp/'
    when 'pycharm-community'
      url_dir = '/python/'
    when 'pycharm-professional'
      url_dir = '/python/'
    when 'WebStorm'
      url_dir = '/webstorm/'
    when 'datagrip'
      url_dir = '/datagrip/'
    when 'goland'
      url_dir = '/go/'
    when 'Rider'
      url_dir = '/rider/JetBrains.'
      product = product.capitalize
    else
      raise "#{product} is not a recognized Jetbrains product, please specify a download_url manually"
    end
    url = "#{node['jetbrains']['download_base_url']}#{url_dir}#{product}-#{version}.tar.gz"
  end

  ark name do
    url url
    version version
    path "#{node['jetbrains']['install_base_folder']}/#{name}-#{version}"
  end
end
