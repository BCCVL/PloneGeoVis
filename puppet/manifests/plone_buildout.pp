class plone_buildout {

  # Update Plone's buildout file
  file { '/home/vagrant/Plone/zinstance/buildout.cfg':
    path    => '/home/vagrant/Plone/zinstance/buildout.cfg',
    source  => '/vagrant/puppet/files/buildout.cfg',
    owner   => 'vagrant',
    group   => 'vagrant',
    mode    => '0600',
    ensure  => present,
  }

  # Run Plone's buildout
  exec { '/home/vagrant/Plone/zinstance/bin/buildout':
    command => '/home/vagrant/Plone/zinstance/bin/buildout',
    cwd     => '/home/vagrant/Plone/zinstance',
    user    => vagrant,
    timeout => 60 * 20,                         # Allow 20 mins to install
    tries   => 2,
    try_sleep =>  30,
    subscribe  => File['/home/vagrant/Plone/zinstance/buildout.cfg'],
    refreshonly => true,                        # Only run when the file changes
  }

}

include plone_buildout
