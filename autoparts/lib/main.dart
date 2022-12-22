import 'package:autoparts/services/services.dart';
import 'package:flutter/material.dart';

import 'package:autoparts/providers/providers.dart';
import 'package:autoparts/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:autoparts/routes/routes_app.dart';
import 'package:autoparts/themes/theme_app.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(const AppState());
}

class AppState extends StatelessWidget {
  const AppState({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SignUpFormProvider()),
        ChangeNotifierProvider(create: (_) => AuthService()),
      ],
      child: const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Autoparts',
      theme: ThemeApp.lightTheme,
      routes: RoutesApp.routes,
      initialRoute: RoutesApp.splash,
    );
  }
}
