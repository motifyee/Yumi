import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yumi/statics/theme_statics.dart';

class TextFormFieldTemplate extends StatefulWidget {
  TextFormFieldTemplate({
    super.key,
    this.label,
    this.labelIcon,
    this.labelHint,
    this.subLabel,
    this.onTap,
    this.onSave,
    this.onChange,
    this.validators,
    this.autoHint,
    this.borderStyle,
    this.initialValue,
    this.controller,
    this.textInputType = TextInputType.text,
    this.isPassword = false,
    this.enabled = true,
  }) {
    borderStyle ??= TextFormFieldBorderStyle.borderedCircle;
  }

  String? label;
  String? labelIcon;
  String? labelHint;
  String? subLabel;
  Function()? onTap;
  void Function(dynamic)? onSave;
  void Function(dynamic)? onChange;
  String? Function(String?)? validators;
  TextEditingController? controller;
  List<String>? autoHint;
  TextFormFieldBorderStyleType? borderStyle;
  TextInputType textInputType;
  bool isPassword;
  bool enabled;
  dynamic initialValue;

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
  void initState() {
    widget.controller ??=
        TextEditingController(text: widget.initialValue?.toString());
    super.initState();
  }

  @override
  void dispose() {
    widget.controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.initialValue != null) {
      widget.controller ??=
          TextEditingController(text: widget.initialValue.toString());
      widget.controller!.value = TextEditingValue(
          text: widget.initialValue.toString(),
          selection: TextSelection.fromPosition(
              TextPosition(offset: widget.initialValue.toString().length)));
    }

    InputDecoration inputDecoration = InputDecoration(
        label: widget.label != null
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
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
                  ),
                  if (widget.subLabel != null && widget.subLabel != '')
                    Row(
                      children: [
                        if (widget.labelIcon != null)
                          SizedBox(
                              width: ThemeSelector.statics.defaultBlockGap),
                        Text(
                          widget.subLabel ?? '',
                          style: TextStyle(
                              color: ThemeSelector.colors.primary,
                              fontSize: ThemeSelector.fonts.font_10),
                        ),
                      ],
                    )
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
            : null);

    return TextFormField(
      onTap: widget.onTap,
      onSaved: widget.onSave,
      onChanged: widget.onChange,
      controller: widget.controller,
      autofillHints: widget.autoHint,
      keyboardType: widget.textInputType,
      style: TextStyle(color: ThemeSelector.colors.secondary),
      decoration: inputDecoration,
      validator: widget.validators,
      obscureText: widget.isPassword && isHide,
      enabled: widget.enabled,
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
