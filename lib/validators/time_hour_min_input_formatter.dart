import 'package:flutter/services.dart';

class TimeHourMinInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    var text = newValue.text;

    if (newValue.selection.baseOffset == 0) {
      return newValue;
    }

    var textList = text.split('');
    if (textList.length > 1 && int.parse('${textList[0]}${textList[1]}') > 11) {
      textList[0] = '1';
      textList[1] = '1';
    }
    if (textList.length > 3 && int.parse('${textList[2]}${textList[3]}') > 59) {
      textList[2] = '5';
      textList[3] = '9';
    }
    text = textList.join('');

    var buffer = StringBuffer();
    for (int i = 0; i < text.length; i++) {
      buffer.write(text[i]);
      var nonZeroIndex = i + 1;
      if (nonZeroIndex % 2 == 0 && nonZeroIndex != text.length) {
        buffer.write(':'); // Add double spaces.
      }
    }

    var string = buffer.toString();
    return newValue.copyWith(
        text: string,
        selection: TextSelection.collapsed(offset: string.length));
  }
}
