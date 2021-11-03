import 'package:flutter/material.dart';

class Productdetails extends StatefulWidget {
  const Productdetails({Key? key}) : super(key: key);

  @override
  State<Productdetails> createState() => _ProductdetailsState();
}

class _ProductdetailsState extends State<Productdetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Material App Bar'),
      ),
      body: Center(
        child: Container(
          child: const Text('Hello World'),
        ),
      ),
    );
  }
}
