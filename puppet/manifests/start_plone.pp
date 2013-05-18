class start_plone {

  # Start Plone
  exec { '/home/vagrant/Plone/zinstance/bin/plonectl start':
    command => '/home/vagrant/Plone/zinstance/bin/plonectl start',
    cwd     => '/home/vagrant/Plone/zinstance',
    user    => vagrant,
  }

}

include start_plone
