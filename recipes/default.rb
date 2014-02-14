#
# Cookbook Name:: webmin
# Recipe:: default
#
# Copyright (C) 2014 YOUR_NAME
# 
# All rights reserved - Do Not Redistribute
#

# Install packages webmin depends on
package "perl" do
  action :install
end

package "libnet-ssleay-perl" do
  action :install
end

package "openssl" do
  action :install
end

package "libauthen-pam-perl" do
  action :install
end

package "libpam-runtime" do
  action :install
end

package "libio-pty-perl" do
  action :install
end

package "apt-show-versions" do
  action :install
end

# Add repositories for webmin
apt_repository "webmin1" do
  uri "http://download.webmin.com/download/repository"
  distribution "sarge"
  components ["contrib"]
  key "http://www.webmin.com/jcameron-key.asc"
  action :add
end

apt_repository "webmin2" do
  uri "http://webmin.mirror.somersettechsolutions.co.uk/repository"
  distribution "sarge"
  components ["contrib"]
  key "http://www.webmin.com/jcameron-key.asc"
  action :add
end

# Reload package list through 'apt-get update'
include_recipe "apt::default"

# Install webmin
package "webmin" do
  action :install
  options "--force-yes"
end