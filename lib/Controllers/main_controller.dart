import 'package:get/get.dart';
import 'package:student_db/Model/models.dart';
import 'package:hive/hive.dart';

class StudentController extends GetxController {
  late List<Students> _students;
  List<Students> get students => _students;
  late Box<dynamic> studentsBox;

  StudentController() {
    studentsBox = Hive.box('student_box');
    _students = [];
    for (var i = 0; i < studentsBox.values.length; i++) {
      _students.add(studentsBox.getAt(i)!);
    }
  }

  addStudent(Students student) {
    _students.add(student);
    studentsBox.add(student);
    update();
  }

  deleteStudent(int id) {
    int index = _students.indexWhere((element) => element.id == id);
    _students.removeWhere((element) => element.id == id);
    //studentsBox.delete(id);
    studentsBox.deleteAt(index);
    update();
  }

  updateStudent(int id, Students student) {
    int index = _students.indexWhere((element) => element.id == id);
    _students.removeWhere((element) => element.id == id);
    //_students.add(Students(name, course, phone, college));
    studentsBox.putAt(index, student);
    _students.add(student);
    update();
  }
}
