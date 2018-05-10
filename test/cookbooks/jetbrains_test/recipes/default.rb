jetbrains_product 'toolbox' do
  version node['jetbrains']['toolbox']['version']
end

jetbrains_product 'PhpStorm' do
  version node.attribute?('jetbrains/phpstorm/version') ? node['jetbrains']['version'] : node['jetbrains']['phpstorm']['version']
end

jetbrains_product 'RubyMine' do
  version node.attribute?('jetbrains/rubymine/version') ? node['jetbrains']['version'] : node['jetbrains']['rubymine']['version']
end

# IntelliJ IDEA Ultimate
jetbrains_product 'ideaIU' do
  version node.attribute?('jetbrains/ideaiu/version')  ? node['jetbrains']['version'] : node['jetbrains']['ideaiu']['version']
end

# IntelliJ IDEA Community
jetbrains_product 'ideaIC' do
  version node.attribute?('jetbrains/ideaic/version')  ? node['jetbrains']['version'] : node['jetbrains']['ideaic']['version']
end

jetbrains_product 'pycharm-professional' do
  version node.attribute?('jetbrains/pycharm-professional/version') ? node['jetbrains']['version'] : node['jetbrains']['pycharm-professional']['version']
end

jetbrains_product 'pycharm-community' do
  version node.attribute?('jetbrains/pycharm-community/version') ? node['jetbrains']['version'] : node['jetbrains']['pycharm-community']['version']
end

jetbrains_product 'CLion' do
  version node.attribute?('jetbrains/clion/version') ? node['jetbrains']['version'] : node['jetbrains']['clion']['version']
end

jetbrains_product 'WebStorm' do
  version node.attribute?('jetbrains/webstorm/version')  ? node['jetbrains']['version'] : node['jetbrains']['webstorm']['version']
end

jetbrains_product 'datagrip' do
  version node.attribute?('jetbrains/datagrip/version')  ? node['jetbrains']['version'] : node['jetbrains']['datagrip']['version']
end

jetbrains_product 'goland' do
  version node.attribute?('jetbrains/goland/version') ? node['jetbrains']['version'] : node['jetbrains']['goland']['version']
end

jetbrains_product 'Rider' do
  version node['jetbrains']['rider']['version']
end
