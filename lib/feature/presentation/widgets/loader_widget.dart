import 'package:flutter/material.dart';

class LoaderWidget extends StatelessWidget {
  const LoaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/splash.png",
              width: 160,
            ),
            const SizedBox(height: 15),
            const SizedBox(
              width: 30,
              height: 30,
              child: CircularProgressIndicator(),
            ),
          ],
        ),
      ),
    );
  }
}
