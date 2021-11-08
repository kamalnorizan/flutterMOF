import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:fluttertutorial/models/todolist.dart';
import 'package:fluttertutorial/services/api.dart';
import 'package:intl/intl.dart';

class Productform extends StatefulWidget {
  const Productform({Key? key}) : super(key: key);

  @override
  State<Productform> createState() => _ProductformState();
}

class _ProductformState extends State<Productform> {
  TextEditingController titleController = TextEditingController();

  TextEditingController descriptionController = TextEditingController();

  TextEditingController duedateController = TextEditingController();

  String? selectedDate;

  Todolist todolist = Todolist();

  @override
  void initState() {
    super.initState();
    // selectedDate = DateFormat('dd-MM-yyyy')
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create New Product'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(children: [
            TextField(
              controller: titleController,
              decoration: const InputDecoration(
                  border: InputBorder.none, hintText: 'Title'),
            ),
            TextField(
              controller: descriptionController,
              decoration: const InputDecoration(
                  border: InputBorder.none, hintText: 'Description'),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  DatePicker.showDatePicker(context,
                      minTime: DateTime(2021, 11, 08),
                      showTitleActions: true, onChanged: (date) {
                    setState(() {
                      selectedDate =
                          DateFormat("dd-MM-yyyy").format(date).toString();
                    });
                  });
                },
                child: selectedDate != null
                    ? Text(
                        selectedDate.toString(),
                      )
                    : const Text(
                        'Please select due Date',
                      ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                todolist = Todolist(
                    title: titleController.text,
                    content: descriptionController.text,
                    dueDate: selectedDate.toString());

                _storeTodo();
                Navigator.pop(context, todolist);
              },
              child: const Text('Create'),
            )
          ]),
        ),
      ),
    );
  }

  _storeTodo() async {
    var data = {
      'title': titleController.text,
      'content': descriptionController.text,
      'due_date': DateFormat("yyyy-MM-dd")
          .format(DateFormat('dd-MM-yyyy').parse(selectedDate.toString()))
          .toString()
    };

    await Callapi().postWithToken(data, 'todolist/store');
  }
}
