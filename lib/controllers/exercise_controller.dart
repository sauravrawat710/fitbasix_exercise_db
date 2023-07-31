import 'package:fitbasix_exercise_db/models/exercise.dart';
import 'package:fitbasix_exercise_db/services/exercise_service.dart';
import 'package:get/get.dart';

class ExercisesController extends GetxController {
  final exercises = <Exercise>[].obs;
  final exerciseDetail = Exercise.empty().obs;

  @override
  void onInit() {
    fetchExercises();
    super.onInit();
  }

  void fetchExercises() async {
    try {
      final response = await ExerciseService.fetchAllExercises();
      exercises.value = exerciseFromMap(response);
    } catch (e) {
      print('Error fetching exercises: $e');
    }
  }

  void fetchExerciseById(String id) async {
    try {
      final response = await ExerciseService.fetchExerciseById(id);
      exerciseDetail.value = Exercise.fromMap(response);
    } catch (e) {
      print('Error fetching exercise details: $e');
    }
  }
}
