import '../models/clipboard_category.dart';

class ClipboardClassifier {
  static ClipboardCategory classify(String text) {
    final value = text.trim();

    if (Uri.tryParse(value)?.hasAbsolutePath == true &&
        (value.startsWith('http://') || value.startsWith('https://'))) {
      return ClipboardCategory.url;
    }

    if (RegExp(
      r'^[\w\.-]+@[\w\.-]+\.\w+$',
    ).hasMatch(value)) {
      return ClipboardCategory.email;
    }

    if (RegExp(
      r'^\+?[0-9]{10,15}$',
    ).hasMatch(value)) {
      return ClipboardCategory.phone;
    }

    if (RegExp(
      r'^\d{4,8}$',
    ).hasMatch(value)) {
      return ClipboardCategory.otp;
    }

    if (value.contains('{') ||
        value.contains('class ') ||
        value.contains('import ') ||
        value.contains('void ')) {
      return ClipboardCategory.code;
    }

    return ClipboardCategory.text;
  }
}