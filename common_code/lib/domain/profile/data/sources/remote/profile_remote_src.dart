import 'dart:async';

import 'package:common_code/domain/profile/data/sources/profile_source.dart';
import 'package:common_code/common_code.dart';
import 'package:dependencies/dependencies.dart';

class ProfileRemoteSrc extends ProfileSrc {
  final APIClient client;
  final Endpoints endpoints;

  ProfileRemoteSrc({APIClient? client, Endpoints? endpoints})
      : client = client ?? APIClient(),
        endpoints = endpoints ?? Endpoints();

  @override
  Future<Profile> loadProfile(String id, String withEmail) async {
    if (id.isEmpty) throw GenericException();

    final Response res;
    try {
      res = await client.get('${endpoints.profile}/$id');

      return Profile.fromJson(res.data).copyWith(
        updatedBy: '366',
        email: withEmail,
      );
    } catch (e) {
      throw e.exceptionFromDio;
    }
  }

  @override
  Future<String> updateProfile(Profile profile) async {
    final data = profile.toJson();
    final Response<dynamic> response;
    final String? result;
    final id = profile.guid;

    if (id.isEmpty) throw GenericException();
    try {
      response = await client.put<dynamic>(
        '${endpoints.profile}?id=$id',
        data: data,
      );
      result = response.data;
    } catch (e) {
      throw e.exceptionFromDio;
    }

    if (result == null) throw ServerException();
    return result;
  }

  @override
  Future<String> deleteProfile() async {
    try {
      final response = await client.delete('/accounts?isDelete=true');
      String result = response.data;
      return result;
    } catch (e) {
      throw e.exceptionFromDio;
    }
  }

  @override
  Future<String> getMobileOTP() async {
    try {
      final call = await client.post<dynamic>('/accounts/mobileverified');

      return call.data['otp'];
    } catch (e) {
      throw e.exceptionFromDio;
    }
  }

  @override
  Future<String> verifyAddMobileOTP(String otp) async {
    try {
      final res = await client.put(
        '/accounts/mobileverified?OTP=$otp',
      );

      String result = res.data!;
      return result;
    } catch (e) {
      throw e.exceptionFromDio;
    }
  }

  @override
  Future<List<Review>> getReviews() async {
    try {
      final res = await client.get(
        '/accounts/review',
      );

      final List<Review> reviews =
          res.data['data'].map<Review>((e) => Review.fromJson(e)).toList();

      return reviews;
    } catch (e) {
      throw e.exceptionFromDio;
    }
  }

  @override
  Future<String> resetPasswordByEmail(String email) async {
    try {
      final res = await client.post(
        '/accounts/password?mail=$email',
      );

      return res.data['message'] as String;
    } catch (e) {
      throw e.exceptionFromDio;
    }
  }

  @override
  Future<String> resetPasswordByMobile(String mobile) async {
    try {
      final res = await client.post(
        '/accounts/password/mobile?mobile=$mobile',
      );

      return res.data['message'] as String;
    } catch (e) {
      throw e.exceptionFromDio;
    }
  }

  @override
  Future<String> verifyResetPasswordByEmailOTP(
    String email,
    String otp,
    String password,
  ) async {
    try {
      final res = await client.put(
        '/accounts/password',
        data: {
          'OTP': otp,
          'password': password,
          'mail': email,
        },
      );

      String result = res.data! as String;
      return result;
    } catch (e) {
      throw e.exceptionFromDio;
    }
  }

  @override
  Future<String> verifyResetPasswordByMobileOTP(
    String mobile,
    String otp,
    String password,
  ) async {
    try {
      final res = await client.put<dynamic>(
        '/accounts/password/mobile',
        data: {
          'OTP': otp,
          'password': password,
          'mobile': mobile,
        },
      );

      String result = res.data!;
      return result;
    } catch (e) {
      throw e.exceptionFromDio;
    }
  }

  @override
  Future<String> verifyEmail(String email) async {
    final Response res;

    try {
      res = await client.post(
        '/accounts/emailverified?email=$email',
      );
    } catch (e) {
      throw e.exceptionFromDio;
    }

    if (res.data == null) throw ServerException();
    return res.data!['otp'];
  }

  @override
  Future<String> updateStatus(int status) async {
    try {
      final res = await client.put(
        endpoints.userStatus,
        queryParameters: {'status': status},
      );

      String result = res.data as String;
      return result;
    } catch (e) {
      throw e.exceptionFromDio;
    }
  }
}
