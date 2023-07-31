// ignore_for_file: constant_identifier_names

import 'dart:convert';

List<Exercise> exerciseFromMap(String str) =>
    List<Exercise>.from(json.decode(str).map((x) => Exercise.fromMap(x)));

String exerciseToMap(List<Exercise> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class Exercise {
  final BodyPart bodyPart;
  final Equipment equipment;
  final String gifUrl;
  final String id;
  final String name;
  final Target target;

  Exercise({
    required this.bodyPart,
    required this.equipment,
    required this.gifUrl,
    required this.id,
    required this.name,
    required this.target,
  });

  Exercise copyWith({
    BodyPart? bodyPart,
    Equipment? equipment,
    String? gifUrl,
    String? id,
    String? name,
    Target? target,
  }) =>
      Exercise(
        bodyPart: bodyPart ?? this.bodyPart,
        equipment: equipment ?? this.equipment,
        gifUrl: gifUrl ?? this.gifUrl,
        id: id ?? this.id,
        name: name ?? this.name,
        target: target ?? this.target,
      );

  factory Exercise.empty() => Exercise(
        bodyPart: BodyPart.BACK,
        equipment: Equipment.ASSISTED,
        gifUrl: '',
        id: '',
        name: '',
        target: Target.ABS,
      );

  factory Exercise.fromMap(Map<String, dynamic> json) => Exercise(
        bodyPart: bodyPartValues.map[json["bodyPart"]]!,
        equipment: equipmentValues.map[json["equipment"]]!,
        gifUrl: json["gifUrl"],
        id: json["id"],
        name: json["name"],
        target: targetValues.map[json["target"]]!,
      );

  Map<String, dynamic> toMap() => {
        "bodyPart": bodyPartValues.reverse[bodyPart],
        "equipment": equipmentValues.reverse[equipment],
        "gifUrl": gifUrl,
        "id": id,
        "name": name,
        "target": targetValues.reverse[target],
      };
}

enum BodyPart {
  BACK,
  CARDIO,
  CHEST,
  LOWER_ARMS,
  LOWER_LEGS,
  NECK,
  SHOULDERS,
  UPPER_ARMS,
  UPPER_LEGS,
  WAIST
}

final bodyPartValues = EnumValues({
  "back": BodyPart.BACK,
  "cardio": BodyPart.CARDIO,
  "chest": BodyPart.CHEST,
  "lower arms": BodyPart.LOWER_ARMS,
  "lower legs": BodyPart.LOWER_LEGS,
  "neck": BodyPart.NECK,
  "shoulders": BodyPart.SHOULDERS,
  "upper arms": BodyPart.UPPER_ARMS,
  "upper legs": BodyPart.UPPER_LEGS,
  "waist": BodyPart.WAIST
});

enum Equipment {
  ASSISTED,
  BAND,
  BARBELL,
  BODY_WEIGHT,
  BOSU_BALL,
  CABLE,
  DUMBBELL,
  ELLIPTICAL_MACHINE,
  EZ_BARBELL,
  HAMMER,
  KETTLEBELL,
  LEVERAGE_MACHINE,
  MEDICINE_BALL,
  OLYMPIC_BARBELL,
  RESISTANCE_BAND,
  ROLLER,
  ROPE,
  SKIERG_MACHINE,
  SLED_MACHINE,
  SMITH_MACHINE,
  STABILITY_BALL,
  STATIONARY_BIKE,
  STEPMILL_MACHINE,
  TIRE,
  TRAP_BAR,
  UPPER_BODY_ERGOMETER,
  WEIGHTED,
  WHEEL_ROLLER
}

final equipmentValues = EnumValues({
  "assisted": Equipment.ASSISTED,
  "band": Equipment.BAND,
  "barbell": Equipment.BARBELL,
  "body weight": Equipment.BODY_WEIGHT,
  "bosu ball": Equipment.BOSU_BALL,
  "cable": Equipment.CABLE,
  "dumbbell": Equipment.DUMBBELL,
  "elliptical machine": Equipment.ELLIPTICAL_MACHINE,
  "ez barbell": Equipment.EZ_BARBELL,
  "hammer": Equipment.HAMMER,
  "kettlebell": Equipment.KETTLEBELL,
  "leverage machine": Equipment.LEVERAGE_MACHINE,
  "medicine ball": Equipment.MEDICINE_BALL,
  "olympic barbell": Equipment.OLYMPIC_BARBELL,
  "resistance band": Equipment.RESISTANCE_BAND,
  "roller": Equipment.ROLLER,
  "rope": Equipment.ROPE,
  "skierg machine": Equipment.SKIERG_MACHINE,
  "sled machine": Equipment.SLED_MACHINE,
  "smith machine": Equipment.SMITH_MACHINE,
  "stability ball": Equipment.STABILITY_BALL,
  "stationary bike": Equipment.STATIONARY_BIKE,
  "stepmill machine": Equipment.STEPMILL_MACHINE,
  "tire": Equipment.TIRE,
  "trap bar": Equipment.TRAP_BAR,
  "upper body ergometer": Equipment.UPPER_BODY_ERGOMETER,
  "weighted": Equipment.WEIGHTED,
  "wheel roller": Equipment.WHEEL_ROLLER
});

enum Target {
  ABDUCTORS,
  ABS,
  ADDUCTORS,
  BICEPS,
  CALVES,
  CARDIOVASCULAR_SYSTEM,
  DELTS,
  FOREARMS,
  GLUTES,
  HAMSTRINGS,
  LATS,
  LEVATOR_SCAPULAE,
  PECTORALS,
  QUADS,
  SERRATUS_ANTERIOR,
  SPINE,
  TRAPS,
  TRICEPS,
  UPPER_BACK
}

final targetValues = EnumValues({
  "abductors": Target.ABDUCTORS,
  "abs": Target.ABS,
  "adductors": Target.ADDUCTORS,
  "biceps": Target.BICEPS,
  "calves": Target.CALVES,
  "cardiovascular system": Target.CARDIOVASCULAR_SYSTEM,
  "delts": Target.DELTS,
  "forearms": Target.FOREARMS,
  "glutes": Target.GLUTES,
  "hamstrings": Target.HAMSTRINGS,
  "lats": Target.LATS,
  "levator scapulae": Target.LEVATOR_SCAPULAE,
  "pectorals": Target.PECTORALS,
  "quads": Target.QUADS,
  "serratus anterior": Target.SERRATUS_ANTERIOR,
  "spine": Target.SPINE,
  "traps": Target.TRAPS,
  "triceps": Target.TRICEPS,
  "upper back": Target.UPPER_BACK
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
