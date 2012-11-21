Vagrant::Config.run do |config|
  config.vm.box = "lucid64"
  config.vm.box_url = "http://files.vagrantup.com/lucid64.box"

  # Forward the vm's port 80 to your 8080
  # config.vm.forward_port 80, 8080
  # config.vm.forward_port 443, 4433

  config.vm.network :hostonly, "10.11.12.2"

  config.vm.customize ["modifyvm", :id, "--memory", 768]

  config.vm.share_folder("www-data", "/vagrant", ".", :nfs => true)

  config.vm.provision :chef_solo do |chef|
    chef.cookbooks_path = ["Build/Chef/cookbooks", "Build/Chef/site-cookbooks"]

    chef.add_recipe "apt"
    chef.add_recipe "openssl"
    chef.add_recipe "apache2"
    chef.add_recipe "mysql"
    chef.add_recipe "mysql::server"
    chef.add_recipe "php"
    chef.add_recipe "php::module_apc"
    chef.add_recipe "php::module_curl"
    chef.add_recipe "php::module_mysql"
    chef.add_recipe "apache2::mod_php5"
    chef.add_recipe "apache2::mod_rewrite"
    chef.add_recipe "example-bookshop"

    chef.json = {
      :mysql => {
        :server_root_password => 'root',
        :bind_address => '127.0.0.1'
      }
    }

  end
end