import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:student_db/Controllers/main_controller.dart';
import 'package:student_db/Pages/student_detail.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Student DataBase'),
        elevation: 0,
      ),
      body: GetBuilder(builder: (StudentController studentController) {
        final studentController = GetInstance().find<StudentController>();
        return ListView.builder(
          itemCount: studentController.students.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                elevation: 4,
                child: ListTile(
                  onTap: () {
                    // studentController.setCurrentStudent(studentController.students[index]);
                    //Get.toNamed('/student',arguments: studentController.students[index]);
                    Get.to(() => StudentDetails(index: index));
                  },
                  title: Text(studentController.students[index].name),
                  subtitle: Text(studentController.students[index].course),
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (BuildContext cxt) {
                            return AlertDialog(
                              title: Text('Delete'),
                              content: Text(
                                  'Are you sure you want to delete ${studentController.students[index].name}?'),
                              actions: <Widget>[
                                TextButton(
                                  child: Text('Yes'),
                                  onPressed: () {
                                    studentController.deleteStudent(
                                        studentController.students[index].id);
                                    Get.back();
                                  },
                                ),
                                TextButton(
                                  child: Text('No'),
                                  onPressed: () {
                                    Get.back();
                                  },
                                ),
                              ],
                            );
                          });
                      //studentController.deleteStudent(studentController.students[index]);
                    },
                  ),
                ),
              ),
            );
          },
        );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed('/add');
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
