import 'package:fitbasix_exercise_db/controllers/exercise_controller.dart';
import 'package:fitbasix_exercise_db/presentation/screens/exercise_detail_screen.dart';
import 'package:fitbasix_exercise_db/presentation/screens/exercise_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ExercisesController());
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Exercise App',
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => ExerciseListScreen()),
        GetPage(name: '/exercise-details', page: () => ExerciseDetailsScreen()),
      ],
    );
  }
}
