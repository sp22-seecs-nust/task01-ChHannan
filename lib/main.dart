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
  @override
  void initState() {
    super.initState();
  }

  Future<List<dynamic>> getData() async {
    var result = await rootBundle.loadString("assets/people.json");
    List<String> peoples = result.split(',');
    var output = await rootBundle.loadString("assets/number.json");
    List<String> phoneNumbers = output.split(',');
    return [
      peoples,
      phoneNumbers,
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Abdul Hannan (246528)'),
      ),
      body: SafeArea(
        child: Center(
          child: FutureBuilder(
              future: getData(),
              builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                if (!snapshot.hasData) {
                  return const Center(child: CircularProgressIndicator());
                }
                PhoneBook phoneBook = PhoneBook(
                  namesList: snapshot.data![0],
                  phoneNumberList: snapshot.data[1],
                );
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Name: ${phoneBook.namesList[2]}'),
                    const SizedBox(
                      height: 10,
                    ),
                    Text('Phone Number: ${phoneBook.getNumberAgainstName(2)}'),
                  ],
                );
              }),
        ),
      ),
    );
  }
}
