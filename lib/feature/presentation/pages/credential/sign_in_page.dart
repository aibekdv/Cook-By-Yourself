import 'package:cook_by_yourself/core/utils/is_email.dart';
import 'package:cook_by_yourself/core/values/consts.dart';
import 'package:cook_by_yourself/feature/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  bool _isActiveButton = false;
  final _formKey = GlobalKey<FormState>();

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _emailController.addListener(() {
      _isActiveButton = _emailController.text.isNotEmpty;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            const CustomAppBarWidget(),
            Expanded(
              child: Container(
                margin: const EdgeInsets.only(top: 15),
                padding: const EdgeInsets.only(
                  left: 20.0,
                  right: 20.0,
                  top: 60.0,
                ),
                decoration: const BoxDecoration(
                  color: greenColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(60),
                    topRight: Radius.circular(60),
                  ),
                ),
                child: SingleChildScrollView(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        FormFieldWidget(
                          hinText: "aibek@mail.ru",
                          inputType: TextInputType.emailAddress,
                          labelText: "Адрес эл.почты",
                          controller: _emailController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Поле не должно быть пустым";
                            } else if (!isEmail(value)) {
                              return "Пожалуйста введите правильную почту";
                            } else {
                              return null;
                            }
                          },
                        ),
                        const SizedBox(height: 16),
                        FormFieldWidget(
                          hinText: "*******",
                          inputType: TextInputType.text,
                          labelText: "Пароль",
                          isPasswordField: true,
                          controller: _passwordController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Поле не должно быть пустым";
                            } else if (value.length < 6) {
                              return "Пароль должен быть не менее 6 символов";
                            } else {
                              return null;
                            }
                          },
                        ),
                        const SizedBox(height: 4),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(
                                  context,
                                  RouteConst.resetPassword,
                                );
                              },
                              child: const Text(
                                "Забыли пароль?",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(height: 60),
                        CustomButtonWidget(
                          color: yellowColor,
                          title: "Войти",
                          onTap: _isActiveButton ? _signInUser : null,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _signInUser() {
    var currentState = _formKey.currentState;

    if (currentState != null) {
      if (currentState.validate()) {
        debugPrint(_emailController.text);
        debugPrint(_passwordController.text);
      }
    }
  }
}
