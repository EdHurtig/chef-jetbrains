require 'chefspec'

describe 'jetbrains::default' do
  context 'When all attributes are default, on an unspecified platform' do
    let(:chef_run) do
      ChefSpec::ServerRunner.new(step_into: ['jetbrains']) do |node|
        node.default['jetbrains']['product'] = 'PhpStorm'
      end.converge(described_recipe)
    end
    before do
      allow_any_instance_of(Chef::Recipe).to receive(:include_recipe).and_call_original
      allow_any_instance_of(Chef::Recipe).to receive(:include_recipe).with('ark')
    end
    it 'installs package successfully' do
      expect(chef_run).to install_package('PhpStorm') # This should not raise an error
    end
  end
end
