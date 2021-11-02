import 'package:flutter/material.dart';

class Productbox extends StatelessWidget {
  const Productbox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(2),
      height: 50,
      child: Card(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              width: 180,
              height: 180,
              decoration: BoxDecoration(
                color: Colors.red,
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                Text('Text 1'),
                Text('Text 2'),
                Text('Text 3'),
              ],
            )
          ],
        ),
      ),
    );
  }
}
