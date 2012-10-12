#
# Cookbook Name:: subrosa
# Recipe:: default
#
# Copyright 2012, Heavy Water Operations, LLC
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

include_recipe "java"
include_recipe "leiningen"
include_recipe "runit"

tarball = node['subrosa']['tarball']
path = node['subrosa']['path']

directory path do
  owner node['subrosa']['user']
  group node['subrosa']['group']
  recursive true
  mode 00755
end

remote_file tarball do
  source "https://github.com/danlarkin/subrosa/tarball/master"
  action :create_if_missing
end

execute "extract subrosa" do
  action :nothing
  subscribes :run, resources( :remote_file => tarball), :immediately
  command "tar xzvf #{tarball} --strip-components=1 -C #{path}"
end

execute "lein uberjar" do
  action :nothing
  subscribes :run, resources( :remote_file => tarball), :immediately
  cwd path
  environment ({'LEIN_ROOT' => 'true'})
end

config_file = ::File.join(path, 'etc', 'subrosa.clj')

directory ::File.dirname(config_file) do
  owner node['subrosa']['user']
  group node['subrosa']['group']
  recursive true
  mode 00755
end

template config_file do
  owner node['subrosa']['user']
  group node['subrosa']['group']
  mode 00644
end

runit_service "subrosa" do
  subscribes :restart, resources( :template => config_file )
end

