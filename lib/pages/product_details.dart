import 'package:flutter/material.dart';

class Productdetails extends StatefulWidget {
  const Productdetails(
      {Key? key, this.name, this.description, this.price, this.imageName})
      : super(key: key);
  final String? name;
  final String? description;
  final double? price;
  final String? imageName;
  @override
  State<Productdetails> createState() => _ProductdetailsState();
}

class _ProductdetailsState extends State<Productdetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.name.toString()),
      ),
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(widget.description.toString()),
              Text(widget.price.toString()),
              Text(widget.imageName.toString())
            ],
          ),
        ),
      ),
    );
  }
}
