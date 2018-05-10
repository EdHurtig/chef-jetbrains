year = '2018'
minor = '1'
patch = '2'
latest = '2018.1.3'
baseline = '2018.1.2'
default['jetbrains']['toolbox']['version'] = '1.8.3678'

default['jetbrains']['version'] = "#{year}.#{minor}.#{patch}"

default['jetbrains']['clion']['version']  = baseline
default['jetbrains']['datagrip']['version'] = baseline
default['jetbrains']['goland']['version'] = latest
default['jetbrains']['ideaic']['version'] = latest
default['jetbrains']['ideaiu']['version'] = latest
default['jetbrains']['phpstorm']['version'] = latest
default['jetbrains']['pycharm-community']['version'] = baseline
default['jetbrains']['pycharm-professional']['version'] = baseline
default['jetbrains']['rubymine']['version'] = baseline
default['jetbrains']['webstorm']['version'] = latest

default['jetbrains']['rider']['version'] = "#{year}.#{minor}"

default['java']['jdk_version'] = '8'
