import 'package:flutter/material.dart';

class CustomSearchFormWidget extends StatelessWidget {
  final String hinText;

  const CustomSearchFormWidget({super.key, required this.hinText});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(8)),
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.09),
            spreadRadius: 1,
            blurRadius: 4.0,
            offset: Offset(0, 0),
          ),
        ],
      ),
      child: TextFormField(
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.search),
          hintText: hinText,
          enabled: true,
          border: const OutlineInputBorder(borderSide: BorderSide.none),
          contentPadding: const EdgeInsets.all(8),
        ),
      ),
    );
  }
}
