class mediacenter::transmission::setup {

  class { 'transmission':
    rpc_username => 'rpcuser',
    rpc_password => '',
    rpc_port     => 8080,
    peer_port    => 54612,
    encryption   => 2
  }
}
