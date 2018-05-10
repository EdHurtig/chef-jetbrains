title 'jetbrains::default'
# 'Installs all the jetbrains products'
%w(
  toolbox
  PhpStorm
  RubyMine
  ideaIU
  ideaIC
  pycharm-professional
  pycharm-community
  clion
  WebStorm
  datagrip
  goland
  Rider
).each do |product|
  describe file("/usr/local/#{product.downcase}") do
    it { is_expected.to be_symlink }
  end
end
