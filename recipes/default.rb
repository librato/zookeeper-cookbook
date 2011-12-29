#
# Cookbook Name:: zookeeper
# Recipe:: default
#
# Copyright 2010, Infochimps, Inc.
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
#

include_recipe "zookeeper::iptables"

group_name = node[:zookeeper][:group]
user_name = node[:zookeeper][:user]

group group_name do
  action [:create]
end

user user_name do
  comment    'Zookeeper Daemon User'
  group      group_name
  home       node[:zookeeper][:data_dir]
  shell      "/bin/false"
  password   nil
  supports   :manage_home => false
  action     [:create]
end

package "zookeeper"

#
# Configuration files

directory node[:zookeeper][:data_dir] do
  owner      user_name
  group      group_name
  mode       "0755"
  action     :create
  recursive  true
end

directory node[:zookeeper][:log_dir] do
  owner      user_name
  group      group_name
  mode       "0755"
  action     :create
  recursive  true
end

#
template_variables = {
  :servers           => node[:zookeeper][:servers],
  :myid              => node[:zookeeper][:myid],
  :data_dir          => node[:zookeeper][:data_dir],
  :tick_time         => node[:zookeeper][:tick_time],
  :init_limit        => node[:zookeeper][:init_limit],
  :sync_limit        => node[:zookeeper][:sync_limit],
  :client_port       => node[:zookeeper][:client_port],
  :quorum_port       => node[:zookeeper][:quorum_port],
  :leader_elect_port => node[:zookeeper][:leader_elect_port],
  :max_client_conns  => node[:zookeeper][:max_client_connections],
}

%w[ zoo.cfg log4j.properties].each do |conf_file|
  template "#{node[:zookeeper][:conf_dir]}/#{conf_file}" do
    owner "root"
    mode "0644"
    variables(template_variables)
    source "#{conf_file}.erb"
    #notifies :restart, resources(:service => "zookeeper")
  end
end

template "#{template_variables[:data_dir]}/myid" do
 owner user_name
 mode "0644"
 variables(template_variables)
 source "myid.erb"
end

