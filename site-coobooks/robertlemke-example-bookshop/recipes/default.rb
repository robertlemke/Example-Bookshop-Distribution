#
# Cookbook Name:: robertlemke-example-bookshop
# Recipe:: default
# Author:: Robert Lemke <rl@robertlemke.com>
#

include_recipe "robertlemke-webserver"

typo3flow_app "bookshop" do
end
