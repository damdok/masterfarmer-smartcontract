pragma solidity >=0.4.22 <0.8.0;
import "remix_tests.sol"; // this import is automatically injected by Remix.
import "remix_accounts.sol";
import "../CropsToken.sol";
import "../Sender.sol";

// File name has to end with '_test.sol', this file can contain more than one testSuite contracts
contract CropsToken_11_test is CropsToken, Sender {
    
   address acc0;
   address acc1;
   address acc2;
   address acc3;
    
    function beforeAll() public {
        acc0 = TestsAccounts.getAccount(0);
        acc1 = TestsAccounts.getAccount(1);
        acc2 = TestsAccounts.getAccount(2);
        acc3 = TestsAccounts.getAccount(3);
    }
    
    /// Test if initial owner is set correctly
    function testInitialOwner() public {
        // account at zero index (account-0) is default account, so current owner should be acc0
        Assert.equal(getOwner(), acc0, 'owner should be acc0');
        approve(acc1, 10000000000000000000000);
    }
    
    /// Update owner first time
    /// This method will be called by default account(account-0) as there is no custom sender defined
    function updateOwnerOnce() public {
        // check method caller is as expected
        Assert.ok(msg.sender == acc0, 'caller should be default account i.e. acc0');
        // update owner address to acc1
        updateOwner(acc1);
        // check if owner is set to expected account
        // Assert.equal(getOwner(), acc1, 'owner should be updated to acc1');
    }
    
    function transferFromShouldBeThis() public {
        //transferFrom(acc0, acc2, 10000000000000000000000);
        //updateOwner(acc0);
        //return Assert.equal(allowance(acc0, acc1), uint(0), "approve is not correct");
    }
}
