// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'astro_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AstroAdapter extends TypeAdapter<Astro> {
  @override
  final int typeId = 6;

  @override
  Astro read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Astro(
      moonset: fields[0] as String,
      moonIllumination: fields[1] as int,
      sunrise: fields[2] as String,
      moonPhase: fields[3] as String,
      sunset: fields[4] as String,
      isMoonUp: fields[5] as int,
      isSunUp: fields[6] as int,
      moonrise: fields[7] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Astro obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.moonset)
      ..writeByte(1)
      ..write(obj.moonIllumination)
      ..writeByte(2)
      ..write(obj.sunrise)
      ..writeByte(3)
      ..write(obj.moonPhase)
      ..writeByte(4)
      ..write(obj.sunset)
      ..writeByte(5)
      ..write(obj.isMoonUp)
      ..writeByte(6)
      ..write(obj.isSunUp)
      ..writeByte(7)
      ..write(obj.moonrise);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AstroAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
