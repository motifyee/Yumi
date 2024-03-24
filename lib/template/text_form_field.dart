import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yumi/statics/theme_statics.dart';

class TextFormFieldTemplate extends StatefulWidget {
  TextFormFieldTemplate({
    super.key,
    this.label,
    this.labelIcon,
    this.labelHint,
    this.subLabel,
    this.hintText,
    this.onTap,
    this.onSave,
    this.onChange,
    this.onEditingComplete,
    this.onTapOutside,
    this.validators,
    this.autoHint,
    this.borderStyle,
    this.initialValue,
    this.controller,
    this.objectValidators,
    this.dropdownSelectionValue,
    this.dropdownSelectionTargetLabel,
    this.dropdownSelectionList,
    this.prefixText,
    this.prefixIcon,
    this.suffixText,
    this.suffixIcon,
    this.suffixIconConstraints,
    this.textInputType = TextInputType.text,
    this.isDense = false,
    this.floatingLabelBehavior,
    this.isPassword = false,
    this.enabled = true,
    this.readOnly = false,
    this.dropdownSelection = false,
    this.inputFormatters = const [],
    this.maxLines = 1,
    this.minLines = 1,
    this.textAlign = TextAlign.start,
    this.textAlignVertical = TextAlignVertical.center,
    this.textCapitalization = TextCapitalization.none,
  }) {
    borderStyle ??= TextFormFieldBorderStyle.borderedCircle;
  }

  String? label;
  String? labelIcon;
  String? labelHint;
  String? subLabel;
  String? hintText;
  Function()? onTap;
  void Function(dynamic)? onSave;
  void Function(dynamic)? onChange;
  void Function()? onEditingComplete;
  void Function(PointerDownEvent)? onTapOutside;
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
  bool? isDense;
  FloatingLabelBehavior? floatingLabelBehavior;
  String? dropdownSelectionTargetLabel;
  dynamic dropdownSelectionValue;
  List<dynamic>? dropdownSelectionList;
  dynamic initialValue;
  String? prefixText;
  Widget? prefixIcon;
  String? suffixText;
  Widget? suffixIcon;
  BoxConstraints? suffixIconConstraints;
  List<TextInputFormatter> inputFormatters;
  int maxLines = 1;
  int minLines = 1;
  TextAlign textAlign = TextAlign.start;
  TextAlignVertical textAlignVertical = TextAlignVertical.center;
  TextCapitalization textCapitalization = TextCapitalization.none;

  calcBorderStyle({bool isFocused = false}) {
    if (borderStyle == TextFormFieldBorderStyle.borderBottom) {
      return UnderlineInputBorder(
        borderSide: BorderSide(
            color: isFocused ? borderStyle!.focusColor : borderStyle!.color),
      );
    }
    if (borderStyle == TextFormFieldBorderStyle.borderNone) {
      return const UnderlineInputBorder(
        borderSide: BorderSide.none,
      );
    }

    return OutlineInputBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(borderStyle!.borderRadius),
      ),
      borderSide: BorderSide(
          color: isFocused ? borderStyle!.focusColor : borderStyle!.color),
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
                            style: Theme.of(context).textTheme.labelLarge,
                          ),
                          Text(
                            widget.labelHint ?? '',
                            style: Theme.of(context).textTheme.labelSmall,
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
                        SizedBox(width: ThemeSelector.statics.defaultBlockGap),
                      Text(
                        widget.subLabel ?? '',
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                    ],
                  )
              ],
            )
          : null,
      floatingLabelBehavior:
          widget.floatingLabelBehavior ?? FloatingLabelBehavior.always,
      contentPadding: widget.isDense == true
          ? EdgeInsets.symmetric(
              horizontal: widget.borderStyle!.inputIndent,
            )
          : EdgeInsets.symmetric(
              horizontal: widget.borderStyle!.inputIndent,
              vertical: ThemeSelector.statics.defaultInputGap,
            ),
      border: widget.calcBorderStyle(),
      enabledBorder: widget.calcBorderStyle(),
      isDense: widget.isDense,
      focusedBorder: widget.calcBorderStyle(isFocused: true),
      errorBorder: widget.calcBorderStyle(isFocused: true),
      prefixText: widget.prefixText,
      prefixIcon: widget.prefixIcon,
      hintText: widget.hintText,
      hintStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: ThemeSelector.colors.secondaryTantLighter,
          ),
      suffixText: widget.suffixText,
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
          : widget.suffixIcon,
      suffixIconConstraints: widget.suffixIconConstraints,
    );

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
            style: Theme.of(context).textTheme.bodyMedium,
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
            onEditingComplete: widget.onEditingComplete,
            onTapOutside: widget.onTapOutside,
            controller: widget.controller,
            autofillHints: widget.autoHint,
            keyboardType: widget.textInputType,
            style: Theme.of(context).textTheme.bodyMedium,
            decoration: inputDecoration,
            validator: widget.validators,
            obscureText: widget.isPassword && isHide,
            enabled: widget.enabled,
            readOnly: widget.readOnly,
            inputFormatters: widget.inputFormatters,
            maxLines: widget.maxLines,
            minLines: widget.minLines,
            textAlign: widget.textAlign,
            textAlignVertical: widget.textAlignVertical,
            textCapitalization: widget.textCapitalization,
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

  static TextFormFieldBorderStyleType borderNone = TextFormFieldBorderStyleType(
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
