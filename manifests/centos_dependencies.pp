class centos_dependencies{

  # Install CentOS Dependencies

  # Group install Development Tools
  exec { 'yum groupinstall "Development Tools"':
    command => 'yum groupinstall -y "Development Tools"',
    path    => '/usr/local/bin/:/usr/bin/:/bin/',
    timeout => 0                                  # Disable the command timeout
  }

  package { "readline-devel":
    ensure => present,
  }

  package { "patch":
    ensure => present,
  }

  package { "zlib-devel":
    ensure => present,
  }

  package { "bzip2-devel":
    ensure => present,
  }

  package { "openssl-devel":
    ensure => present,
  }

  package { "ncurses-devel":
    ensure => present,
  }

  package { "sqlite-devel":
    ensure => present,
  }

  package { "tk-devel":
    ensure => present,
  }

  package { "python-devel.x86_64":
    ensure => present,
  }

  package { "libjpeg-turbo-devel.x86_64":
    ensure => present,
  }

  package { "libxml2-devel.x86_64":
    ensure => present,
  }

  package { "libxml2-python.x86_64":
    ensure => present,
  }

  package { "libxslt-devel.x86_64":
    ensure => present,
  }

  package { "libxslt-python.x86_64":
    ensure => present,
  }

}

include centos_dependencies
