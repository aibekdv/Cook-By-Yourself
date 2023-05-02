import 'package:cook_by_yourself/core/values/consts.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import '../feature/presentation/pages/pages.dart';

class OnGenerateRoute {
  static Route<dynamic>? route(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case RouteConst.signIn:
        return PageTransition(
          child: const SignInPage(),
          type: PageTransitionType.fade,
          duration: const Duration(milliseconds: 500),
        );

      case RouteConst.signUp:
        return PageTransition(
          child: const SignUpPage(),
          type: PageTransitionType.fade,
          duration: const Duration(milliseconds: 500),
        );

      case RouteConst.resetPassword:
        return PageTransition(
          child: const ResetPasswordPage(),
          type: PageTransitionType.fade,
          duration: const Duration(milliseconds: 500),
        );

      default:
        return PageTransition(
          child: const ErrorPage(),
          type: PageTransitionType.fade,
          duration: const Duration(milliseconds: 500),
        );
    }
  }
}

class ErrorPage extends StatelessWidget {
  const ErrorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'ErrorPage',
          style: TextStyle(
            color: Colors.black45,
          ),
        ),
      ),
    );
  }
}
