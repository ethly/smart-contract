module.exports = {
  networks: {
    development: {
      host: 'localhost',
      port: 8545,
      network_id: '*',
      gas: 29000000
    },
    ropsten: {
      host: 'localhost',
      port: 8545,
      network_id: 3,
      gas: 2900000
    },
  }
};
