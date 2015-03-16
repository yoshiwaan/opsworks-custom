include_recipe 'mod_php55'

package 'php-pgsql' do
  package_name value_for_platform_family(
    'rhel' => 'php-pgsql',
    'debian' => 'php5-pgsql'
  )
end
