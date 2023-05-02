import 'package:cook_by_yourself/core/utils/is_email.dart';
import 'package:cook_by_yourself/core/values/consts.dart';
import 'package:cook_by_yourself/feature/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';

class ResetPasswordPage extends StatefulWidget {
  const ResetPasswordPage({super.key});

  @override
  State<ResetPasswordPage> createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  bool _isActiveButton = false;
  final _formKey = GlobalKey<FormState>();

  final _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
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
      }
    }
  }
}
