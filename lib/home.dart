import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:fluttertutorial/models/product.dart';
import 'package:fluttertutorial/pages/productform.dart';
import 'package:fluttertutorial/services/api.dart';
import 'package:fluttertutorial/widgets/productbox.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'models/todolist.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  List<Todolist>? todolists;

  void initState() {
    super.initState();
    print('log here');
    loadTodoList();
  }

  // List<Product> products = [
  //   Product(
  //       name: 'iPhone',
  //       description: 'iPhone is the most expensive phone ever',
  //       price: 4000,
  //       imageName: 'iPhone'),
  //   Product(
  //       name: 'Laptop',
  //       description: 'Laptop is most productive development tool',
  //       price: 2500,
  //       imageName: 'Laptop'),
  //   Product(
  //     name: 'Tablet',
  //     description: 'Tablet is most productive development tool',
  //     price: 2300,
  //     imageName: 'Tablet',
  //   ),
  //   Product(
  //     name: 'Pendrive',
  //     description: 'Pendrive is a storage medium',
  //     price: 20,
  //   ),
  // ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Home Page'),
        ),
        drawer: Drawer(
          child: ListView(
            children: [
              const DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.blueGrey,
                ),
                child: Text('My First Apps'),
              ),
              ListTile(
                leading: const Icon(
                  Icons.vpn_key,
                ),
                title: const Text('Logout'),
                onTap: () async {
                  SharedPreferences localStorage =
                      await SharedPreferences.getInstance();
                  localStorage.remove('token');
                  Navigator.pushReplacementNamed(context, '/login');
                },
              )
            ],
          ),
        ),
        body: ListView.builder(
            itemCount: todolists!.length,
            itemBuilder: (BuildContext ctxt, int index) {
              return Slidable(
                actionPane: const SlidableDrawerActionPane(),
                child: Productbox(
                  todolist: todolists![index],
                ),
                secondaryActions: [
                  IconSlideAction(
                    caption: 'Delete',
                    color: Colors.redAccent,
                    icon: Icons.delete,
                    onTap: () {
                      setState(() {
                        todolists?.removeAt(index);
                      });
                    },
                  )
                ],
              );
            }),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () async {
            final todolist = await Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Productform()),
            );
            setState(() {
              todolists?.add(todolist);
            });
          },
        ),
      ),
    );
  }

  loadTodoList() async {
    var response = await Callapi().getData('todolist');
    print(response);
    var body = json.decode(response.body);
    setState(() {
      todolists = fromJson(json.encode(body['success']['todolist']));
    });
  }
}
