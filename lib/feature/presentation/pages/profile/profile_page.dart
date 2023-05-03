import 'package:cook_by_yourself/core/values/consts.dart';
import 'package:cook_by_yourself/feature/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: const [
            CustomAppBarWidget(
              bgColor: greenColor,
              title: "Профиль",
              isPrev: false,
            ),
            SizedBox(height: 15),
            Text("Ваша почта: example@example.com"),
          ],
        ),
      ),
    );
  }
}
