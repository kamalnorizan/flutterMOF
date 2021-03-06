import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
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
  List<Todolist>? todolists;
  var _isLoading = true;

  @override
  void initState() {
    super.initState();
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
          actions: [
            ElevatedButton.icon(
              onPressed: () {
                loadTodoList();
                _isLoading = true;
              },
              icon: const Icon(
                Icons.refresh,
              ),
              label: const Text('Reload'),
            )
          ],
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
        body: _isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
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
                          deleteTodoList(todolists![index].id, context);
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
    // print(response);
    var body = json.decode(response.body);
    setState(() {
      todolists = fromJson(json.encode(body['success']['todolist']));
      _isLoading = false;
    });
  }

  deleteTodoList(id, BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext ctx) {
          return AlertDialog(
            title: const Text('Please Confirm'),
            content: const Text('Are you sure you want to remove this item?'),
            actions: [
              TextButton(
                onPressed: () async {
                  var data = {};
                  var res = await Callapi()
                      .postWithToken(data, 'todolist/delete/$id');
                  loadTodoList();
                  Navigator.of(context).pop();
                },
                child: const Text('Yes'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('No'),
              ),
            ],
          );
        });
  }
}
