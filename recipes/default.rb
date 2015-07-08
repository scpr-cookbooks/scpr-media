#
# Cookbook Name:: scpr-media
# Recipe:: default
#
# Copyright 2015 Southern California Public Radio
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# -- Create our user and base directory -- #

user "media" do
  action  :create
  home    "/scpr/media"
  system  true
end

directory "/scpr/media" do
  action    :create
  owner     "media"
  recursive true
  mode      0755
end

["public","tmp"].each do |d|
  directory "/scpr/media/#{d}" do
    action  :create
    owner   "media"
    mode    0755
  end
end

# -- Mount the media NFS -- #

scpr_tools_media_mount "/scpr/media/media" do
  action        :create
  remote_path   "/volume1/media"
end

# -- Install Podroller -- #

include_recipe "nodejs"

file "podroller-restart" do
  action  :nothing
  path    "/scpr/media/tmp/restart.txt"
  owner   "media"
end

nodejs_npm "podroller" do
  action    :install
  version   node.scpr_media.podroller.version
  path      "/scpr/media"
  user      "media"
  notifies  :touch, "file[podroller-restart]"
end

# -- Write our config file -- #

template "/scpr/media/config.json" do
  action    :create
  owner     "media"
  mode      0644
  variables({
    config:node.scpr_media.podroller.config
  })
  notifies  :touch, "file[podroller-restart]"
end

# -- Write our app.js -- #

template "/scpr/media/app.js" do
  action    :create
  owner     "media"
  mode      0755
  variables({
    config_file:"/scpr/media/config.json",
  })
  notifies  :touch, "file[podroller-restart]"
end

# -- Install NGINX -- #

include_recipe "nginx_passenger"

# -- Set up media vhost -- #

# write our logging format
cookbook_file "/etc/nginx/conf.d/combined_timing_range.conf" do
  action :create
end

nginx_passenger_site "media" do
  action    :create
  dir       "/scpr/media"
  server    node.scpr_media.server
  template  "media.site.conf.erb"
end

# -- Set up an FTP server -- #

include_recipe "scpr_ftp"