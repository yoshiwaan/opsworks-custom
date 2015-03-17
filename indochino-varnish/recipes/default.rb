#
# Cookbook Name:: indochino-varnish
# Recipe:: default
#
# Copyright (C) 2015 YOUR_NAME
#
# All rights reserved - Do Not Redistribute
#

# This is to pick up Amazon Linux as the platform_version is used as part of the varnish repo URL
if node['platform_version'] == '2014.09'
  Chef::Log.info('======MATCHED========')
  Chef::Log.info(node['platform_version'])
  Chef::Log.info(node['platform_version'].to_f)
  Chef::Log.info(node['platform_version'].to_i)
  node.override['platform_version'] = '6.0'
  Chef::Log.info(node.override['platform_version'])
else
  Chef::Log.info('======NOT MATCHED========')
  Chef::Log.info(node['platform_version'])
  Chef::Log.info(node['platform_version'].to_f)
  Chef::Log.info(node['platform_version'].to_i)
end

include_recipe 'varnish'
