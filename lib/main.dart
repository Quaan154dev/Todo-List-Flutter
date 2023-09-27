import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:todo_list_pra/models/item.dart';
import 'widgets/card_model_bottom.dart';
import 'widgets/task.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: MyApp1(),
    );
  }
}

class MyApp1 extends StatefulWidget {
  const MyApp1({super.key});

  @override
  State<MyApp1> createState() => _MyApp1State();
}

class _MyApp1State extends State<MyApp1> {
  final List<DataItem> items = []; // List chứa các item
  // items.add();

  void _handleAddTask(String name) {
    print(name);
    final newItem = DataItem(
      id: DateTime.now().toString(),
      name: name,
    );

    if (name.isEmpty) {
      Alert(context: context, title: "ALERT", desc: "PLEASE WRITE TASK !")
          .show();
    } else {
      items.add(newItem);
      setState(() {
        name = newItem.name;
      });
    }
  }

  void handleDeleteTask(String id) {
    setState(() {
      items.removeWhere((item) => item.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    print(context);
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("ToDoList", style: TextStyle(fontSize: 40)),
          backgroundColor: Colors.blue,
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          scrollDirection: Axis.vertical,
          child: Column(
            children: items
                .map((e) => Task(
                      index: items.indexOf(e),
                      item: e,
                      handleDelete: handleDeleteTask,
                    ))
                .toList(), // để trã về danh sách
            // để lấy biến name gán vào text
            // duyệt qua các pt trong mảng items,
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showModalBottomSheet(
              backgroundColor: Colors.grey[400],
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
              ),
              isScrollControlled: true,
              context: context, // Parameter thứ 1 trong showModalBottomSheet
              builder: (BuildContext context) {
                // Parameter thứ 2 trong showModalBottomSheet
                // print(context);
                return ModelBottom(addTask: _handleAddTask);
              },
            );
          },
          child: const Icon(
            Icons.add,
            size: 40,
          ),
        ));
  }
}
