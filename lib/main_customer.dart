import 'package:ezapps/app.dart';
import 'package:ezapps/config/flavor_type.dart';
import 'package:ezapps/service/state_manajement.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'config/config.dart';
import 'firebase_options.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(statusBarColor: Colors.transparent, statusBarIconBrightness: Brightness.light),
  );

  final customerAppConfig = AppConfig(appName: 'EZApp', flavor: FlavorType.customer);
  Widget app = await initializeApp(customerAppConfig);

  runApp(MultiProvider(providers: [ChangeNotifierProvider(create: (_) => Counter())], child: app));
}
