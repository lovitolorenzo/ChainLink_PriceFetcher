// SPDX-License-Identifier: MIT

pragma solidity >=0.7.0 <0.9.0;

import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";

contract FetchPriceFeed {
    AggregatorV3Interface public ethPriceFeed;
    AggregatorV3Interface public usdcPriceFeed;
    uint256 public priceEth;
    uint256 public priceUsdc;

    constructor() {
        ethPriceFeed = AggregatorV3Interface(
            0xD4a33860578De61DBAbDc8BFdb98FD742fA7028e
            /// @dev ETH on goerli 0xD4a33860578De61DBAbDc8BFdb98FD742fA7028e
            /// @dev ETH on mainnet 0x5f4eC3Df9cbd43714FE2740f5E3616155c5b8419
        );
        usdcPriceFeed = AggregatorV3Interface(
            0xAb5c49580294Aff77670F839ea425f5b78ab3Ae7
            /// @dev USDC on goerli 0x8fFfFfd4AfB6115b954Bd326cbe7B4BA576818f6
            /// @dev USDC on mainnet 0xAb5c49580294Aff77670F839ea425f5b78ab3Ae7
        );
        (, int256 price, , , ) = ethPriceFeed.latestRoundData();
        priceEth = uint256(price);
        (, price, , , ) = usdcPriceFeed.latestRoundData();
        priceUsdc = uint256(price);
    }
}
