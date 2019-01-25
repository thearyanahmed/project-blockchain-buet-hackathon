


module.exports = {
  // See <http://truffleframework.com/docs/advanced/configuration>
  // for more about customizing your Truffle configuration!
  networks: {
    development: {
      host: "127.0.0.1",
      port: 7545,
      //gas : 111111111,
      network_id: "*" // Match any network id
    }
  },
  compilers: {
    solc: {
      version: "0.5.3"	  // ex:  "0.4.20". (Default: Truffle's installed solc)
    }
 }
};
