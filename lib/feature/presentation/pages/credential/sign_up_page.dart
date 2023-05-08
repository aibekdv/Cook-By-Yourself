import 'package:cook_by_yourself/core/utils/is_email.dart';
import 'package:cook_by_yourself/core/values/consts.dart';
import 'package:cook_by_yourself/feature/domain/entities/user_entity.dart';
import 'package:cook_by_yourself/feature/presentation/cubit/credential/credential_cubit.dart';
import 'package:cook_by_yourself/feature/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool _isVisibleButton = false;
  final _formKey = GlobalKey<FormState>();

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _passwordConfirmController = TextEditingController();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    _passwordController.dispose();
    _passwordConfirmController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _emailController.addListener(() {
      _isVisibleButton = _emailController.text.isNotEmpty;
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
                        Column(
                          children: [
                            FormFieldWidget(
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
                              hinText: "aibek@mail.ru",
                              inputType: TextInputType.emailAddress,
                              labelText: "Адрес эл.почты",
                            ),
                            const SizedBox(height: 16),
                            FormFieldWidget(
                              controller: _passwordController,
                              validator: (value) {
                                if (value!.length < 6) {
                                  return "Пароль должен быть не менее 6 символов";
                                } else if (value.isEmpty) {
                                  return "Поле не должно быть пустым";
                                } else {
                                  return null;
                                }
                              },
                              hinText: "******",
                              inputType: TextInputType.text,
                              labelText: "Пароль",
                              isPasswordField: true,
                            ),
                            const SizedBox(height: 16),
                            FormFieldWidget(
                              controller: _passwordConfirmController,
                              validator: (value) {
                                if (value != _passwordController.text) {
                                  return "Пароли не совпадают";
                                } else {
                                  return null;
                                }
                              },
                              hinText: "******",
                              inputType: TextInputType.text,
                              labelText: "Подтвердить пароль",
                              isPasswordField: true,
                            ),
                          ],
                        ),
                        const SizedBox(height: 60),
                        CustomButtonWidget(
                          color: yellowColor,
                          title: BlocBuilder<CredentialCubit, CredentialState>(
                            builder: (context, state) {
                              if (state is CredentialLoading) {
                                return const SizedBox(
                                  width: 20,
                                  height: 20,
                                  child: CircularProgressIndicator(),
                                );
                              }
                              return const Text(
                                "Продолжить",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14,
                                ),
                              );
                            },
                          ),
                          onTap: _isVisibleButton ? _signUpUser : null,
                        ),
                        const SizedBox(height: 15),
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

  _signUpUser() {
    if (_formKey.currentState != null) {
      if (_formKey.currentState!.validate()) {
        BlocProvider.of<CredentialCubit>(context).signUpUser(
          user: UserEntity(
            email: _emailController.text,
            password: _passwordController.text,
            password2: _passwordConfirmController.text,
          ),
        );
      }
    }
  }
}
