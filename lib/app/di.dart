
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../network/firebase.dart';

final instance = GetIt.instance;

Future<void> initAppModule() async{

  //Hive init
  await Hive.initFlutter();

  //Firebase init
  instance.registerLazySingleton<FirebaseClient>(() => FirebaseClient());
  await instance.get<FirebaseClient>().init();

}