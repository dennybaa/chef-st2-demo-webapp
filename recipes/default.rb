#
# Cookbook Name:: demo-webapp
# Recipe:: default
#
# Copyright (C) 2015 Denis Baryshev (dennybaa@gmail.com)
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

user node['demo-webapp']['user'] do
  home     "/home/#{node['demo-webapp']['user']}"
  supports manage_home: true
  action   :create
end

git "/home/#{node['demo-webapp']['user']}/webapp" do
  repository node['demo-webapp']['git_repo']
  revision   node['demo-webapp']['git_rev']
  user       node['demo-webapp']['user']
  action   :checkout
end

template "/home/#{node['demo-webapp']['user']}/webapp/config.json" do
  variables config: node['demo-webapp']['config']
  action   :create
end


runit_service "webapp" do
  options({
      home: "/home/#{node['demo-webapp']['user']}/webapp",
      user: node['demo-webapp']['user']
    })
  action  [ :enable, :start ]
end
