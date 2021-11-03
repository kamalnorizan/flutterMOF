import 'package:flutter/material.dart';

class Productform extends StatefulWidget {
  const Productform({Key? key}) : super(key: key);

  @override
  State<Productform> createState() => _ProductformState();
}

class _ProductformState extends State<Productform> {
  TextEditingController nameController = TextEditingController();

  TextEditingController descriptionController = TextEditingController();

  TextEditingController priceController = TextEditingController();

  TextEditingController imageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create New Product'),
      ),
      body: Center(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(children: [
              TextField(
                controller: nameController,
                decoration: const InputDecoration(
                    border: InputBorder.none, hintText: 'Name'),
              ),
              TextField(
                controller: descriptionController,
                decoration: const InputDecoration(
                    border: InputBorder.none, hintText: 'Description'),
              ),
              TextField(
                controller: priceController,
                decoration: const InputDecoration(
                    border: InputBorder.none, hintText: 'Price'),
              ),
              TextField(
                controller: imageController,
                decoration: const InputDecoration(
                    border: InputBorder.none, hintText: 'Product Image'),
              ),
              ElevatedButton(
                onPressed: () {},
                child: const Text('Create'),
              )
            ]),
          ),
        ),
      ),
    );
  }
}
