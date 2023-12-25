import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget({
    super.key,
    this.maxLine = 1,
    this.hintText = '',
    required TextEditingController textEditingController,
  }) : _textEdithingController = textEditingController;
  final int maxLine;
  final String hintText;
  final TextEditingController _textEdithingController;

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 50,
      decoration: const BoxDecoration(),
      child: TextFormField(
        maxLines: maxLine,
        controller: _textEdithingController,
        decoration: InputDecoration(
          border: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          hintText: hintText,
          contentPadding: const EdgeInsets.fromLTRB(12, 8, 12, 8),
          fillColor: Colors.white,
          filled: true,
        ),
      ),
    );
  }
}
