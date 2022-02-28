class PhoneBook {
  late List<String> phoneNumberList;
  late List<String> namesList;

  PhoneBook({
    required this.phoneNumberList,
    required this.namesList,
  });

  String getNumberAgainstName(int index) {
    return phoneNumberList[index];
  }
}
