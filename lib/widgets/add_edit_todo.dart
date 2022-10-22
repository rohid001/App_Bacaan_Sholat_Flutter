import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/todo_provider.dart';
import '../model/todo_model.dart';
import '../widgets/info_widget.dart';

class AddEditList extends StatelessWidget {
  //const AddEditTodoWidget({ Key? key }) : super(key: key);
  final String title;
  final TodoModel? todo;
  const AddEditList({
    Key? key,
    required this.title,
    this.todo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference todos = firestore.collection('todos');

    final TextEditingController _todoController = TextEditingController();
    if (todo != null) {
      _todoController.text = todo!.todo;
    }
    return AlertDialog(
      title: Text(title),
      content: SingleChildScrollView(
        child: Column(
          children: [
            TextField(
              controller: _todoController,
              textCapitalization: TextCapitalization.sentences,
              decoration: InputDecoration(
                border: InputBorder.none,
                filled: true,
                isDense: true,
                fillColor: Colors.grey.shade100,
                labelText: "List",
                hintText: "Insert List",
              ),
            )
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          style: TextButton.styleFrom(
            primary: Colors.green[700],
          ),
          child: const Text("Cancel"),
        ),
        TextButton(
          onPressed: () {
            if (_todoController.text.isEmpty) {
              showDialog(
                context: context,
                builder: (context) {
                  return const InfoWidget(
                    title: "Error",
                    content: "Error, list cannot be empty",
                  );
                },
              );
            } else {
              if (todo != null) {
                Provider.of<TodoListProvider>(context, listen: false)
                    .updateTodo(
                  TodoModel(
                    id: todo!.id,
                    todo: _todoController.text,
                  ),
                );
              } else {
                const uuid = Uuid();
                Provider.of<TodoListProvider>(context, listen: false).addTodo(
                  TodoModel(
                    id: uuid.v4(),
                    todo: _todoController.text,
                  ),
                );
              }
              Navigator.pop(context);
            }
            todos.add({
              'todo': _todoController.text,
            });
            _todoController.text = '';
          },
          style: TextButton.styleFrom(
            primary: Colors.green[700],
          ),
          child: const Text("Save"),
        )
      ],
    );
  }
}
