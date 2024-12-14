// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forecastday_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ForecastdayAdapter extends TypeAdapter<Forecastday> {
  @override
  final int typeId = 5;

  @override
  Forecastday read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Forecastday(
      date: fields[0] as DateTime,
      astro: fields[1] as Astro,
      dateEpoch: fields[2] as int,
      hour: (fields[3] as List).cast<Current>(),
      day: fields[4] as Day,
    );
  }

  @override
  void write(BinaryWriter writer, Forecastday obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.date)
      ..writeByte(1)
      ..write(obj.astro)
      ..writeByte(2)
      ..write(obj.dateEpoch)
      ..writeByte(3)
      ..write(obj.hour)
      ..writeByte(4)
      ..write(obj.day);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ForecastdayAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
