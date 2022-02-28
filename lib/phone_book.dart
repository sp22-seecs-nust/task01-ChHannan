class PhoneBook {
  late Map<String, String> _numberToPhoneData;
  late Map<String, String> _phoneToNameData;
  late List<List<String>> _nameAndNumberData;
  late List<String> _phoneNumberData;

  Map<String, String> get phoneToNameData => _phoneToNameData;

  Map<String, String> get numberToPhoneData => _numberToPhoneData;

  List<List<String>> get nameAndNumberData => _nameAndNumberData;

  List<String> get phoneNumberData => _phoneNumberData;

  void setPhoneBookData(
      List<List<String>> nameAndNumberData, List<String> phoneNumberData) {
    checkDimensions(nameAndNumberData);

    _nameAndNumberData = nameAndNumberData;
    _phoneNumberData = phoneNumberData;

    // Map names to phone numbers with key value pairs
    _phoneToNameData =
        Map.fromIterables(phoneNumberData, nameAndNumberData.last);
    _numberToPhoneData =
        Map.fromIterables(nameAndNumberData.first, nameAndNumberData.last);
  }

  void checkDimensions(List<List<String>> nameAndNumberData) {
    if (nameAndNumberData.length == 2) {
      final numberList = nameAndNumberData.first;
      final nameList = nameAndNumberData.last;

      if (numberList.length != 10 || nameList.length != 10) {
        throw Exception('There should be 10 columns in the phone book data');
      }
    } else {
      throw Exception('There should be 2 rows in the phone book data');
    }
  }

  PhoneBook(
      List<List<String>> nameAndNumberData, List<String> phoneNumberData) {
    setPhoneBookData(nameAndNumberData, phoneNumberData);
  }

  String? getPhoneFromNumber(int index) {
    return numberToPhoneData.entries.elementAt(index).value;
  }

  String? getNameFromPhone(int index) {
    return phoneToNameData.entries.elementAt(index).value;
  }
}
