pragma solidity 0.4.24;

/*
 * @title ContactBook
 * @dev Similar to a tractional contact list that stores public information used to get ahold of someone. 
 */

contract ContactBook {

    //structure of contact blocks
    struct Contact {
        string name; //variable of type string
        string homeAddress; //physical location of individual. Not blockchain address.
        uint8 myAge; // variable of unsigned integer type
        bool isMarried; // variable of boolean type
        uint[] phoneNumbers; // variable - dynamic array of unsigned integer
    }
    
    uint numContact;
    mapping(uint => Contact) contacts;
    
    Contact[] private contactList;
    
    /**
    * @dev function used to add new contacts to the contact book. 
    */
    function addNewContact(string memory _name, string memory _homeAddress, uint8 _myAge, bool _isMarried, uint[] _phoneNumbers) public returns(uint) {
        contactList.push(Contact(_name, _homeAddress, _myAge, _isMarried, _phoneNumbers));
        
        uint contactId = numContact++;
        Contact storage c = contacts[contactId];
        c.name = _name;
        c.homeAddress = _homeAddress;
        c.myAge = _myAge;
        c.isMarried = _isMarried;
        c.phoneNumbers = _phoneNumbers;
        return contactId;
    }

    /*
    * @dev function used to view contacts in the contact book by their ID.
    */
    function getInfo(uint contactId) public view returns(string, string, uint, bool, uint[]) {
        Contact storage c = contacts[contactId];
        return (c.name, c.homeAddress, c.myAge, c.isMarried, c.phoneNumbers);
    }
    
    /*
    * @dev function used to search entire contact book, if you don't know specific ID number for a contact name. This function outputs the contactId number you need to input into getInfo.
    */
    function searchContactBook(string memory _searchName) public view returns(string, uint256) {
        for (uint i = 0; i < contactList.length; i++){
            Contact storage f = contacts[i];
            if (keccak256(abi.encodePacked(f.name)) == keccak256(abi.encodePacked(_searchName))){
                return (f.name,i);
            }
        }
    }
    
}
