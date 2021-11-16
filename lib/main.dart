import 'package:flutter/material.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/route_manager.dart';
import 'package:student_db/Controllers/main_controller.dart';
import 'package:student_db/Model/models.dart';
import 'package:student_db/Pages/add_data.dart';
import 'package:student_db/Pages/student_detail.dart';
import '../Pages/homescreen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter<Students>(StudentsAdapter());
  await Hive.openBox('student_box');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final studentController =
        GetInstance().put<StudentController>(StudentController());
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/add': (context) => const AddStudent(),
      },
      theme: ThemeData(
          fontFamily: GoogleFonts.montserrat().fontFamily,
          primaryColor: Colors.black,
          primarySwatch: Colors.blueGrey,
          textTheme:
              const TextTheme(bodyText2: TextStyle(color: Colors.blueGrey))),
      home: const HomeScreen(),
    );
  }
}
