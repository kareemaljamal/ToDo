import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';
import 'package:to_do_app/task_item.dart';

class Tasks extends StatelessWidget {
  const Tasks({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        DatePicker(
          DateTime.now(),
          initialSelectedDate: DateTime.now(),
          selectionColor: Colors.blue,
          height: 90,
          locale: 'en',
          selectedTextColor: Colors.white,
          onDateChange: (date) {
            // New date selected
          },
        ),
        Expanded(
          child: ListView.builder(
            itemBuilder: (context, index) {
              return TaskItem();
            },
            itemCount: 10,
          ),
        )
      ],
    );
  }
}
