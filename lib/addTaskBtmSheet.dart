import 'package:flutter/material.dart';
import 'package:to_do_app/firebase/firebase_fuctions.dart';
import 'package:to_do_app/model/task_model.dart';

class AddTaskBottomSheet extends StatefulWidget {
  AddTaskBottomSheet({super.key});

  @override
  State<AddTaskBottomSheet> createState() =>
      _AddTaskBottomSheetState();
}

class _AddTaskBottomSheetState
    extends State<AddTaskBottomSheet> {
  DateTime choosenDate = DateTime.now();
  TextEditingController titleController =
      TextEditingController();
  TextEditingController descriptionController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Add New Task',
            style: TextStyle(
                fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 10,
          ),
          TextField(
            controller: titleController,
            decoration: InputDecoration(
                label: Text('Title'),
                focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Colors.blue),
                    borderRadius:
                        BorderRadius.circular(20)),
                enabledBorder: OutlineInputBorder(
                    borderRadius:
                        BorderRadius.circular(20))),
          ),
          SizedBox(
            height: 10,
          ),
          TextField(
            controller: descriptionController,
            decoration: InputDecoration(
                label: Text('Description'),
                focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Colors.blue),
                    borderRadius:
                        BorderRadius.circular(20)),
                enabledBorder: OutlineInputBorder(
                    borderRadius:
                        BorderRadius.circular(20))),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            alignment: Alignment.centerLeft,
            child: Text(
              'Select Time',
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          InkWell(
            onTap: () {
              selectDate(context);
            },
            child: Text(
              '${choosenDate.toString().substring(0, 10)}',
              style: TextStyle(
                fontSize: 30,
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue),
              onPressed: () {
                TaskModel task = TaskModel(
                    date:
                        choosenDate.millisecondsSinceEpoch,
                    description: descriptionController.text,
                    title: titleController.text);
                FirebaseFunctions.addTask(task);
                Navigator.pop(context);
              },
              child: Text(
                'Add Task',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ))
        ],
      ),
    );
  }

  selectDate(BuildContext context) async {
    DateTime? selectedDate = await showDatePicker(
        onDatePickerModeChange: (value) {},
        initialDate: choosenDate,
        context: context,
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(Duration(days: 365)));
    if (selectedDate != null) {
      choosenDate = selectedDate;
      setState(() {});
    }
  }
}
