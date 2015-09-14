require 'spec_helper'

describe 'et_rails_app_test::default' do
  before do
    stub_command("netstat -nlpt | awk '{print $4}' | grep '0.0.0.0:9090'").and_return(false)
  end

  let(:chef_run) do
    ChefSpec::Runner.new do |node|
      node.set['nginx']['socketproxy']['apps'] = {
        'test-app' => {
          'subdir' => '',
          'socket' => {
            'port' => '9090'
          }
        }
      }
    end.converge(described_recipe)
  end

  it 'installs curl' do
    expect(chef_run).to install_package('curl')
  end

  it 'installs chef_gem unicorn' do
    expect(chef_run).to install_chef_gem('unicorn')
  end

  it 'creates /usr/share/evertrue/test-app/' do
    expect(chef_run).to create_directory('/usr/share/evertrue/test-app/').with(
      owner:     'deploy',
      mode:      0755,
      recursive: true
    )
  end

  it 'creates /usr/share/evertrue/test-app/config.ru' do
    expect(chef_run).to create_cookbook_file('/usr/share/evertrue/test-app/config.ru')
      .with(
        source: 'test-config.ru',
        owner:  'deploy',
        mode:   0644
      )
  end

  it 'starts a unicorn server' do
    expect(chef_run).to run_execute('webrick_test-app').with(
      command: '/opt/chef/embedded/bin/unicorn ' \
               '/usr/share/evertrue/test-app/config.ru -p 9090 -D'
    )
  end

  context 'with server already running' do
    before do
      stub_command("netstat -nlpt | awk '{print $4}' | grep '0.0.0.0:9090'").and_return(true)
    end

    it 'does not start a unicorn server' do
      expect(chef_run).to_not run_execute('webrick_test-app')
    end
  end
end
