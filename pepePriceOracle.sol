pragma solidity ^0.8.0;

contract PepePriceOracle {
    address public owner;
    uint256 public price;
    
    event PriceUpdated(uint256 newPrice);
    
    constructor() {
        owner = msg.sender;
    }
    
    modifier onlyOwner() {
        require(msg.sender == owner, "You are not the owner");
        _;
    }
    
    /**
     * @notice Update the price of Pepe.
     * @dev Only the owner can update the price. Emits a PriceUpdated event.
     * @param _price The new price to set.
     */
    function updatePrice(uint256 _price) public onlyOwner {
        require(_price > 0, "Price should be greater than 0");
        price = _price;
        emit PriceUpdated(_price);
    }
    
    /**
     * @notice Get the current price of Pepe.
     * @return The current price of Pepe.
     */
    function getPrice() public view returns (uint256) {
        return price;
    }
}
