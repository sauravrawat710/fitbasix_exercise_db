import 'package:fitbasix_exercise_db/controllers/exercise_controller.dart';
import 'package:fitbasix_exercise_db/models/exercise.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ExerciseListScreen extends StatelessWidget {
  ExerciseListScreen({super.key});

  final ExercisesController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Exercise List')),
      body: Obx(
        () {
          if (controller.exercises.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          }
          return ListView.builder(
            itemCount: controller.exercises.length,
            itemBuilder: (context, index) {
              final Exercise exercise = controller.exercises[index];
              return Card(
                elevation: 2.0,
                margin:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                child: ListTile(
                  leading: Image.network(exercise.gifUrl,
                      width: 50, height: 50), // Display the exercise GIF
                  title: Text(
                    exercise.name,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 4),
                      Text('Body Part: ${exercise.bodyPart}'),
                      const SizedBox(height: 4),
                      Text('Equipment: ${exercise.equipment}'),
                      const SizedBox(height: 4),
                      Text('Target: ${exercise.target}'),
                    ],
                  ),
                  trailing: const Icon(Icons.arrow_forward_ios),
                  onTap: () {
                    Get.toNamed('/exercise-details', arguments: exercise.id);
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}
