import 'dart:math';

class CodeGenerator {
  static String getRandomCode({int codeLength = 15}) {
    final Random random = Random();
    const String characters = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRST'
        'UVWXYZ0123456789';
    String code = '';
    for (int i = 0; i < codeLength; i++) {
      code += characters[random.nextInt(characters.length)];
    }
    return code;
  }
}
