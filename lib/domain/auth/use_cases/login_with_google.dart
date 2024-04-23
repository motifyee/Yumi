import 'package:flutter/material.dart';
import 'package:fpdart/fpdart.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:yumi/core/use_cases.dart';
import 'package:yumi/core/failures.dart';

class LoginWithGoogle extends UseCase<String?, NoParams> {
  LoginWithGoogle();

  @override
  Future<Either<Failure, String?>> call(params) async {
    const List<String> scopes = <String>[
      'email',
      'https://www.googleapis.com/auth/contacts.readonly',
    ];

    GoogleSignIn googleSignIn = GoogleSignIn(
      scopes: scopes,
    );

    try {
      var account = await googleSignIn.signIn();
      debugPrint(account.toString());

      return right(account?.serverAuthCode);
    } catch (e) {
      return left(ApiFailure(e, StackTrace.current));
    }
  }
}
