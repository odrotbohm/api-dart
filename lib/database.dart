import 'dart:io';

import 'package:api_dart/models/font.dart';
import 'package:api_dart/models/rate_limit.dart';
import 'package:api_dart/models/user.dart';
import 'package:isar/isar.dart';

class Database {
  static Isar? _isarInstance;

  static Future<Isar> get db async {
    if (_isarInstance == null) {
      final String dataDirectory =
          Platform.environment['DATA_DIR'] ?? Directory.current.path;

      await Isar.initializeIsarCore(download: true);
      _isarInstance = await Isar.open(
        [UserSchema, FontSchema, RateLimitSchema],
        directory: dataDirectory,
      );
    }

    return _isarInstance!;
  }
}