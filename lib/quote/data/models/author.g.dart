// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'author.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AuthorAdapter extends TypeAdapter<Author> {
  @override
  final int typeId = 1;

  @override
  Author read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Author(
      id: fields[0] as String?,
      name: fields[1] as String?,
      link: fields[2] as String?,
      bio: fields[3] as String?,
      description: fields[4] as String?,
      quoteCount: fields[5] as int?,
      slug: fields[6] as String?,
      dateAdded: fields[7] as String?,
      dateModified: fields[8] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Author obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.link)
      ..writeByte(3)
      ..write(obj.bio)
      ..writeByte(4)
      ..write(obj.description)
      ..writeByte(5)
      ..write(obj.quoteCount)
      ..writeByte(6)
      ..write(obj.slug)
      ..writeByte(7)
      ..write(obj.dateAdded)
      ..writeByte(8)
      ..write(obj.dateModified);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AuthorAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
