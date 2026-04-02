cat > ~/escrow-project/github-repo/README.md << 'EOF'
# SecureEscrow — Blockchain Assignment

## Overview
A secure escrow smart contract on Ethereum where an Arbiter holds 
funds and distributes them — 99% to Seller or 100% refund to Buyer.

## Roles
- **Buyer** — Deposits full amount at deployment
- **Seller** — Receives 99% of funds when Arbiter calls release()
- **Arbiter** — Neutral party; earns 1% fee; sole authority to settle

## Tech Stack
- Solidity 0.6.12
- Geth v1.13.15 — Local private node (Chain ID: 1337)
- Remix IDE — Compilation and deployment
- Clique PoA consensus

## Accounts Used
| Role | Address |
|------|---------|
| Buyer | 0xe2ff0be1a1f6dbed181a707b5b5cad6555ca17bb |
| Seller | 0xe3e790ec3d11bb79d3fe3c8f9048a15cffefbf73 |
| Arbiter | 0xe4e3fe88b0908935d76496b7a62c28cba39c1e19 |

## Contract Address
`0x2796a040feefdfD12013166661f8aE6A2fb53191`

## Contract Functions
| Function | Access | Description |
|----------|--------|-------------|
| `release()` | Arbiter only | Sends 99% to Seller, 1% to Arbiter |
| `refund()` | Arbiter only | Returns 100% to Buyer |
| `getBalance()` | Public | Returns contract ETH balance |

## How to Run

### 1. Install Geth 1.13.15
```bash
wget https://gethstore.blob.core.windows.net/builds/geth-linux-amd64-1.13.15-c5ba367e.tar.gz
tar -xzf geth-linux-amd64-1.13.15-c5ba367e.tar.gz
sudo cp geth-linux-amd64-1.13.15-c5ba367e/geth /usr/local/bin/geth
```

### 2. Initialize and Start Node
```bash
geth --datadir ./escrow-chain init genesis.json
geth --datadir ./escrow-chain --networkid 1337 --http --http.port 8545 console
```

### 3. Deploy in Remix
- Connect Remix to http://127.0.0.1:8545
- Compile with Solidity 0.6.12
- Deploy with Buyer account and 2 ETH deposit

## Screenshots
See the `/screenshots` folder for deployment and execution proof.
EOF# SecureEscrow
Blockchain Escrow Smart Contract - Ethereum Assignment/project
