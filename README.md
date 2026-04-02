# SecureEscrow — Blockchain Assignment

## Overview
SecureEscrow is a smart contract implemented on the Ethereum blockchain that simulates a secure escrow transaction between three parties:

• Buyer — deposits funds into the contract  
• Seller — receives funds after successful transaction  
• Arbiter — neutral authority that decides whether funds are released or refunded  

The contract ensures funds remain locked until the arbiter resolves the transaction.

---

# System Architecture

The SecureEscrow system contains three participants interacting with a smart contract.

Buyer deposits ETH → Smart Contract → Seller  
                        ↓  
                   Arbiter Decision  

The arbiter can:

• release() → send funds to seller  
• refund() → return funds to buyer  

---

# Roles

## Buyer
- Deposits ETH into escrow
- Receives refund if transaction fails

## Seller
- Receives payment after arbiter approval

## Arbiter
- Neutral third party
- Calls release() or refund()
- Earns 1% arbitration fee

---

# Tech Stack

• Solidity 0.6.12  
• Geth v1.13.15 — Local private Ethereum node  
• Remix IDE — Smart contract compilation and deployment  
• Clique Proof-of-Authority consensus  
• Ubuntu Linux  
• Git & GitHub  

Network configuration:

Chain ID: **1337**

---

# Accounts Used

| Role | Address |
|-----|-----|
| Buyer | 0xe2ff0be1a1f6dbed181a707b5b5cad6555ca17bb |
| Seller | 0xe3e790ec3d11bb79d3fe3c8f9048a15cffefbf73 |
| Arbiter | 0xe4e3fe88b0908935d76496b7a62c28cba39c1e19 |

---

# Contract Address

0x2796a040feefdfD12013166661f8aE6A2fb53191

---

# Smart Contract Functions

| Function | Access | Description |
|-----|-----|-----|
| release() | Arbiter only | Sends 99% of funds to Seller and 1% to Arbiter |
| refund() | Arbiter only | Returns 100% funds to Buyer |
| getBalance() | Public | Returns contract ETH balance |

---

# Project Workflow

1. Start a private Ethereum blockchain using **Geth**
2. Create three accounts:
   - Buyer
   - Seller
   - Arbiter
3. Connect Remix IDE to the Geth node
4. Compile SecureEscrow smart contract
5. Deploy contract with Buyer account
6. Buyer deposits ETH into contract
7. Arbiter decides transaction outcome
8. Funds are either released to Seller or refunded to Buyer
9. Mining confirms transactions on the blockchain

---

# How to Run the Project

## Step 1 — Install Geth 1.13.15

wget https://gethstore.blob.core.windows.net/builds/geth-linux-amd64-1.13.15-c5ba367e.tar.gz  
tar -xzf geth-linux-amd64-1.13.15-c5ba367e.tar.gz  
sudo cp geth-linux-amd64-1.13.15-c5ba367e/geth /usr/local/bin/geth  

---

## Step 2 — Initialize Blockchain

geth --datadir ./escrow-chain init genesis.json

---

## Step 3 — Start Private Node

geth --datadir ./escrow-chain --networkid 1337 --http --http.port 8545 console

---

## Step 4 — Create Accounts

Inside the Geth console:

personal.newAccount()

Create three accounts for:

• Buyer  
• Seller  
• Arbiter  

---

## Step 5 — Start Mining

miner.start()

Mining confirms blockchain transactions.

---

## Step 6 — Connect Remix to Geth

Open Remix IDE.

Select environment:

Web3 Provider

Enter RPC URL:

http://127.0.0.1:8545

---

## Step 7 — Deploy Smart Contract

Steps:

1. Compile contract with Solidity **0.6.12**
2. Select Buyer account
3. Enter Seller and Arbiter addresses
4. Deploy contract with **2 ETH deposit**

---

# Execution Proof (Screenshots)

The following screenshots show the complete execution of the SecureEscrow system.

## Screenshot 1 — Account Creation
Three Ethereum accounts created representing Buyer, Seller and Arbiter.

## Screenshot 2 — Initial Balances
Geth console showing balances:

Buyer = 100 ETH  
Seller = 10 ETH  
Arbiter = 10 ETH  

Mining started successfully.

## Screenshot 3 — Contract Deployment
SecureEscrow contract deployed successfully in Remix connected to Geth network.

## Screenshot 4 — Contract State Verification (Addresses)
Verification that Buyer and Arbiter addresses are correctly stored in the contract.

## Screenshot 5 — Deposit State
Contract showing:

depositAmount  
contract balance  
isSettled = false

## Screenshot 6 — Seller Address Verification
Seller address confirmed inside the contract.

## Screenshot 7 — Release Transaction
Arbiter calls **release()**.

Funds distributed:

99% → Seller  
1% → Arbiter

## Screenshot 8 — Refund Scenario Deployment
Second contract deployment used to test refund functionality.

## Screenshot 9 — Balances After Release
Seller balance increased  
Arbiter received 1% fee  
Contract balance = 0

## Screenshot 10 — Balances After Refund
Buyer received refund  
Contract balance = 0

## Screenshot 11 — Mining Activity
Geth terminal showing blocks mined on the private blockchain.

All screenshots are stored in the **screenshots/** directory.

---

# Conclusion

SecureEscrow demonstrates how blockchain technology can implement a decentralized escrow system without relying on a centralized authority.

Advantages:

• Transparent transactions  
• Secure smart contract execution  
• Automated escrow settlement  
• Trustless system using blockchain  

---

