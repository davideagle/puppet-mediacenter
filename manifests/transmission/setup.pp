class mediacenter::transmission::setup {

  class { 'transmission':
    rpc_username => 'rpcuser',
    rpc_password => '',
    rpc_port     => 9091,
    peer_port    => 54612,
    encryption   => 2
  }
}
