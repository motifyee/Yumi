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
    this.objectValidators,
    this.dropdownSelectionValue,
    this.dropdownSelectionTargetLabel,
    this.dropdownSelectionList,
    this.textInputType = TextInputType.text,
    this.isPassword = false,
    this.enabled = true,
    this.readOnly = false,
    this.dropdownSelection = false,
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
  String? Function(dynamic)? objectValidators;
  TextEditingController? controller;
  List<String>? autoHint;
  TextFormFieldBorderStyleType? borderStyle;
  TextInputType textInputType;
  bool isPassword;
  bool enabled;
  bool readOnly;
  bool dropdownSelection;
  String? dropdownSelectionTargetLabel;
  dynamic dropdownSelectionValue;
  List<dynamic>? dropdownSelectionList;
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
    if (widget.controller != null) widget.controller!.dispose();
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
        contentPadding: widget.dropdownSelection
            ? EdgeInsets.symmetric(
                horizontal: widget.borderStyle!.inputIndent,
                vertical: ThemeSelector.statics.defaultInputGap,
              )
            : EdgeInsets.symmetric(
                horizontal: widget.borderStyle!.inputIndent,
              ),
        border: widget.calcBorderStyle(),
        enabledBorder: widget.calcBorderStyle(),
        isDense: widget.dropdownSelection ? true : false,
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

    return widget.dropdownSelection
        ? DropdownButtonFormField(
            isExpanded: true,
            validator: widget.objectValidators,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            value: widget.initialValue,
            icon: Icon(
              Icons.arrow_drop_up,
              color: ThemeSelector.colors.secondaryFaint,
            ),
            // iconSize: ThemeSelector.fonts.font_38,
            items: widget.dropdownSelectionList
                    ?.map(
                      (e) => DropdownMenuItem(
                        value: e,
                        child: Container(
                          child: Text(
                            e
                                .toJson()[widget.dropdownSelectionTargetLabel]
                                .toString(),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                    )
                    .toList() ??
                [],
            onChanged: widget.onChange,
            onSaved: widget.onSave,
            decoration: inputDecoration,
          )
        : TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
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
            readOnly: widget.readOnly,
          );
  }
}

class TextFormFieldBorderStyle {
  static TextFormFieldBorderStyleType borderedRound =
      TextFormFieldBorderStyleType(
    borderRadius: ThemeSelector.statics.buttonBorderRadiusRounded,
    color: ThemeSelector.colors.secondaryFaint,
    focusColor: ThemeSelector.colors.primary,
    inputIndent: ThemeSelector.statics.defaultGap,
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
