const abi = [
	{
		"constant": false,
		"inputs": [
			{
				"name": "_value",
				"type": "uint256"
			}
		],
		"name": "addProperty",
		"outputs": [],
		"payable": false,
		"stateMutability": "nonpayable",
		"type": "function"
	},
	{
		"constant": false,
		"inputs": [
			{
				"name": "_lendAmount",
				"type": "uint256"
			},
			{
				"name": "_interestRate",
				"type": "uint256"
			}
		],
		"name": "createPost",
		"outputs": [],
		"payable": false,
		"stateMutability": "nonpayable",
		"type": "function"
	},
	{
		"inputs": [],
		"payable": true,
		"stateMutability": "payable",
		"type": "constructor"
	}
]

export default abi
