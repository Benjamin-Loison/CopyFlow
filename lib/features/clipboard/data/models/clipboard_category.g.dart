// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'clipboard_category.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ClipboardCategoryAdapter extends TypeAdapter<ClipboardCategory> {
  @override
  final typeId = 1;

  @override
  ClipboardCategory read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return ClipboardCategory.text;
      case 1:
        return ClipboardCategory.url;
      case 2:
        return ClipboardCategory.email;
      case 3:
        return ClipboardCategory.phone;
      case 4:
        return ClipboardCategory.otp;
      case 5:
        return ClipboardCategory.code;
      default:
        return ClipboardCategory.text;
    }
  }

  @override
  void write(BinaryWriter writer, ClipboardCategory obj) {
    switch (obj) {
      case ClipboardCategory.text:
        writer.writeByte(0);
      case ClipboardCategory.url:
        writer.writeByte(1);
      case ClipboardCategory.email:
        writer.writeByte(2);
      case ClipboardCategory.phone:
        writer.writeByte(3);
      case ClipboardCategory.otp:
        writer.writeByte(4);
      case ClipboardCategory.code:
        writer.writeByte(5);
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ClipboardCategoryAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
