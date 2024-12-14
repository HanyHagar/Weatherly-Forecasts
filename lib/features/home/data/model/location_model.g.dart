// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LocationAdapter extends TypeAdapter<Location> {
  @override
  final int typeId = 3;

  @override
  Location read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Location(
      localtime: fields[0] as String,
      country: fields[1] as String,
      localtimeEpoch: fields[2] as int,
      name: fields[3] as String,
      lon: fields[4] as double,
      region: fields[5] as String,
      lat: fields[6] as double,
      tzId: fields[7] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Location obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.localtime)
      ..writeByte(1)
      ..write(obj.country)
      ..writeByte(2)
      ..write(obj.localtimeEpoch)
      ..writeByte(3)
      ..write(obj.name)
      ..writeByte(4)
      ..write(obj.lon)
      ..writeByte(5)
      ..write(obj.region)
      ..writeByte(6)
      ..write(obj.lat)
      ..writeByte(7)
      ..write(obj.tzId);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LocationAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
