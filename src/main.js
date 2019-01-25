// The Vue build version to load with the `import` command
// (runtime-only or standalone) has been set in webpack.base.conf with an alias.
import Vue from 'vue'
import App from './App'
import Web3 from 'web3'
import router from './router'

Vue.config.productionTip = false
var web3 = null
window.addEventListener('load', function () {
  if (typeof web3 !== 'undefined') {
    console.log('Web3 injected browser: OK.')
    web3 = new Web3(window.web3.currentProvider)
  } else {
    console.log('Web3 injected browser: Fail. You should consider trying MetaMask.')
    // fallback - use your fallback strategy (local node / hosted node + in-dapp id mgmt / fail)
    web3 = new Web3(new Web3.providers.HttpProvider('http://localhost:8545'))
  }

  window.web3 = web3
  const myabi = [
    {
      'constant': false,
      'inputs': [
        {
          'name': '_value',
          'type': 'uint256'
        }
      ],
      'name': 'addProperty',
      'outputs': [],
      'payable': false,
      'stateMutability': 'nonpayable',
      'type': 'function'
    },
    {
      'constant': false,
      'inputs': [
        {
          'name': '_lendAmount',
          'type': 'uint256'
        },
        {
          'name': '_interestRate',
          'type': 'uint256'
        }
      ],
      'name': 'createPost',
      'outputs': [],
      'payable': false,
      'stateMutability': 'nonpayable',
      'type': 'function'
    },
    {
      'inputs': [],
      'payable': true,
      'stateMutability': 'payable',
      'type': 'constructor'
    }
  ]
  const contractAddress = '0xca35b7d915458ef540ade6068dfe2f44e8fa733c'

  const contract = web3.eth.contract(myabi, contractAddress)

  window.contract = contract
  /* eslint-disable no-new */
  new Vue({
    el: '#app',
    router,
    template: '<App/>',
    components: { App }
  })
})

