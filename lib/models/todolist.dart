import 'dart:convert';

List<Todolist> fromJson(String str) =>
    List<Todolist>.from(json.decode(str).map((x) => Todolist.fromJson(x)));

class Todolist {
  Todolist({
    required this.id,
    required this.title,
    required this.content,
    required this.dueDate,
  });
  late final int id;
  late final String title;
  late final String content;
  late final String dueDate;

  Todolist.fromJson(Map<String, dynamic> json) {
    id = json['id'];
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
