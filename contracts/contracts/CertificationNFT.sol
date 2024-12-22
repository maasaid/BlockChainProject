// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";

contract CertificationNFT is ERC721URIStorage {
    constructor() ERC721("MyToken", "MTK") {}

    struct Certificate {
        string uid;
        string candidate_name;
        string speciality;
        string school_name;
        string ipfs_hash;
    }

    mapping(string => Certificate) public certificates;

    event CertificateMinted(
        string indexed ipfs_hash,
        string candidate_name,
        string speciality,
        string school_name
    );

    function mintCertificate(
        string memory _uid,
        string memory _candidate_name,
        string memory _speciality,
        string memory _school_name,
        string memory _ipfs_hash
    ) public returns (string memory) {
        require(
            bytes(certificates[_ipfs_hash].ipfs_hash).length == 0,
            "Certificate with this IPFS hash already exists"
        );
    }
}
