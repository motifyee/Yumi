import 'package:flutter/material.dart';

class TextFormFieldTemplate extends StatefulWidget {
  const TextFormFieldTemplate(
      {super.key,
      required this.label,
      this.onTap,
      this.onSave,
      this.validators,
      this.isPassword = false});

  final String? label;
  final Function()? onTap;
  final void Function(String?)? onSave;
  final String? Function(String?)? validators;
  final bool isPassword;

  @override
  State<TextFormFieldTemplate> createState() => _TextFormFieldTemplateState();
}

class _TextFormFieldTemplateState extends State<TextFormFieldTemplate> {
  bool isHide = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: widget.onTap,
      onSaved: widget.onSave,
      style: TextStyle(color: Theme.of(context).colorScheme.secondary),
      decoration: InputDecoration(
          label: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            child: Text(
              widget.label ?? '',
              style: TextStyle(
                color: Theme.of(context).colorScheme.secondary,
              ),
            ),
          ),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          contentPadding: const EdgeInsets.symmetric(horizontal: 30.0),
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(150)),
          ),
          suffixIcon: widget.isPassword
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      isHide = !isHide;
                    });
                  },
                  icon: Icon(
                    isHide
                        ? Icons.remove_red_eye_outlined
                        : Icons.visibility_off_outlined,
                    color:
                        Theme.of(context).colorScheme.secondary.withOpacity(.6),
                  ),
                )
              : null),
      validator: widget.validators,
      obscureText: widget.isPassword && isHide,
    );
  }
}
