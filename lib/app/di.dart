
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';

final instance = GetIt.instance;

Future<void> initAppModule() async{

  await Hive.initFlutter();


}