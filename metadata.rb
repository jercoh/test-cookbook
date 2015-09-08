name             'test-cookbook'
maintainer       'YOUR_NAME'
maintainer_email 'YOUR_EMAIL'
license          'All rights reserved'
description      'Installs/Configures test-cookbook'
long_description 'Installs/Configures test-cookbook'
version          '0.1.0'

depends "nginx", "~> 2.6"
depends 'hostsfile'
depends 'mysql', '~> 6.1.0'
