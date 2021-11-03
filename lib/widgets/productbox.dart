import 'package:flutter/material.dart';
import 'package:fluttertutorial/pages/product_details.dart';

class Productbox extends StatelessWidget {
  const Productbox(
      {Key? key, this.name, this.description, this.price, this.imageName})
      : super(key: key);
  final String? name;
  final String? description;
  final double? price;
  final String? imageName;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(2),
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
                  imageName.toString(),
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
                      'Name: ' + name.toString(),
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Center(
                        child: Text(
                      'Description: ' + description.toString(),
                      textAlign: TextAlign.center,
                    )),
                    Text('Price: ' + price.toString()),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Productdetails()));
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
