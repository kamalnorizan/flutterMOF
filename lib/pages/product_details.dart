import 'package:flutter/material.dart';
import 'package:fluttertutorial/models/product.dart';

class Productdetails extends StatefulWidget {
  Productdetails({Key? key, required this.product}) : super(key: key);
  var product = Product();
  @override
  State<Productdetails> createState() => _ProductdetailsState();
}

class _ProductdetailsState extends State<Productdetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.product.name.toString()),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(widget.product.description.toString()),
            Text(widget.product.price.toString()),
            Text(widget.product.imageName.toString())
          ],
        ),
      ),
    );
  }
}
