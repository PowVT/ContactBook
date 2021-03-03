pragma solidity 0.4.19;

/**
 * @title ContactBook
 * @dev Similar to a tractional contact list that stores public information used to get ahold of someone. 
 */

contract ContactBook {

    //structure of contact blocks
    struct Contact {
        string name; //variable of type string
        string homeAddress; //physical location of individual. Not blockchain address.
        uint myAge; // variable of unsigned integer type
        bool isMarried; // variable of boolean type
        uint[] phoneNumbers; // variable - dynamic array of unsigned integer
    }
    
    uint numContact;
    mapping(uint => Contact) contacts;
    
    /**
  * @dev function used to add new contacts to the contact book. 
  */
    function addNewContact(string memory _name, string memory _homeAddress, uint _myAge, bool _isMarried, uint[] _phoneNumbers) public returns(uint) {
        uint contactId = numContact++;
        Contact storage c = contacts[contactId];
        c.name = _name;
        c.homeAddress = _homeAddress;
        c.myAge = _myAge;
        c.isMarried = _isMarried;
        c.phoneNumbers = _phoneNumbers;
        return contactId;
    }

    /**
  * @dev function used to view contacts in the contact book by their ID.
  */
    function getInfo(uint contactId) public view returns(string, string, uint, bool, uint[]) {
        Contact storage c = contacts[contactId];
        return (c.name, c.homeAddress, c.myAge, c.isMarried, c.phoneNumbers);

    }
    
    /**
  * @dev function used to view entire contact book,  if you don't know specific ID number.
  */
  function viewContactBook() public view {
      for (uint i = 0; i <= numContact; i++) {
          getInfo(i);
      }
  }
    
}
