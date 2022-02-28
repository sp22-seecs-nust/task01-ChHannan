import 'package:a2/phone_book.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(
    const MaterialApp(
      home: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  PhoneBook? phone;

  @override
  void initState() {
    super.initState();

    getData().then((value) {
      phone = PhoneBook(value[0], value[1]);
      setState(() {});
    });
  }

  Future<List<dynamic>> getData() async {
    var people = rootBundle.loadString("assets/people.json");
    var phoneNumbers = await rootBundle.loadString("assets/number.json");
    return [people, phoneNumbers];
  }

  @override
  Widget build(BuildContext context) {
    if (phone == null) {
      return Scaffold(
        body: Container(),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Abdul Hannan (246528)'),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(phone!.getNameFromPhone(2)!),
              Text(phone!.getPhoneFromNumber(2)!),
            ],
          ),
        ),
      ),
    );
  }
}
