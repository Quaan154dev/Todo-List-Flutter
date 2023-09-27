import 'package:confirm_dialog/confirm_dialog.dart';
import 'package:flutter/material.dart';

class Task extends StatelessWidget {
  Task({
    super.key,
    required this.item,
    required this.handleDelete,
    required this.index,
  });
  // ignore: prefer_typing_uninitialized_variables
  var item; // tạo ra biến để hứng
  // ignore: prefer_typing_uninitialized_variables
  var index;
  final Function handleDelete;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      width: double.infinity,
      height: 70,
      decoration: BoxDecoration(
          color: (index % 2 == 0) ? Colors.red : Colors.green,
          borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("${item.name}",
                style: const TextStyle(
                    fontSize: 20,
                    color: Color(0xff4B4B4B),
                    fontWeight: FontWeight.bold)),
            // Text("${item.content}",
            //     style: const TextStyle(
            //         fontSize: 20,
            //         color: Color(0xff4B4B4B),
            //         fontWeight: FontWeight.bold)),
            InkWell(
              onTap: () async {
                if (await confirm(context)) {
                  handleDelete(item.id);
                  // return print('pressedOK');
                }
                return print('pressedCancel');
              },
              child: const Icon(
                Icons.delete,
                size: 30,
                color: Color(0xff4B4B4B),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
