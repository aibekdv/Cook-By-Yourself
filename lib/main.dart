import 'package:cook_by_yourself/feature/presentation/pages/credential/credential.dart';
import 'package:cook_by_yourself/routes/on_generate_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'theme/theme.dart';

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    FlutterNativeSplash.remove();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cook-By-Yourself',
      debugShowCheckedModeBanner: false,
      theme: getAppTheme(),
      initialRoute: '/',
      onGenerateRoute: OnGenerateRoute.route,
      routes: {
        "/": (context) => const CredentialPage(),
      },
    );
  }
}
