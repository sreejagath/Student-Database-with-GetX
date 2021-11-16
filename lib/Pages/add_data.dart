import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:student_db/Controllers/main_controller.dart';
import 'package:student_db/Model/models.dart';

class AddStudent extends StatelessWidget {
  const AddStudent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final studentControllerM = GetInstance().find<StudentController>();
    TextEditingController nameController = TextEditingController();
    TextEditingController courseController = TextEditingController();
    TextEditingController phoneController = TextEditingController();
    TextEditingController collegeController = TextEditingController();
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
                child: Text('Add'),
                onPressed: () {
                  studentControllerM.addStudent(Students(
                      nameController.text,
                      courseController.text,
                      phoneController.text,
                      collegeController.text));
                  Navigator.pop(context);
                },
              )
            ]),
          ),
        ));
  }
}
