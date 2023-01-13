import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

import 'app/app.dart';
import 'app/di.dart';
import 'resources/language_manager.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await initAppModule();

  runApp(EasyLocalization(
    supportedLocales: appLocales,
    path: ASSETS_PATH_LOCALIZATIONS,
    child: App())
  );
}
