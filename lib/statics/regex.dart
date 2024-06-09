class CustomRegex {
  static RegExp lettersNumbersBlankOnly = RegExp('^[a-zA-Z0-9 _]*');
  static RegExp lettersNumbersOnly = RegExp('^[a-zA-Z0-9]*');
  static RegExp lettersBlankOnly = RegExp('^[a-zA-Z _]*');
  static RegExp lettersOnly = RegExp('^[a-zA-Z]*');
  static RegExp numberOnly = RegExp('^[0-9]*');
  static RegExp numberWith2DecimalOnly = RegExp(r'^(\d+)?\.?\d{0,2}');
}
