## Supplementary Materials

## Installation

This project use yarn, so it is recommended to not use npm.
Proceed with install yarn (This installs all dependencies):

```bash
$ yarn add
```

To develop on goerli testnet as required in hardhat.config.ts
create a .env file and insert the following keys:
MNEMONIC="\***\*\*\*\*\***\*\***\*\*\*\*\***"
PRIVATE_KEY="**\*\***\*\*\*\***\*\***"
INFURA_API_KEY="**\*\***\***\*\***"
INFURA_API_SECRET="**\*\***\*\***\*\***"
ALCHEMY_API_KEY="**\*\*\*\***\*\***\*\*\*\***"
ALCHEMY_API_URL="**\*\*\*\***\*\***\*\*\*\***"
ETHERSCAN_API_KEY="\***\*\*\*\*\***\*\***\*\*\*\*\***"

Also adapt PRIVATE_KEY used in hardhat.config.ts

run the following to deploy the contracts and be able to have artifacts, their abis and bytescode:

```bash
$ yarn hardhat compile
```

run the following to execute the program:

```bash
$ yarn hardhat run scripts/deploy.ts
```

## Purpose

Goal of this script is to fetch prices but furtherly to be reused
as module to interact with others more advanced programs.
