#
# Cookbook:: install-py-rb-go
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.
#
# Cookbook:: provision_mac
# Recipe:: asdf
#
# Copyright:: 2018, The Authors, All Rights Reserved.

# homebrew_package "ghq" do
# 	action :install
# end
# package "git" do
# 	action :install
# end
ghq_root_path = "#{ENV['HOME']}/.ghq"
asdf_project_name = "asdf-vm/asdf"
# asdf_path = "#{ENV['HOME']}/.ghq/github.com/#{asdf_project_name}"
asdf_path = "#{ENV['HOME']}/.asdf"
# install_command = "ghq get #{asdf_project_name}"
install_command = "git clone https://github.com/#{asdf_project_name}.git #{ENV['HOME']}/.asdf"
install_user = "root"

# bash "install_asdf" do
#   code <<-EOH
#     #{install_command}
#     EOH
#   not_if { ::File.exist?(asdf_path) }
# end

# bash "setup_asdf" do
#   code <<-EOH
# 	echo -e '\n. $HOME/.asdf/asdf.sh' >> #{ENV['HOME']}/.bash_profile
# 	echo -e '\n. $HOME/.asdf/completions/asdf.bash' >> #{ENV['HOME']}/.bash_profile
# 	source #{ENV['HOME']}/.bash_profile
#     EOH
#   not_if "which asdf"
# end
asdf_user_install "#{install_user}"

# file "#{fish_path}/config.fish" do
#   content "source #{asdf_path}/asdf.fish"
#   mode '0644'
#   owner 'y3-shimizu'
#   group 'staff'
# end

# completion_path = "completions/asdf.fish"
# link "#{asdf_path}/#{completion_path}" do
#   to "#{fish_path}/#{completion_path}"
# end

# bash "install_asdf_plugin_of_python" do
#   code <<-EOH
#     asdf plugin-add python
#     EOH
#   not_if 'asdf plugin-list | grep python'
# end
asdf_plugin 'python' do
  user "#{install_user}"
end

python_version = "3.6.7"
# bash "install_python" do
#   code <<-EOH
#     asdf install python #{python_version}
#     asdf global python #{python_version}
#     pip install pipenv
#     asdf reshim python
#     EOH
# end
asdf_package 'python' do
  user "#{install_user}"
  version "#{python_version}"
end
