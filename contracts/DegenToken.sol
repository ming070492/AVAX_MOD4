// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";
import "hardhat/console.sol";
import "@openzeppelin/contracts/utils/Strings.sol";

contract DegenToken is ERC20, Ownable, ERC20Burnable {

        constructor() ERC20("Degen", "DGN") {
            totalRedeemable = 3;
            redeemables[1].name = "GREAT SWORD +10";
            redeemables[1].required_amount = 100;
            redeemables[1].description = "MIGHTIEST SWORD";
            redeemables[2].name = "HUNTING BOW +10";
            redeemables[2].required_amount = 100;
            redeemables[2].description = "MIGHTIEST BOW";
            redeemables[3].name = "WIZARD WAND +10";
            redeemables[3].required_amount = 100;
            redeemables[3].description = "MIGHTIEST WAND";
        }

        struct redeemableItem {
            string name;
            uint256 required_amount;
            string description;
        }

        mapping(uint256 => redeemableItem) public redeemables;
        mapping(address => mapping(uint256 => bool)) public redeem_history;
        mapping(address => uint256) public balances;

        event redeem_hitory(uint256 id, string name, string description, uint256 amount);
        event my_redeem_history(address sender, uint256 id, string name, bool claim);
        event redeem_result(string result);

        uint256 public totalRedeemable;

        function mint(address _to, uint256 _amount) public onlyOwner{
            _mint(_to, _amount);
            balances[_to] += _amount;
        }

        function burnToken(uint256 _amount) public {
            require(balanceOf(msg.sender) >= _amount, "YOU ARE NOT ALLOWED TO BURN MORE THAN WHAT YOU HAVE.");
            burn(_amount);
            balances[msg.sender] -= _amount;
        }

        function checkBalance(address _address) public view returns(uint256){
            return(balanceOf(_address));
        }

        function transferTokens(address _receiver, uint256 _amount) external {
            require(balanceOf(msg.sender) >= _amount, "INSUFFICIENT BALANCE.");
            transfer(_receiver, _amount);
            balances[_receiver] += _amount;
            balances[msg.sender] -= _amount;
        }

        function redeem(uint256 _item_id) public {
            require(_item_id > 0, "INVALID ITEM ID.");
            require(redeem_history[msg.sender][_item_id] == false, "YOU HAVE ALREADY REDEEMED THIS ITEM.");
            require(balanceOf(msg.sender) >= redeemables[_item_id].required_amount, "YOUR BALANCE IS NOT ENOUGH TO REDEEM THIS ITEM.");
            redeem_history[msg.sender][_item_id] = true;
            burn(redeemables[_item_id].required_amount);
            emit redeem_result(string(abi.encodePacked(redeemables[_item_id].name, " SUCCESSFULLY CLAIMED!")));
        }

        function addRedeemableItem(string memory _item_name, uint256 _item_requirement, string memory _item_description) public onlyOwner {
            require(bytes(_item_name).length > 0, "INVALID NAME.");
            totalRedeemable++;
            redeemables[totalRedeemable].name = _item_name;
            redeemables[totalRedeemable].required_amount = _item_requirement;
            redeemables[totalRedeemable].description = _item_description;
        }

        function viewRedeemables() public {
            for(uint256 a = 1; a <= totalRedeemable; a++) {
                emit redeem_hitory(a, redeemables[a].name, redeemables[a].description, redeemables[a].required_amount);
            }
        }

        function viewMyRedeemHistory() public {
            for(uint256 a = 1; a <= totalRedeemable; a++) {
                emit my_redeem_history(msg.sender, a, redeemables[a].name, redeem_history[msg.sender][a]);
            }
            
        }
}