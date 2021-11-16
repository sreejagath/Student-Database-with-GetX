// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'models.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class StudentsAdapter extends TypeAdapter<Students> {
  @override
  final int typeId = 0;

  @override
  Students read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Students(
      fields[1] as String,
      fields[2] as String,
      fields[3] as String,
      fields[4] as String,
    )..id = fields[0] as int;
  }

  @override
  void write(BinaryWriter writer, Students obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.course)
      ..writeByte(3)
      ..write(obj.phone)
      ..writeByte(4)
      ..write(obj.college);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is StudentsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
