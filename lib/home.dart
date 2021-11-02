import 'package:flutter/material.dart';
import 'package:fluttertutorial/widgets/productbox.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Home Page'),
        ),
        body: ListView(
          shrinkWrap: true, padding: const EdgeInsets.fromLTRB(2.0, 10.0, 2.0, 10.0),
          children: const [
            Productbox(),
            Productbox(),
            Productbox(),
            Productbox(),
            Productbox(),
            Productbox(),
            Productbox(),
            Productbox()
          ],
        )
      ),
    );
  }
}
