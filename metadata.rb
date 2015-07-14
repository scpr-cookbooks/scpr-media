name             'scpr-media'
maintainer       'Southern California Public Radio'
maintainer_email 'erichardson@scpr.org'
license          'apache2'
description      'Installs/Configures scpr-media'
long_description 'Installs/Configures scpr-media'
version          '0.1.3'

depends "nfs"
depends "nginx_passenger"
depends "scpr-tools"
depends "nodejs"
depends "scpr-ftp"