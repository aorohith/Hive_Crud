import 'package:class_room/add_student_widget.dart.dart';
import 'package:class_room/db/functions/db_functions.dart';
import 'package:class_room/list_student_widget.dart';
import 'package:flutter/material.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    getAllStudents();
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            AddStudentWidget(),
            const Expanded(child: ListStudentWidget()), 
          ],
        ),
      ),
    );
  }
}
