import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:to_do_app/AddTaskBtmSheet.dart';
import 'package:to_do_app/tabs/settings.dart';
import 'package:to_do_app/tabs/tasks.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});
  static const String routeName = 'home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int index = 0;

  List<Widget> tabs = [Tasks(), Settings()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: Color.fromRGBO(223, 236, 219, 1),
      appBar: AppBar(
        backgroundColor: Color(0XFF5D9CEC),
        title: Text(
          'ToDo',
          style: GoogleFonts.poppins(
              fontWeight: FontWeight.w700,
              color: Colors.white,
              fontSize: 22),
        ),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.blue,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30)),
          onPressed: () {
            showModalBottomSheet(
                isScrollControlled: true,
                context: context,
                builder: (context) {
                  return Container(
                      padding: EdgeInsets.only(
                          bottom: MediaQuery.of(context)
                              .viewInsets
                              .bottom),
                      child: AddTaskBottomSheet());
                });
          },
          child: Icon(
            Icons.add,
            color: Colors.white,
          )),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        elevation: 0,
        height: 83,
        notchMargin: 5,
        clipBehavior: Clip.antiAlias,
        shape: CircularNotchedRectangle(),
        child: BottomNavigationBar(
          currentIndex: index,
          onTap: (value) {
            index = value;
            setState(() {});
          },
          elevation: 0,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.menu), label: ""),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings), label: ""),
          ],
        ),
      ),
      body: tabs[index],
    );
  }
}
