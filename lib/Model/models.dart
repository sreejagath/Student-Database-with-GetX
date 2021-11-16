import 'package:hive_flutter/adapters.dart';
import 'package:uuid/uuid.dart';
part 'models.g.dart';

@HiveType(typeId: 0)
class Students {
  @HiveField(0)
  int id;
  @HiveField(1)
  String name;
  @HiveField(2)
  String course;
  @HiveField(3)
  String phone;
  @HiveField(4)
  String college;

  Students(this.name, this.course, this.phone, this.college)
      : id = Uuid().v4().hashCode;
}
