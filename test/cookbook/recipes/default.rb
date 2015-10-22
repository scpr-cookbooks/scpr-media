# Install curl to make life easier
package "curl"

execute "install-banned-ip" do
  action :run
  command "curl -XPUT http://localhost:8500/v1/kv/#{node.scpr_media.consul_key}/1.2.3.4 -d 'Test Kitchen'"
end