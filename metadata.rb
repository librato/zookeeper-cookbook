maintainer       "Librato"
maintainer_email "mike@librato.com"
license          "Apache 2.0"
description      "Installs/Configures zookeeper"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          "0.0.6"

supports         "ubuntu"

depends          "java"
depends          "iptables"
depends          "runit"

recipe           "zookeeper::client", "Installs ZK client"
recipe           "zookeeper::server", "Installs ZK server"
