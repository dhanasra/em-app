
import 'dart:io';

import 'package:em/resources/date_manager.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';

import '../network/config/firebase.dart';

final instance = GetIt.instance;

Future<void> initAppModule() async{

  //Hive init
  await Hive.initFlutter();

  //Firebase init
  instance.registerLazySingleton<FirebaseClient>(() => FirebaseClient());
  await instance.get<FirebaseClient>().init();

  Directory appDocDirectory = await getApplicationDocumentsDirectory();

  //Hive Box open
  await Hive.openBox("user");
  await Hive.openBox("settings");
  
  final boxCollection = await BoxCollection.open(
    'ExpensoBox', 
    {'expenses', 'settings', 'user'}, 
    path: appDocDirectory.path
  );
  final expenseBox = await boxCollection.openBox<Map>('expenses');

  instance.registerLazySingleton<CollectionBox>(() => expenseBox, instanceName: 'expenses');

}