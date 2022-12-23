import { ethers } from "hardhat";

async function main() {
	const provider = ethers.getDefaultProvider("goerli");

	const gasPrice = await provider.getGasPrice();
	const latestBlock = await provider.getBlock("latest");
	const gasLimit = latestBlock.gasLimit;

	const wallet = ethers.Wallet.fromMnemonic(process.env.RESERVE3_MNEMONIC ? process.env.RESERVE3_MNEMONIC : "");

	const deployer = wallet.connect(provider);

	const FetchPriceFeedFactory = await ethers.getContractFactory("FetchPriceFeed");

	const FetchPriceFeedContract = await FetchPriceFeedFactory.deploy();

	await FetchPriceFeedContract.deployed();

	console.log("FetchPriceFeedContract deployed at ", FetchPriceFeedContract.address);

	console.log("ETH price feed from chainLink: ", (await FetchPriceFeedContract.priceEth()).toNumber() / 10 ** 8);
	console.log("USDC price feed from chainLink: ", (await FetchPriceFeedContract.priceUsdc()).toNumber() / 10 ** 8);
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
	console.error(error);
	process.exitCode = 1;
});
