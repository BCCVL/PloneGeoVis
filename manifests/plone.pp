class plone {

  # Install Python 2.7.3
  exec { 'Install Python 2.7.3':
    command => 'rm -rf Python-2.7.3 && wget http://python.org/ftp/python/2.7.3/Python-2.7.3.tar.bz2 && tar xf Python-2.7.3.tar.bz2 && cd Python-2.7.3 && ./configure --prefix=/usr/local && make && make altinstall',
    cwd     => '/tmp',
    path    => '/usr/local/bin/:/usr/bin/:/bin/',
    unless  => 'which python2.7',
    timeout => 60 * 20,                        # Allow 20 mins to install
  }

  # Install Python 3.3.0
  exec { 'Install Python 3.3.0':
    command => 'rm -rf Python-3.3.0 && wget http://python.org/ftp/python/3.3.0/Python-3.3.0.tar.bz2 && tar xf Python-3.3.0.tar.bz2 && cd Python-3.3.0 && ./configure --prefix=/usr/local && make && make altinstall',
    cwd     => '/tmp',
    path    => '/usr/local/bin/:/usr/bin/:/bin/',
    unless  => 'which python3.3',
    timeout => 60 * 20,                        # Allow 20 mins to install
  }

  # Install Distribute for Python 2.7
  exec { 'Install Distribute for Python 2.7':
    command => 'rm -rf distribute-0.6.35 && wget http://pypi.python.org/packages/source/d/distribute/distribute-0.6.35.tar.gz && tar xf distribute-0.6.35.tar.gz && cd distribute-0.6.35 && python2.7 setup.py install',
    cwd     => '/tmp',
    path    => '/usr/local/bin/:/usr/bin/:/bin/',
    require => Exec['Install Python 2.7.3'],
    timeout => 60 * 10,                        # Allow 10 mins to install
    unless  => 'which easy_install-2.7',
  }

  # Install Distribute for Python 3.3
  exec { 'Install Distribute for Python 3.3':
    command => 'rm -rf distribute-0.6.35 && wget http://pypi.python.org/packages/source/d/distribute/distribute-0.6.35.tar.gz && tar xf distribute-0.6.35.tar.gz && cd distribute-0.6.35 && python3.3 setup.py install',
    cwd     => '/tmp',
    path    => '/usr/local/bin/:/usr/bin/:/bin/',
    require => Exec['Install Python 3.3.0'],
    timeout => 60 * 10,                        # Allow 10 mins to install
    unless  => 'which easy_install-3.3',
  }

}

include plone
