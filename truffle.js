module.exports = {
  contracts_build_directory: './build',
  networks: {
    development: {
      host: 'localhost',
      port: 8545,
      network_id: '*'
    },
    ropsten: {
      host: 'localhost',
      port: 8545,
      network_id: 3,
      gas: 2900000
    },
  }
};
