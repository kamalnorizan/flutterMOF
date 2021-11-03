import 'package:flutter/material.dart';
import 'package:fluttertutorial/models/product.dart';
import 'package:fluttertutorial/widgets/productbox.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Product> products = [
    Product(
        name: 'iPhone',
        description: 'iPhone is the most expensive phone ever',
        price: 4000,
        imageName: 'iPhone'),
    Product(
        name: 'Laptop',
        description: 'Laptop is most productive development tool',
        price: 2500,
        imageName: 'Laptop'),
    Product(
      name: 'Tablet',
      description: 'Tablet is most productive development tool',
      price: 2300,
      imageName: 'Tablet',
    ),
    Product(
      name: 'Pendrive',
      description: 'Pendrive is a storage medium',
      price: 20,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
          appBar: AppBar(
            title: const Text('Home Page'),
          ),
          body: ListView(
            shrinkWrap: true,
            padding: const EdgeInsets.fromLTRB(2.0, 10.0, 2.0, 10.0),
            children: [
              Productbox(
                product: Product(
                    name: 'iPhone',
                    description: 'iPhone is the most expensive phone ever',
                    price: 4000,
                    imageName: 'iPhone'),
              ),
              Productbox(
                product: Product(
                    name: 'Laptop',
                    description: 'Laptop is most productive development tool',
                    price: 2500,
                    imageName: 'Laptop'),
              ),
              Productbox(
                product: Product(
                  name: 'Tablet',
                  description: 'Tablet is most productive development tool',
                  price: 2300,
                  imageName: 'Tablet',
                ),
              ),
              Productbox(
                product: Product(
                  name: 'Pendrive',
                  description: 'Pendrive is a storage medium',
                  price: 20,
                ),
              ),
            ],
          )),
    );
  }
}
