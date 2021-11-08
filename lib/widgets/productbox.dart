import 'package:flutter/material.dart';
import 'package:fluttertutorial/models/product.dart';
import 'package:fluttertutorial/models/todolist.dart';
import 'package:fluttertutorial/pages/product_details.dart';

class Productbox extends StatelessWidget {
  Productbox({Key? key, required this.todolist}) : super(key: key);

  Todolist todolist;
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
                  todolist.title.toString(),
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
                      'Title: ' + todolist.title.toString(),
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Center(
                        child: Text(
                      'Description: ' + todolist.content.toString(),
                      textAlign: TextAlign.center,
                    )),
                    Text('DueDate: ' + todolist.dueDate.toString()),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    Productdetails(todolist: todolist)));
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
