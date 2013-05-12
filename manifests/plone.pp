class plone {

  package { "python-devel.x86_64":
    ensure => present,
  }

  package { "libjpeg-turbo-devel.x86_64":
    ensure => present,
  }

  package { "libxml2-devel.x86_64":
    ensure => present,
  }

  package { "libxslt-devel.x86_64":
    ensure => present,
  }

  # Install Python 2.7.3
  exec { 'Install Python 2.7.3':
    command => 'rm -f Python-2.7.3 && wget http://python.org/ftp/python/2.7.3/Python-2.7.3.tar.bz2 && tar xf Python-2.7.3.tar.bz2 && cd Python-2.7.3 && ./configure --prefix=/use/local && make && make altinstall',
    cwd     => '/tmp',
    path    => '/usr/local/bin/:/usr/bin/:/bin/',
    unless  => 'command -v python2.7 2>&1'
  }

  # Install Python 3.3.0
  exec { 'Install Python 3.3.0':
    command => 'rm -f Python-3.3.0 && wget http://python.org/ftp/python/3.3.0/Python-3.3.0.tar.bz2 && tar xf Python-3.3.0.tar.bz2 && cd Python-3.3.0 && ./configure --prefix=/usr/local && make && make altinstall',
    cwd     => '/tmp',
    path    => '/usr/local/bin/:/usr/bin/:/bin/',
    unless  => 'command -v python3.3 2>&1'
  }

  # Install Distribute for Python 2.7
  exec { 'Install Distribute for Python 2.7':
    command => 'rm -f distribute-0.6.35 && wget http://pypi.python.org/packages/source/d/distribute/distribute-0.6.35.tar.gz && tar xf distribute-0.6.35.tar.gz && cd distribute-0.6.35 && python2.7 setup.py install',
    cwd     => '/tmp',
    path    => '/usr/local/bin/:/usr/bin/:/bin/'
  }

  # Install Distribute for Python 3.3
  exec { 'Install Distribute for Python 3.3':
    command => 'rm -f distribute-0.6.35 && wget http://pypi.python.org/packages/source/d/distribute/distribute-0.6.35.tar.gz && tar xf distribute-0.6.35.tar.gz && cd distribute-0.6.35 && python3.3 setup.py install',
    cwd     => '/tmp',
    path    => '/usr/local/bin/:/usr/bin/:/bin/'
  }

}

include plone
