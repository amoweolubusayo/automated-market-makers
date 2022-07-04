pragma solidity ^0.8.4;

import './interfaces/IUniswapV2ERC20.sol';
import './libraries/SafeMath.sol';

abstract contract UniswapV2ERC20 is IUniswapV2ERC20 {
    using SafeMath for uint;

    string constant name = 'Uniswap V2';
    string constant symbol = 'UNI-V2';
    uint8 constant decimals = 18;
    uint totalSupply;
    mapping(address => uint) balanceOf;
    mapping(address => mapping(address => uint)) allowance;

    bytes32 DOMAIN_SEPARATOR;
    bytes32 constant PERMIT_TYPEHASH = 0x6e71edae12b1b97f4d1f60370fef10105fa2faae0126114a169c64845d6126c9;
    mapping(address => uint) nonces;

    event Approval(address indexed owner, address indexed spender, uint value);
    event Transfer(address indexed from, address indexed to, uint value);

    constructor() {
        uint chainId;
        // assembly {
        //     chainId := chainid
        // }
        DOMAIN_SEPARATOR = keccak256(
            abi.encode(
                keccak256('EIP712Domain(string name,string version,uint256 chainId,address verifyingContract)'),
                keccak256(bytes(name)),
                keccak256(bytes('1')),
                chainId,
                address(this)
            )
        );
    }

    function _mint(address to, uint value) internal {
        totalSupply = totalSupply.add(value);
        balanceOf[to] = balanceOf[to].add(value);
        emit Transfer(address(0), to, value);
    }

    function _burn(address from, uint value) internal {
        balanceOf[from] = balanceOf[from].sub(value);
        totalSupply = totalSupply.sub(value);
        emit Transfer(from, address(0), value);
    }

    function _approve(address owner, address spender, uint value) private {
        allowance[owner][spender] = value;
        emit Approval(owner, spender, value);
    }

    function _transfer(address from, address to, uint value) private {
        balanceOf[from] = balanceOf[from].sub(value);
        balanceOf[to] = balanceOf[to].add(value);
        emit Transfer(from, to, value);
    }

     function approve(address spender, uint value) override external returns (bool) {
        _approve(msg.sender, spender, value);
        return true;
    }

    function transfer(address to, uint value) override external returns (bool) {
        _transfer(msg.sender, to, value);
        return true;
    }

    // function transferFrom(address from, address to, uint value) external returns (bool) {
    //     if (allowance[from][msg.sender] != type(uint).max) {
    //         allowance[from][msg.sender] = allowance[from][msg.sender].sub(value);
    //     }
    //     _transfer(from, to, value);
    //     return true;
    // }
}