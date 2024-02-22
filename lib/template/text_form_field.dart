import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yumi/statics/theme_statics.dart';

class TextFormFieldTemplate extends StatefulWidget {
  TextFormFieldTemplate(
      {super.key,
      this.label,
      this.labelIcon,
      this.labelHint,
      this.onTap,
      this.onSave,
      this.validators,
      this.controller,
      this.autoHint,
      this.borderStyle,
      this.textInputType = TextInputType.text,
      this.isPassword = false}) {
    borderStyle ??= TextFormFieldBorderStyle.borderedCircle;
  }

  final String? label;
  final String? labelIcon;
  final String? labelHint;
  final Function()? onTap;
  final void Function(dynamic)? onSave;
  final String? Function(String?)? validators;
  final TextEditingController? controller;
  final List<String>? autoHint;
  TextFormFieldBorderStyleType? borderStyle;
  final TextInputType textInputType;
  final bool isPassword;

  calcBorderStyle({bool isFocused = false}) {
    return borderStyle == TextFormFieldBorderStyle.borderBottom
        ? UnderlineInputBorder(
            borderSide: BorderSide(
                color:
                    isFocused ? borderStyle!.focusColor : borderStyle!.color),
          )
        : OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(borderStyle!.borderRadius),
            ),
            borderSide: BorderSide(
                color:
                    isFocused ? borderStyle!.focusColor : borderStyle!.color),
          );
  }

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
      keyboardType: widget.textInputType,
      style: TextStyle(color: ThemeSelector.colors.secondary),
      decoration: InputDecoration(
          label: widget.label != null
              ? Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (widget.labelIcon != null)
                      SvgPicture.asset(widget.labelIcon ?? ''),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4.0),
                      child: Row(
                        children: [
                          Text(
                            widget.label ?? '',
                            style: TextStyle(
                              fontSize: ThemeSelector.fonts.font_14,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Text(
                            widget.labelHint ?? '',
                            style: TextStyle(
                                color: ThemeSelector.colors.secondaryTant,
                                fontSize: ThemeSelector.fonts.font_10),
                          ),
                        ],
                      ),
                    ),
                  ],
                )
              : null,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          contentPadding: EdgeInsets.symmetric(
              horizontal: widget.borderStyle?.inputIndent ??
                  ThemeSelector.statics.defaultGap),
          border: widget.calcBorderStyle(),
          enabledBorder: widget.calcBorderStyle(),
          focusedBorder: widget.calcBorderStyle(isFocused: true),
          errorBorder: widget.calcBorderStyle(isFocused: true),
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

class TextFormFieldBorderStyle {
  static TextFormFieldBorderStyleType borderedRound =
      TextFormFieldBorderStyleType(
    borderRadius: ThemeSelector.statics.buttonBorderRadius,
    color: ThemeSelector.colors.secondary,
    focusColor: ThemeSelector.colors.primary,
    inputIndent: ThemeSelector.statics.defaultBlockGap,
  );

  static TextFormFieldBorderStyleType borderedCircle =
      TextFormFieldBorderStyleType(
    borderRadius: ThemeSelector.statics.buttonBorderRadius,
    color: ThemeSelector.colors.secondary,
    focusColor: ThemeSelector.colors.primary,
    inputIndent: ThemeSelector.statics.defaultBlockGap,
  );

  static TextFormFieldBorderStyleType borderBottom =
      TextFormFieldBorderStyleType(
    borderRadius: ThemeSelector.statics.buttonBorderRadius,
    color: ThemeSelector.colors.secondaryTantLighter,
    focusColor: ThemeSelector.colors.primary,
    inputIndent: ThemeSelector.statics.defaultGap,
  );
}

class TextFormFieldBorderStyleType {
  double borderRadius;
  Color color;
  Color focusColor;
  double inputIndent;

  TextFormFieldBorderStyleType({
    required this.borderRadius,
    required this.color,
    required this.focusColor,
    required this.inputIndent,
  });
}
