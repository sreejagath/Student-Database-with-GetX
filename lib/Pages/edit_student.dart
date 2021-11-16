import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:student_db/Controllers/main_controller.dart';
import 'package:student_db/Model/models.dart';

class EditStudent extends StatelessWidget {
  final int index;
  const EditStudent({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final studentControllerK = GetInstance().find<StudentController>();
    TextEditingController nameController =
        TextEditingController(text: studentControllerK.students[index].name);
    TextEditingController courseController =
        TextEditingController(text: studentControllerK.students[index].course);
    TextEditingController phoneController =
        TextEditingController(text: studentControllerK.students[index].phone);
    TextEditingController collegeController =
        TextEditingController(text: studentControllerK.students[index].college);
    return Scaffold(
        appBar: AppBar(
          title: Text('Add Student'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            child: Column(children: <Widget>[
              TextField(
                controller: nameController,
                decoration: InputDecoration(
                  labelText: 'Name',
                ),
              ),
              TextField(
                controller: courseController,
                decoration: InputDecoration(
                  labelText: 'Course',
                ),
              ),
              TextField(
                controller: phoneController,
                decoration: InputDecoration(
                  labelText: 'Phone',
                ),
              ),
              TextField(
                controller: collegeController,
                decoration: InputDecoration(
                  labelText: 'College',
                ),
              ),
              ElevatedButton(
                child: Text('Update'),
                onPressed: () {
                  studentControllerK.updateStudent(
                      studentControllerK.students[index].id, Students(
                          nameController.text,
                          courseController.text,
                          phoneController.text,
                          collegeController.text
                      ));
                  Navigator.pop(context);
                  Get.back();
                },
              )
            ]),
          ),
        ));
  }
}
