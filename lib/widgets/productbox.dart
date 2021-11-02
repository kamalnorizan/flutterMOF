import 'package:flutter/material.dart';

class Productbox extends StatelessWidget {
  const Productbox({Key? key}) : super(key: key);

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
              decoration: BoxDecoration(
                color: Colors.red,
              ),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const [
                    Text('Text 1'),
                    Text('Text 2'),
                    Text('Text 3'),
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
