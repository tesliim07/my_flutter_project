// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_map.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DataMapAdapter extends TypeAdapter<DataMap> {
  @override
  final int typeId = 0;


  @override
  DataMap read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DataMap()
      ..NodeID = fields[0] as int
      ..YesID = fields[1] as int
      ..NoID = fields[2] as int
      ..Description = fields[3] as String
      ..Question = fields[4] as String;
  }

  @override
  void write(BinaryWriter writer, DataMap obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.NodeID)
      ..writeByte(1)
      ..write(obj.YesID)
      ..writeByte(2)
      ..write(obj.NoID)
      ..writeByte(3)
      ..write(obj.Description)
      ..writeByte(4)
      ..write(obj.Question);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DataMapAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}


