import 'package:flutter/material.dart';
import 'package:fluttertutorial/models/product.dart';
import 'package:fluttertutorial/pages/product_details.dart';

class Productbox extends StatelessWidget {
  Productbox({Key? key, required this.product}) : super(key: key);

  var product = Product();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(2),
      height: 130,
      child: Card(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              width: 110,
              height: 110,
              alignment: AlignmentDirectional.centerStart,
              decoration: const BoxDecoration(
                color: Colors.red,
              ),
              child: Center(
                child: Text(
                  product.imageName.toString(),
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      'Name: ' + product.name.toString(),
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Center(
                        child: Text(
                      'Description: ' + product.description.toString(),
                      textAlign: TextAlign.center,
                    )),
                    Text('Price: ' + product.price.toString()),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    Productdetails(product: product)));
                      },
                      child: const Text('View Details'),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
