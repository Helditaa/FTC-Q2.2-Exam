const CoToken = artifacts.require("./CoToken.sol");
//const ERC20 = artifacts.require("./ERC20.sol");

contract("CoToken", (accounts) => {
    const buyer = accounts[0]
    const tokenOwner = accounts[1]
    const randomAddress = accounts[2]

    const buyPrice = 10;

    let tokensToMint = 10;
    let tokensToBurn = 6;
    
    context("Mint Function", function () {
        it("Can correctly mint token", async () => {
            let CoTokenInstance = await CoToken.deployed()
            let numberOfTokens = await CoTokenInstance.balanceOf(buyer)
  
            await CoTokenInstance.mint(tokensToMint, {
                from: buyer
            })
            let balanceOfTokens = await CoTokenInstance.balanceOf(buyer)

            assert.equal(balanceOfTokens.toNumber(), tokensToMint, "wrong number of tokens")

        })

        it("Can correctly burn tokens", async () => {
            let CoTokenInstance = await CoToken.deployed()
            let numberOfTokens = await CoTokenInstance.balanceOf(buyer)
  
            await CoTokenInstance.burn(tokensToBurn, {
                from: buyer
            })
            let newBalanceOfTokens = await CoTokenInstance.balanceOf(buyer)
            let remainingTokens = numberOfTokens - tokensToBurn
            console.log(newBalanceOfTokens.toNumber())

            assert.equal(newBalanceOfTokens.toNumber(), remainingTokens, "wrong number of burnt tokens")
        })

        it("Can correctly selfdestruct", async () => {
            let CoTokenInstance = await CoToken.deployed()
            let balanceofOwner = await CoTokenInstance.balanceOf(buyer)
            console.log(balanceofOwner.toNumber())
  
            await CoTokenInstance.destroy( {
                from: buyer
            })
            console.log(balanceofOwner.toNumber())


            //assert.equal(newBalanceOfTokens.toNumber(), remainingTokens, "wrong number of burnt tokens")
        })        



    })











})