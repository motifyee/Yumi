import 'package:flutter/material.dart';
import 'package:yumi/statics/theme_statics.dart';

class TextFormFieldTemplate extends StatefulWidget {
  const TextFormFieldTemplate(
      {super.key,
      required this.label,
      this.onTap,
      this.onSave,
      this.validators,
      this.controller,
      this.autoHint,
      this.isPassword = false});

  final String? label;
  final Function()? onTap;
  final void Function(String?)? onSave;
  final String? Function(String?)? validators;
  final TextEditingController? controller;
  final List<String>? autoHint;
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
      controller: widget.controller,
      autofillHints: widget.autoHint,
      style: TextStyle(color: ThemeSelector.colors.secondary),
      decoration: InputDecoration(
          label: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            child: Text(
              widget.label ?? '',
            ),
          ),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          contentPadding: EdgeInsets.symmetric(
              horizontal: ThemeSelector.statics.defaultBlockGap),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(ThemeSelector.statics.buttonBorderRadius),
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(ThemeSelector.statics.buttonBorderRadius),
            ),
            borderSide: BorderSide(color: ThemeSelector.colors.secondary),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(ThemeSelector.statics.buttonBorderRadius),
            ),
            borderSide: BorderSide(color: ThemeSelector.colors.primary),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(ThemeSelector.statics.buttonBorderRadius),
            ),
            borderSide: BorderSide(color: ThemeSelector.colors.primary),
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
                    color: ThemeSelector.colors.secondary.withOpacity(.6),
                  ),
                )
              : null),
      validator: widget.validators,
      obscureText: widget.isPassword && isHide,
    );
  }
}
