import 'package:ezapps/app.dart';
import 'package:ezapps/config/config.dart';
import 'package:ezapps/config/flavor_type.dart';
import 'package:ezapps/service/state_manajement.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'firebase_options.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(statusBarColor: Colors.transparent, statusBarIconBrightness: Brightness.light),
  );

  final adminAppConfig = AppConfig(appName: 'EZApp Admin', flavor: FlavorType.admin);
  Widget app = await initializeApp(adminAppConfig);

  runApp(MultiProvider(providers: [ChangeNotifierProvider(create: (_) => Counter())], child: app));
}
