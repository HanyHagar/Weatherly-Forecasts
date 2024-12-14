// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'day_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DayAdapter extends TypeAdapter<Day> {
  @override
  final int typeId = 7;

  @override
  Day read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Day(
      avgvisKm: fields[0] as double,
      uv: fields[1] as double,
      avgtempF: fields[2] as double,
      avgtempC: fields[3] as double,
      dailyChanceOfSnow: fields[4] as int,
      maxtempC: fields[5] as double,
      maxtempF: fields[6] as double,
      mintempC: fields[7] as double,
      avgvisMiles: fields[8] as double,
      dailyWillItRain: fields[9] as int,
      mintempF: fields[10] as double,
      totalprecipIn: fields[11] as double,
      totalsnowCm: fields[12] as double,
      avghumidity: fields[13] as int,
      condition: fields[14] as Condition,
      maxwindKph: fields[15] as double,
      maxwindMph: fields[16] as double,
      dailyChanceOfRain: fields[17] as int,
      totalprecipMm: fields[18] as double,
      dailyWillItSnow: fields[19] as int,
    );
  }

  @override
  void write(BinaryWriter writer, Day obj) {
    writer
      ..writeByte(20)
      ..writeByte(0)
      ..write(obj.avgvisKm)
      ..writeByte(1)
      ..write(obj.uv)
      ..writeByte(2)
      ..write(obj.avgtempF)
      ..writeByte(3)
      ..write(obj.avgtempC)
      ..writeByte(4)
      ..write(obj.dailyChanceOfSnow)
      ..writeByte(5)
      ..write(obj.maxtempC)
      ..writeByte(6)
      ..write(obj.maxtempF)
      ..writeByte(7)
      ..write(obj.mintempC)
      ..writeByte(8)
      ..write(obj.avgvisMiles)
      ..writeByte(9)
      ..write(obj.dailyWillItRain)
      ..writeByte(10)
      ..write(obj.mintempF)
      ..writeByte(11)
      ..write(obj.totalprecipIn)
      ..writeByte(12)
      ..write(obj.totalsnowCm)
      ..writeByte(13)
      ..write(obj.avghumidity)
      ..writeByte(14)
      ..write(obj.condition)
      ..writeByte(15)
      ..write(obj.maxwindKph)
      ..writeByte(16)
      ..write(obj.maxwindMph)
      ..writeByte(17)
      ..write(obj.dailyChanceOfRain)
      ..writeByte(18)
      ..write(obj.totalprecipMm)
      ..writeByte(19)
      ..write(obj.dailyWillItSnow);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DayAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
