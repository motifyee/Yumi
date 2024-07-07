import 'dart:developer';

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
      // 'https://www.googleapis.com/auth/contacts.readonly',
    ];

    GoogleSignIn googleSignIn = GoogleSignIn(
      scopes: scopes,
      clientId:
          "369476238484-l36188lc392abuqs6bv41gbja98fr8ma.apps.googleusercontent.com",
    );
    try {
      var account = await googleSignIn.signIn();
      debugPrint(account.toString());
      debugger();
      final auth = await account?.authentication;

      // final credential = GoogleAuthProvider.credential(
      //   accessToken: auth?.accessToken,
      //   idToken: auth?.idToken,
      // );
      // await FirebaseAuth.instance.signInWithCredential(credential);

      googleSignIn.disconnect();
      return right(account?.serverAuthCode);
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }
}
