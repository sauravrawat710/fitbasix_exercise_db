import 'package:fitbasix_exercise_db/controllers/exercise_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ExerciseDetailsScreen extends StatefulWidget {
  const ExerciseDetailsScreen({super.key});

  @override
  State<ExerciseDetailsScreen> createState() => _ExerciseDetailsScreenState();
}

class _ExerciseDetailsScreenState extends State<ExerciseDetailsScreen> {
  final ExercisesController controller = Get.find();

  @override
  void initState() {
    final exerciseId = Get.arguments;
    controller.fetchExerciseById(exerciseId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        title: const Text('Exercise Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Obx(
          () {
            if (controller.exerciseDetail.value.id != Get.arguments) {
              return const Center(child: CircularProgressIndicator());
            }

            final exercise = controller.exerciseDetail.value;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  exercise.name,
                  style: const TextStyle(
                      fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),
                Image.network(
                  exercise.gifUrl,
                  width: MediaQuery.of(context).size.width - 32,
                  height: 200,
                  fit: BoxFit.cover,
                ),
                const SizedBox(height: 16),
                Text(
                  'Body Part: ${exercise.bodyPart}',
                  style: const TextStyle(fontSize: 18),
                ),
                const SizedBox(height: 8),
                Text(
                  'Equipment: ${exercise.equipment}',
                  style: const TextStyle(fontSize: 18),
                ),
                const SizedBox(height: 8),
                Text(
                  'Target: ${exercise.target}',
                  style: const TextStyle(fontSize: 18),
                ),
                // Add more exercise details as needed
              ],
            );
          },
        ),
      ),
    );
  }
}
