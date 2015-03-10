require 'minitest/spec'

describe_recipe 'apache24::mod_auth_digest' do
  include MiniTest::Chef::Resources
  include MiniTest::Chef::Assertions

  before :all do
    @prefix = case node[:platform_family]
              when 'rhel'
                node[:apache][:dir]
              when "debian"
                ".."
              end
  end

  it 'enables mod_auth_digest' do
    link("#{node[:apache][:dir]}/mods-enabled/auth_digest.load").must_exist.with(
         :link_type, :symbolic).and(:to, "#{@prefix}/mods-available/auth_digest.load")
  end
end
