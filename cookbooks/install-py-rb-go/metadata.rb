name 'install-py-rb-go'
maintainer 'Yusuke Shimizu'
maintainer_email 'shimi.nekoze@gmail.com'
license 'All Rights Reserved'
description 'Installs/Configures python, ruby, and go'
long_description 'Installs/Configures python, ruby, and go'
version '0.1.0'
chef_version '>= 12.9.41' if respond_to?(:chef_version)
source_url 'https://github.com/Yusuke-Shimizu/install-py-rb-go-cookbook'
issues_url "#{source_url}/issues"
supports "macos"
supports "ubuntu"
license 'MIT'

# The `issues_url` points to the location where issues for this cookbook are
# tracked.  A `View Issues` link will be displayed on this cookbook's page when
# uploaded to a Supermarket.
#
# issues_url 'https://github.com/<insert_org_here>/install-py-rb-go/issues'

# The `source_url` points to the development repository for this cookbook.  A
# `View Source` link will be displayed on this cookbook's page when uploaded to
# a Supermarket.
#
# source_url 'https://github.com/<insert_org_here>/install-py-rb-go'
