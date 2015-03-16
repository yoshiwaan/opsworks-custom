include_recipe 'mod_php55'

package 'php-mysql' do
  package_name value_for_platform_family(
    'rhel' => 'php55-mysqlnd',
    'debian' => 'php5-mysql'
  )
end
