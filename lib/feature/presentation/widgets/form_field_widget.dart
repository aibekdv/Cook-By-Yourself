import 'package:flutter/material.dart';

class FormFieldWidget extends StatefulWidget {
  final TextEditingController? controller;
  final bool? isPasswordField;
  final String? hinText;
  final Function? errorText;
  final FormFieldValidator<String>? validator;
  final TextInputType? inputType;
  final String labelText;
  final Function(String)? onChanged;

  const FormFieldWidget({
    super.key,
    this.controller,
    this.isPasswordField,
    this.hinText,
    this.errorText,
    this.validator,
    this.inputType,
    required this.labelText,
    this.onChanged,
  });

  @override
  State<FormFieldWidget> createState() => _FormFieldWidgetState();
}

class _FormFieldWidgetState extends State<FormFieldWidget> {
  bool _obsecureText = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.labelText,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: widget.controller,
          keyboardType: widget.inputType,
          obscureText: widget.isPasswordField == true ? _obsecureText : false,
          cursorColor: Colors.white,
          validator: widget.validator,
          onChanged: widget.onChanged,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
          decoration: InputDecoration(
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white, width: 1),
              borderRadius: BorderRadius.all(Radius.circular(8)),
            ),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white, width: 1),
              borderRadius: BorderRadius.all(Radius.circular(8)),
            ),
            errorBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red, width: 1),
              borderRadius: BorderRadius.all(Radius.circular(8)),
            ),
            focusedErrorBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white, width: 1),
              borderRadius: BorderRadius.all(Radius.circular(8)),
            ),
            contentPadding: const EdgeInsets.only(top: 12, left: 12, right: 12),
            filled: true,
            fillColor: Colors.transparent,
            hintText: widget.hinText,
            hintStyle: TextStyle(
              color: Colors.white.withOpacity(.6),
              fontWeight: FontWeight.w300,
            ),
            suffixIcon: widget.isPasswordField == true
                ? GestureDetector(
                    onTap: () {
                      _obsecureText = !_obsecureText;
                      setState(() {});
                    },
                    child: Icon(
                      _obsecureText
                          ? Icons.visibility_off_outlined
                          : Icons.visibility_outlined,
                      color: Colors.white,
                    ),
                  )
                : null,
          ),
        ),
      ],
    );
  }
}
