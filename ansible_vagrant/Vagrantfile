# frozen_string_literal: true

Vagrant.configure('2') do |config|
  config.vm.define 'app' do |app|
    app.vm.box = 'centos/7'
    app.vm.hostname = 'grizzly'
    app.vm.network :private_network, ip: '192.168.33.40'
  end
  config.vm.provision 'ansible' do |ansible|
    ansible.playbook = 'ansible/site.yml'
    ansible.inventory_path = 'ansible/hosts'
    ansible.limit = 'grizzly-servers'
  end
end
