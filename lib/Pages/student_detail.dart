import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:student_db/Controllers/main_controller.dart';
import 'package:get/get.dart';
import 'package:student_db/Pages/edit_student.dart';

class StudentDetails extends StatelessWidget {
  final int index;
  const StudentDetails({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final studentDetailsS = GetInstance().find<StudentController>();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(studentDetailsS.students[index].name),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Container(
              height: 500,
              //width as item width
              width: MediaQuery.of(context).size.width,
              //width: ,
              child: Card(
                elevation: 5,
                child: Container(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Student Details',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextField(
                        decoration: InputDecoration(
                          labelText: 'Name',
                        ),
                        controller: TextEditingController(
                          text: studentDetailsS.students[index].name,
                        ),
                        enabled: false,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextField(
                        decoration: InputDecoration(
                          labelText: 'Course',
                        ),
                        controller: TextEditingController(
                          text: studentDetailsS.students[index].course,
                        ),
                        enabled: false,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextField(
                        decoration: InputDecoration(
                          labelText: 'Phone',
                        ),
                        controller: TextEditingController(
                          text: studentDetailsS.students[index].phone,
                        ),
                        enabled: false,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextField(
                        decoration: InputDecoration(
                          labelText: 'College',
                        ),
                        controller: TextEditingController(
                          text: studentDetailsS.students[index].college,
                        ),
                        enabled: false,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          ElevatedButton(
                            onPressed: () {
                              showDialog(
                                  context: context,
                                  builder: (BuildContext cxt) {
                                    return AlertDialog(
                                      title: Text('Delete'),
                                      content: Text(
                                          'Are you sure you want to delete ${studentDetailsS.students[index].name}?'),
                                      actions: <Widget>[
                                        TextButton(
                                          child: Text('OK'),
                                          onPressed: () {
                                            studentDetailsS.deleteStudent(
                                                studentDetailsS
                                                    .students[index].id);
                                            Get.back();
                                            Get.back();
                                          },
                                        ),
                                        TextButton(
                                          child: Text('Cancel'),
                                          onPressed: () {
                                            Get.back();
                                          },
                                        ),
                                      ],
                                    );
                                  });

                              //Navigator.pop(context);
                            },
                            child: Text('Delete'),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              // studentDetailsS.updateStudent(
                              //     studentDetailsS.students[index]);
                              Get.to(
                                EditStudent(index: index),
                              );
                              //Navigator.pop(context);
                            },
                            child: Text('Update'),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
