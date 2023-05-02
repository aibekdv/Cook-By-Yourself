import 'package:cook_by_yourself/core/values/consts.dart';
import 'package:cook_by_yourself/feature/presentation/widgets/custom_button_widget.dart';
import 'package:flutter/material.dart';

class CredentialPage extends StatelessWidget {
  const CredentialPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 70),
              child: Container(
                margin: const EdgeInsets.only(top: 5),
                padding: const EdgeInsets.only(
                  left: 20.0,
                  right: 20.0,
                  top: 180.0,
                ),
                decoration: const BoxDecoration(
                  color: greenColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(60),
                    topRight: Radius.circular(60),
                  ),
                ),
                child: Column(
                  children: [
                    const Text(
                      "Добро пожаловать",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 60),
                    Row(
                      children: [
                        Expanded(
                          child: CustomButtonWidget(
                            color: yellowColor,
                            title: "Войти",
                            isWelcome: true,
                            onTap: () {
                              Navigator.pushNamed(
                                context,
                                RouteConst.signIn,
                              );
                            },
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: CustomButtonWidget(
                            color: Colors.white,
                            title: "Регистрация",
                            isWelcome: true,
                            onTap: () {
                              Navigator.pushNamed(
                                context,
                                RouteConst.signUp,
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Image.asset(
                "assets/images/logo.png",
                width: 260,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
