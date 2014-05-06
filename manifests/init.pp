node 'hackertribe.startupchile.vm'{
    notify {"Hello World":}

    file {'/tmp/test1':
      ensure  => present,
      content => "Hi.",
    }

    notify {'Order':
    }
    ->
    notify {'is':
    }
    ->
    notify {'important':
    }
    

    # Add the hiera config file 
    file { '/etc/puppet/hiera.yaml':
            ensure => present,
    }

    class { 'apache':
            user => 'vagrant', 
            group => 'vagrant',
            default_vhost => false,
    }
    # Setup hacker tribe vhost
    apache::vhost{'fqdn-http':
            port => 80, 
            servername => $fqdn,
            docroot => '/var/www/html',
            directories => [
                { 
                    path => '/var/www/html',
                    options => 'Indexes FollowSymLinks MultiViews',
                    allow_override => 'All',
                    order => 'allow,deny',
                    allow => 'from all',
                }
            ],
    }
} 