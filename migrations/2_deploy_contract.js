var UnicoinRegistry = artifacts.require("CoToken");

module.exports = function (deployer) {
    // Deploy the UniCoin Registry contract
    deployer.deploy(CoToken);
};