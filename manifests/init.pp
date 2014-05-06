node 'hackertribe.startupchile.vm'{
    notify {"Hello World":}

    file {'/tmp/test1':
      ensure  => present,
      content => "Hi.",
    }

    notify {'Order':
    }
    notify {'is':
    }
    notify {'important':
    }
} 