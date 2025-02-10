import 'package:flutter/material.dart';
import 'package:joke_flutter_app/core/service/service_manager.dart';

@immutable
final class Init {
  const Init._();

  static void init() {
    WidgetsFlutterBinding.ensureInitialized();
    ServiceManager.instance.init();
  }
}
