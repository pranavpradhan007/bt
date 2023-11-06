// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BloodBank {
    // Structure to represent a blood donation record
    struct DonationRecord {
        address donor;
        string bloodType;
        string location;
    }

    // Mapping to store donation records
    mapping(uint256 => DonationRecord) public donations;
    uint256 public donationCount;

    // Event to log when a new donation is recorded
    event DonationAdded(uint256 indexed id, address indexed donor, string bloodType, string location);

    // Function to record a blood donation
    function recordDonation(string memory _bloodType, string memory _location) public {
        require(bytes(_bloodType).length > 0, "Blood type cannot be empty");
        require(bytes(_location).length > 0, "Location cannot be empty");

        donations[donationCount] = DonationRecord(msg.sender, _bloodType, _location);
        donationCount++;

        emit DonationAdded(donationCount - 1, msg.sender, _bloodType, _location);
    }

    // Function to get the details of a donation by ID
    function getDonationDetails(uint256 _id) public view returns (address, string memory, string memory) {
        require(_id < donationCount, "Invalid donation ID");
        DonationRecord memory record = donations[_id];
        return (record.donor, record.bloodType, record.location);
    }
}