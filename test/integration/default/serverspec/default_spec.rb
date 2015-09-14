require 'spec_helper'

describe 'jetbrains::default' do
  # Serverspec examples can be found at
  # http://serverspec.org/resource_types.html
  it 'Installs all the jetbrains products' do
    %w(
      PhpStorm
      RubyMine
      ideaIU
      ideaIC
      pycharm-professional
      pycharm-community
      clion
      WebStorm
      AppCode
    ).each do |product|
      describe file("/usr/local/#{product.downcase}") do
        it { is_expected.to be_folder }
      end

      describe file("") do

      end
    end
  end
end
