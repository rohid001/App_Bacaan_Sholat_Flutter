import 'package:flutter/material.dart';
import '../model/todo_model.dart';

class TodoListProvider with ChangeNotifier {
  List<TodoModel> _todolist = [];

  List<TodoModel> get todoList => _todolist;

  void addTodo(TodoModel list) {
    _todolist.add(list);
    notifyListeners();
  }

  void removeTodo(TodoModel list) {
    _todolist = _todolist.where((item) => item.id != list.id).toList();
    notifyListeners();
  }

  void updateTodo(TodoModel list) {
    _todolist[_todolist.indexWhere((item) => item.id == list.id)] = list;
    notifyListeners();
  }
}
