import 'package:cook_by_yourself/core/values/consts.dart';
import 'package:cook_by_yourself/feature/presentation/cubit/auth/auth_cubit.dart';
import 'package:cook_by_yourself/feature/presentation/cubit/credential/credential_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomAppBarWidget extends StatelessWidget {
  final String? title;
  final Color? bgColor;
  final bool isPrev;

  const CustomAppBarWidget({
    super.key,
    this.title,
    this.bgColor,
    this.isPrev = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 20.0,
        vertical: 10,
      ),
      height: 60,
      color: bgColor,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              if (isPrev)
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.fromBorderSide(
                        BorderSide(
                          color: bgColor == null ? Colors.black : Colors.white,
                          width: 1,
                        ),
                      ),
                    ),
                    child: Icon(
                      Icons.arrow_back_ios_rounded,
                      color: bgColor == null ? Colors.black : Colors.white,
                      size: 20,
                    ),
                  ),
                ),
              if (isPrev) const SizedBox(width: 13),
              if (title != null)
                Text(
                  "$title",
                  style: TextStyle(
                    color: bgColor != null ? Colors.white : greenColor,
                    fontSize: 18,
                  ),
                ),
            ],
          ),
          PopupMenuButton(
            color: Colors.white,
            itemBuilder: (context) {
              return [
                PopupMenuItem(
                  onTap: () {
                    BlocProvider.of<AuthCubit>(context).loggedOut();
                    Navigator.of(context).pushNamedAndRemoveUntil(
                      RouteConst.signIn,
                      (route) => false,
                    );
                  },
                  child: const Text("Выйти"),
                )
              ];
            },
          )
        ],
      ),
    );
  }
}
