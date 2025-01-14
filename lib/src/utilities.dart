import 'dart:convert';
import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

class Utilities {
  static const Color BLACK = Color.fromARGB(255, 0, 0, 0);
  static const Color WHITE = Color.fromARGB(255, 255, 255, 255);

  static String toRGBA(Color color) {
    return 'rgba(${color.r},${color.g},${color.b},${color.a / 255})';
  }

  static Color textColor(Color color) {
    if (color.computeLuminance() > 0.6) {
      return BLACK;
    } else {
      return WHITE;
    }
  }

  static String generateRandom([int length = 16]) {
    final Random _random = Random.secure();
    var values = List<int>.generate(length, (i) => _random.nextInt(256));
    return base64Url.encode(values).substring(0, length);
  }

  static bool truthful(value) {
    if (value == null) {
      return false;
    }
    if (value == true ||
        value == 'true' ||
        value == 1 ||
        value == '1' ||
        value.toString().toLowerCase() == 'yes') {
      return true;
    }
    return false;
  }
}
