import 'package:bacaan_sholat/widgets/add_edit_todo.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/todo_provider.dart';

class HomeTodo extends StatelessWidget {
  const HomeTodo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[700],
        centerTitle: true,
        title: const Text("Todo Syariah"),
      ),
      body: Consumer<TodoListProvider>(builder: (
        context,
        todoProvider,
        child,
      ) {
        return ListView(
          padding: const EdgeInsets.all(20.0),
          children: todoProvider.todoList.isNotEmpty
              ? todoProvider.todoList.map((todo) {
                  return Dismissible(
                    key: Key(todo.id),
                    background: Container(
                      color: Colors.red.shade300,
                      child: const Center(
                        child: Text(
                          "Delete?",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    child: Card(
                      child: ListTile(
                        title: Text(todo.todo),
                        onTap: () {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return AddEditList(
                                  title: "Edit List",
                                  todo: todo,
                                );
                              });
                        },
                      ),
                    ),
                    onDismissed: (direction) {
                      Provider.of<TodoListProvider>(
                        context,
                        listen: false,
                      ).removeTodo(todo);
                    },
                  );
                }).toList()
              : [
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height - 100.0,
                    child: const Center(
                      child: Text(
                        "List is still empty",
                        textAlign: TextAlign.center,
                      ),
                    ),
                  )
                ],
        );
      }),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green[700],
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) {
                return const AddEditList(title: 'Add Todo Todo');
              });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
