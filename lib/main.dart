import 'dart:math';

import 'package:cook_by_yourself/feature/presentation/cubit/auth/auth_cubit.dart';
import 'package:cook_by_yourself/feature/presentation/cubit/credential/credential_cubit.dart';
import 'package:cook_by_yourself/feature/presentation/cubit/recipe/recipe_cubit.dart';
import 'package:cook_by_yourself/feature/presentation/pages/pages.dart';
import 'package:cook_by_yourself/feature/presentation/widgets/widgets.dart';
import 'package:cook_by_yourself/routes/on_generate_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'theme/theme.dart';
import 'service_locator.dart' as di;

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await di.init();
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
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => di.sl<AuthCubit>()..appStarted(context),
        ),
        BlocProvider(
          create: (_) => di.sl<CredentialCubit>(),
        ),
        BlocProvider(
          create: (_) => di.sl<RecipeCubit>(),
        ),
      ],
      child: MaterialApp(
        title: 'Cook-By-Yourself',
        debugShowCheckedModeBanner: false,
        theme: getAppTheme(),
        initialRoute: '/',
        onGenerateRoute: OnGenerateRoute.route,
        routes: {
          "/": (context) {
            return BlocBuilder<AuthCubit, AuthState>(
              builder: (context, state) {
                if (state is AuthLoading) {
                  return const LoaderWidget();
                } else if (state is Authenticated) {
                  return const MainScreen();
                } else {
                  return const CredentialPage();
                }
              },
            );
          }
        },
      ),
    );
  }
}
