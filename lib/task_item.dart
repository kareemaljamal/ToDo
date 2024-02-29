import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TaskItem extends StatelessWidget {
  const TaskItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15)),
      margin: EdgeInsets.all(16),
      child: Slidable(
        startActionPane: ActionPane(
          motion: DrawerMotion(),
          extentRatio: .5,
          children: [
            SlidableAction(
              onPressed: (context) {},
              backgroundColor: Colors.red,
              autoClose: true,
              icon: Icons.delete,
              label: 'Delete',
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25),
                  bottomLeft: Radius.circular(25)),
            ),
            SlidableAction(
              onPressed: (context) {},
              backgroundColor: Colors.blue,
              autoClose: true,
              icon: Icons.edit,
              label: 'Edit',
            ),
          ],
        ),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15)),
          padding: EdgeInsets.all(16),
          child: Row(
            children: [
              Container(
                height: 100,
                width: 10,
                color: Colors.blue,
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Tilie',
                      style: TextStyle(fontSize: 24),
                    ),
                    Text(
                      'Description',
                      style: TextStyle(fontSize: 16),
                    )
                  ],
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: 18, vertical: 4),
                  decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.circular(14),
                      color: Colors.blue),
                  child: Icon(
                    Icons.done,
                    color: Colors.white,
                    size: 30,
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
