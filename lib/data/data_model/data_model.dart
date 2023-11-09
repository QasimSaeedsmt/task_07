import 'package:hive/hive.dart';

part 'data_model.g.dart';

@HiveType(typeId: 0)
class DataModel extends HiveObject {
  @HiveField(0)
  String name;

  @HiveField(1)
  int value2;

  @HiveField(2)
  int value3;

  @HiveField(3)
  int value4;

  @HiveField(4)
  int value5;

  @HiveField(5)
  int value1;

  DataModel(
      {required this.name,
      required this.value2,
      required this.value3,
      required this.value4,
      required this.value5,
      required this.value1});
}
