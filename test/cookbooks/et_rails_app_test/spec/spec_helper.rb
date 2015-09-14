require 'chefspec'
require 'chefspec/berkshelf'

require_relative 'support/matchers'

RSpec.configure do |config|
  config.platform = 'ubuntu'
  config.version = '12.04'
end
