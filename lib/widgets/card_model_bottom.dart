import 'package:flutter/material.dart';

class ModelBottom extends StatelessWidget {
  ModelBottom({
    super.key,
    required this.addTask,
  });

  final Function addTask;
  TextEditingController controller1 = TextEditingController();
  // TextEditingController controller2 = new TextEditingController();

  void _handleOnClick(BuildContext context) {
    // để bắt event
    var name = controller1.text;
    // var content = controller2.text;

    // addTask(content);
    addTask(name); // đẩy data vào handleAddTask
    print(name);
    Navigator.pop(context); // nhập xong ô nhập ẩn đi (trở về trang chủ)
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: MediaQuery.of(context)
          .viewInsets, // đẩy TextField cao hơn keyboard lên
      child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              TextField(
                controller: controller1,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Your Task",
                    hintText: "Your Task"),
              ),
              const SizedBox(height: 20),
              // TextField(
              //   controller: controller2,
              //   decoration: const InputDecoration(
              //       border: OutlineInputBorder(),
              //       labelText: "Your Content",
              //       hintText: "Your Content"),
              // ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    _handleOnClick(context);
                  },
                  child: const Text("Add Task", style: TextStyle(fontSize: 24)),
                ),
              )
            ],
          )),
    );
  }
}
