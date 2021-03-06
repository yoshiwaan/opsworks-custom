require 'minitest/spec'

describe_recipe 'apache24::mod_expires' do
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

  it 'enables mod_expires' do
    link("#{node[:apache][:dir]}/mods-enabled/expires.load").must_exist.with(
         :link_type, :symbolic).and(:to, "#{@prefix}/mods-available/expires.load")
  end
end
