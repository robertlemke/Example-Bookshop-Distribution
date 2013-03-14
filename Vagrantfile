Vagrant::Config.run do |config|
	config.vm.box = "quantal64-rl"
	config.vm.box_url = "http://dl.dropbox.com/u/1418806/vagrant-ubuntu-quantal64-rl.box"

	config.vm.network :hostonly, "33.33.33.10"

	config.vm.share_folder("application", "/var/www/bookshop/releases/vagrant", ".", :nfs => true)

	config.vm.customize [
		"modifyvm", :id,
		"--name", "Bookshop",
		"--cpus", "2",
		"--memory", "1024"
	]
	config.vm.customize ["setextradata", :id, "VBoxInternal2/SharedFoldersEnableSymlinksCreate/web", "1"]

	config.ssh.forward_agent = true

	config.vm.provision :chef_solo do |chef|
		chef.cookbooks_path = ["cookbooks", "site-cookbooks"]

		chef.add_recipe "robertlemke-example-bookshop"

		chef.json = {
			mysql: {
				server_root_password: "root",
				server_repl_password: "root",
				server_debian_password: "root",
				bind_address: '127.0.0.1'
			}
		}

	end

end
