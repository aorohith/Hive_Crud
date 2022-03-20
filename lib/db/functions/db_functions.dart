import 'package:class_room/db/models/data_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:hive_flutter/hive_flutter.dart';

ValueNotifier<List<StudentModel>>studentListNotifier = ValueNotifier([]);

Future<void> addStudent(StudentModel student) async{
  final studentDB = await Hive.openBox<StudentModel>('student_db');
  final _id = await studentDB.add(student);
  student.id=_id;
  studentListNotifier.value.add(student);
  studentListNotifier.notifyListeners();
}

Future<void> getAllStudents()async{
  final studentDB = await Hive.openBox<StudentModel>('student_db');
  studentListNotifier.value.clear();

  studentListNotifier.value.addAll(studentDB.values);
  studentListNotifier.notifyListeners();
}

Future<void>deleteStudent(int id) async{
  final studentDB = await Hive.openBox<StudentModel>('student_db');
  await studentDB.delete(id);
  getAllStudents();
}