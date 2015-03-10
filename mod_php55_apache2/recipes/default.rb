include_recipe 'apache24'

node[:mod_php55_apache24][:packages].each do |pkg|
  package pkg do
    action :install
    ignore_failure(pkg.to_s.match(/^php-pear-/) ? true : false) # some pear packages come from EPEL which is not always available
  end
end

node[:deploy].each do |application, deploy|
  if deploy[:application_type] != 'php'
    Chef::Log.debug("Skipping deploy::php application #{application} as it is not an PHP app")
    next
  end
  next if node[:deploy][application][:database].nil?

  case node[:deploy][application][:database][:type]
  when "postgresql"
    include_recipe 'mod_php55_apache24::postgresql_adapter'
  else # mysql or just backwards compatible
    include_recipe 'mod_php55_apache24::mysql_adapter'
  end
end

include_recipe 'apache24::mod_php5'
