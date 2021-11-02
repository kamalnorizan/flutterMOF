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
            Productbox(
              name: 'iPhone',
              description: 'iPhone is the most expensive phone ever',
              price: 4000,
              imageName: 'iPhone',
            ),
            Productbox(
              name: 'Laptop',
              description: 'Laptop is most productive development tool',
              price: 2500,
              imageName: 'Laptop',
            ),
            Productbox(
              name: 'Tablet',
              description: 'Tablet is most productive development tool',
              price: 2300,
              imageName: 'Tablet',
            ),
            Productbox(
              name: 'Pendrive',
              description: 'Pendrive is a storage medium',
              price: 20,
              imageName: 'Pendrive',
            ),

          ],
        )
      ),
    );
  }
}
