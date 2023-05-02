import 'package:cook_by_yourself/core/values/consts.dart';
import 'package:flutter/material.dart';

class CustomSelectWidget extends StatefulWidget {
  final String labelText;
  final Function(String value) onTap;

  const CustomSelectWidget({
    super.key,
    required this.labelText,
    required this.onTap,
  });

  @override
  State<CustomSelectWidget> createState() => _CustomSelectWidgetState();
}

class _CustomSelectWidgetState extends State<CustomSelectWidget> {
  String dropdownValue = 'Русский';

  @override
  void initState() {
    super.initState();
    widget.onTap(dropdownValue);
  }

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
        SizedBox(
          height: 48,
          child: DropdownButtonFormField(
            icon: const Icon(
              Icons.keyboard_arrow_down,
              color: Colors.white,
            ),
            style: const TextStyle(color: Colors.white),
            decoration: const InputDecoration(
              contentPadding: EdgeInsets.symmetric(
                vertical: 0,
                horizontal: 12,
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white, width: 1),
                borderRadius: BorderRadius.all(Radius.circular(8)),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white, width: 1),
              ),
              filled: true,
              fillColor: Colors.transparent,
            ),
            itemHeight: 48,
            dropdownColor: yellowColor,
            value: dropdownValue,
            onChanged: (String? newValue) {
              dropdownValue = newValue!;
              setState(() {});
            },
            items: <String>['Русский'].map<DropdownMenuItem<String>>(
              (String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  onTap: () {
                    widget.onTap(value);
                  },
                  child: Text(
                    value,
                    style: const TextStyle(fontSize: 16),
                  ),
                );
              },
            ).toList(),
          ),
        ),
      ],
    );
  }
}
