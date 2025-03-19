import 'package:flutter/foundation.dart';

void printInDebug(String message) {
  if (kDebugMode) {
    print(message);
  }
}
