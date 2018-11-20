# # encoding: utf-8

# Inspec test for recipe install-py-rb-go::default

# The Inspec reference, with examples and extensive documentation, can be
# found at http://inspec.io/docs/reference/resources/

# Check command
RSpec.shared_context 'check_command' do
	its('stderr') { should eq '' }
	its('exit_status') { should eq 0 }
end

# ghq test
ghq_root_path = "#{os_env('HOME').content}/.ghq"
describe command("ghq --version") do
	its('stdout') { should match "ghq version 0.8.0" }
	include_context 'check_command'
end

# asdf
asdf_project_name = "asdf-vm/asdf"
describe command('ghq list') do
	its('stdout') { should match "#{asdf_project_name}" }
end

# asdf_path = "#{ghq_root_path}/github.com/#{asdf_project_name}"
# fish_path = "#{os_env('HOME').content}/.config/fish"
# describe command("fish -c \"source #{asdf_path}/asdf.fish \"") do
# 	its('stdout') { should match "" }
# 	include_context 'check_command'
# end
describe command(". /etc/profile.d/asdf.sh && asdf --version") do
	its('stdout') { should match "v0.6.1" }
	include_context 'check_command'
end
describe command(". /etc/profile.d/asdf.sh && asdf plugin-list") do
	its('stdout') { should match "python" }
	include_context 'check_command'
end
python_version = "3.6.7"
describe command(". /etc/profile.d/asdf.sh && asdf list python") do
	its('stdout') { should match "#{python_version}" }
	include_context 'check_command'
end
describe command(". /etc/profile.d/asdf.sh && python --version") do
	its('stderr') { should_not match "Python 2.7.10" }
	its('stderr') { should match "Python #{python_version}" }
	include_context 'check_command'
end
