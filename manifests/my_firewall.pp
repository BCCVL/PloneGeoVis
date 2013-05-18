class my_firewall {

  include firewall

  resources { "firewall":
    purge => true
  }

  Firewall {
    require => undef,
  }

  # Default firewall rules

  firewall { '000 accept all icmp':
    proto   => 'icmp',
    action  => 'accept',
  }

  firewall { '001 accept all to lo interface':
    proto   => 'all',
    iniface => 'lo',
    action  => 'accept',
  }

  firewall { '002 accept related established rules':
    proto   => 'all',
    state   => ['RELATED', 'ESTABLISHED'],
    action  => 'accept',
  }

  # Our custom rules

  firewall { '100 allow ssh':
    state => ['NEW'],
    dport => '22',
    proto => 'tcp',
    jump  => 'ACCEPT',
  }

  firewall { '101 allow plone':
    state => ['NEW'],
    dport => '8080',
    proto => 'tcp',
    jump  => 'ACCEPT',
  }
                                          }
  # Block everything else

  firewall { '999 drop all':
    proto   => 'all',
    action  => 'drop',
    before  => undef,
  }

}
