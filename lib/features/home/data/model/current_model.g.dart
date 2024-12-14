// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'current_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CurrentAdapter extends TypeAdapter<Current> {
  @override
  final int typeId = 1;

  @override
  Current read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Current(
      feelslikeC: fields[0] as double,
      feelslikeF: fields[1] as double,
      windDegree: fields[2] as int,
      windchillF: fields[3] as double,
      windchillC: fields[4] as double,
      lastUpdatedEpoch: fields[5] as int?,
      tempC: fields[6] as double,
      tempF: fields[7] as double,
      cloud: fields[8] as int,
      windKph: fields[9] as double,
      windMph: fields[10] as double,
      humidity: fields[11] as int,
      dewpointF: fields[12] as double,
      uv: fields[13] as double,
      lastUpdated: fields[14] as String?,
      heatindexF: fields[15] as double,
      dewpointC: fields[16] as double,
      isDay: fields[17] as int,
      precipIn: fields[18] as double,
      heatindexC: fields[19] as double,
      windDir: fields[20] as String,
      gustMph: fields[21] as double,
      pressureIn: fields[22] as double,
      gustKph: fields[23] as double,
      precipMm: fields[24] as double,
      condition: fields[25] as Condition,
      visKm: fields[26] as double,
      pressureMb: fields[27] as double,
      visMiles: fields[28] as double,
      snowCm: fields[29] as int?,
      willItRain: fields[30] as int?,
      diffRad: fields[31] as double?,
      chanceOfRain: fields[32] as int?,
      shortRad: fields[33] as double?,
      willItSnow: fields[34] as int?,
      timeEpoch: fields[35] as int?,
      time: fields[36] as String?,
      chanceOfSnow: fields[37] as double?,
    );
  }

  @override
  void write(BinaryWriter writer, Current obj) {
    writer
      ..writeByte(38)
      ..writeByte(0)
      ..write(obj.feelslikeC)
      ..writeByte(1)
      ..write(obj.feelslikeF)
      ..writeByte(2)
      ..write(obj.windDegree)
      ..writeByte(3)
      ..write(obj.windchillF)
      ..writeByte(4)
      ..write(obj.windchillC)
      ..writeByte(5)
      ..write(obj.lastUpdatedEpoch)
      ..writeByte(6)
      ..write(obj.tempC)
      ..writeByte(7)
      ..write(obj.tempF)
      ..writeByte(8)
      ..write(obj.cloud)
      ..writeByte(9)
      ..write(obj.windKph)
      ..writeByte(10)
      ..write(obj.windMph)
      ..writeByte(11)
      ..write(obj.humidity)
      ..writeByte(12)
      ..write(obj.dewpointF)
      ..writeByte(13)
      ..write(obj.uv)
      ..writeByte(14)
      ..write(obj.lastUpdated)
      ..writeByte(15)
      ..write(obj.heatindexF)
      ..writeByte(16)
      ..write(obj.dewpointC)
      ..writeByte(17)
      ..write(obj.isDay)
      ..writeByte(18)
      ..write(obj.precipIn)
      ..writeByte(19)
      ..write(obj.heatindexC)
      ..writeByte(20)
      ..write(obj.windDir)
      ..writeByte(21)
      ..write(obj.gustMph)
      ..writeByte(22)
      ..write(obj.pressureIn)
      ..writeByte(23)
      ..write(obj.gustKph)
      ..writeByte(24)
      ..write(obj.precipMm)
      ..writeByte(25)
      ..write(obj.condition)
      ..writeByte(26)
      ..write(obj.visKm)
      ..writeByte(27)
      ..write(obj.pressureMb)
      ..writeByte(28)
      ..write(obj.visMiles)
      ..writeByte(29)
      ..write(obj.snowCm)
      ..writeByte(30)
      ..write(obj.willItRain)
      ..writeByte(31)
      ..write(obj.diffRad)
      ..writeByte(32)
      ..write(obj.chanceOfRain)
      ..writeByte(33)
      ..write(obj.shortRad)
      ..writeByte(34)
      ..write(obj.willItSnow)
      ..writeByte(35)
      ..write(obj.timeEpoch)
      ..writeByte(36)
      ..write(obj.time)
      ..writeByte(37)
      ..write(obj.chanceOfSnow);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CurrentAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
