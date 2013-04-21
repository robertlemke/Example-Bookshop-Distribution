Vagrant::Config.run do |config|
	config.vm.box = "quantal64-rl"
	config.vm.box_url = "http://dl.dropbox.com/u/1418806/vagrant-ubuntu-quantal64-rl.box"

	config.vm.network :hostonly, "33.33.33.10"
	config.vm.forward_port 80, 8080

	config.vm.customize [
		"modifyvm", :id,
		"--name", "example bookshop",
		"--cpus", "4",
		"--memory", "2048"
	]
	config.vm.customize ["setextradata", :id, "VBoxInternal2/SharedFoldersEnableSymlinksCreate/web", "1"]

	config.ssh.forward_agent = true

	config.vm.provision :chef_solo do |chef|
	chef.cookbooks_path = ["Build/Chef/cookbooks", "Build/Chef/site-cookbooks"]

	chef.add_recipe "robertlemke-webserver"
	chef.add_recipe "robertlemke-bookshop"

	chef.json = {
		mysql: {
			server_root_password: "password",
			server_repl_password: "password",
			server_debian_password: "password",
			bind_address: '127.0.0.1'
		},
		apache: {
		  default_site_enabled: true
		}
	}

	end

end
