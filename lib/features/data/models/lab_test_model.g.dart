// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lab_test_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LabTestModelAdapter extends TypeAdapter<LabTestModel> {
  @override
  final int typeId = 0;

  @override
  LabTestModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LabTestModel(
      name: fields[0] as String,
      numberOfTests: fields[1] as int,
      resultOutTime: fields[2] as int,
      currPrice: fields[3] as int,
      discardedPrice: fields[4] as int,
      mark: fields[5] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, LabTestModel obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.numberOfTests)
      ..writeByte(2)
      ..write(obj.resultOutTime)
      ..writeByte(3)
      ..write(obj.currPrice)
      ..writeByte(4)
      ..write(obj.discardedPrice)
      ..writeByte(5)
      ..write(obj.mark);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LabTestModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
