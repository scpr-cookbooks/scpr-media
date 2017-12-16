name             'scpr-media'
maintainer       'Southern California Public Radio'
maintainer_email 'erichardson@scpr.org'
license          'apache2'
description      'Installs/Configures scpr-media'
long_description 'Installs/Configures scpr-media'
version          '0.3.4'

depends "nfs"
depends "nginx_passenger"
depends "scpr-tools"
depends "nodejs", "= 2.4.0"
depends "scpr-ftp"
depends "lifeguard"
depends "scpr-logstash-forwarder"
depends "scpr-consul", "~> 0.1.25"
depends "consul-template"
depends "logrotate"
