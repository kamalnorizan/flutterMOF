import 'package:flutter/material.dart';
import 'package:fluttertutorial/models/todolist.dart';

class Productdetails extends StatefulWidget {
  Productdetails({Key? key, required this.todolist}) : super(key: key);
  // var product = Todolist();
  Todolist todolist;
  @override
  State<Productdetails> createState() => _ProductdetailsState();
}

class _ProductdetailsState extends State<Productdetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(30, 50, 30, 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    height: 50,
                    width: 50,
                    child: const Icon(
                      Icons.arrow_back_ios,
                      size: 24,
                      color: Colors.black87,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black87,
                      ),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                  ),
                ),
                const Text(
                  'Product Detail',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Container(
                  height: 24,
                  width: 24,
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(0, 0, 0, 50),
            child: Stack(
              children: [
                const CircleAvatar(
                  radius: 70,
                ),
                Positioned(
                  bottom: 1,
                  right: 1,
                  child: Container(
                    height: 40,
                    width: 40,
                    decoration: const BoxDecoration(
                      color: Colors.deepOrange,
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
                gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [
                    Colors.black54,
                    Color.fromRGBO(0, 41, 102, 1),
                  ],
                ),
              ),
            ),
          ),
          // Text(widget.product.description.toString()),
          // Text(widget.product.price.toString()),
          // Text(widget.product.imageName.toString())
        ],
      ),
    );
  }
}
