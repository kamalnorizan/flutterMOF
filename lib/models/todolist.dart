import 'dart:convert';

List<Todolist> fromJson(String str) =>
    List<Todolist>.from(json.decode(str).map((x) => Todolist.fromJson(x)));

class Todolist {
  Todolist({
    this.id,
    this.title,
    this.content,
    this.dueDate,
  });
  String? id;
  String? title;
  String? content;
  String? dueDate;

  Todolist.fromJson(Map<String, dynamic> json) {
    id = json['id'].toString();
    title = json['title'];
    content = json['content'];
    dueDate = json['due_date'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['title'] = title;
    _data['content'] = content;
    _data['due_date'] = dueDate;
    return _data;
  }
}
