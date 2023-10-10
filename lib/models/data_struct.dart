import 'package:hive/hive.dart';

part 'data_struct.g.dart';

@HiveType(typeId: 1)
class DataStruct extends HiveObject {
  @HiveField(0)
  String title;
  @HiveField(1)
  bool status;

  DataStruct({required this.title, required this.status});
}
