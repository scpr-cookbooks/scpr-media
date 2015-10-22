require 'spec_helper'

describe 'scpr-media::default' do
  describe service("nginx") do
    it { should be_enabled }
    it { should be_running }
  end

  describe service("consul-template") do
    it { should be_enabled }
    it { should be_running }
  end

  # Podroller should be running
  describe service("podroller") do
    it { should be_enabled }
    it { should be_running }
  end

  describe process("Podroller") do
    it { should be_running }
    its(:user) { should eql "media" }
  end

  # this should be written via consul-template
  describe file("/etc/nginx/media_banned_ips.cfg") do
    it { should exist}
    its(:content) { should contain "deny 1.2.3.4;" }
  end
end