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
    } catch (e) {
      throw e.exceptionFromDio;
    }

    if (res.statusCode != 200) throw ServerException();

    return Profile.fromJson(res.data).copyWith(
      updatedBy: '366',
      email: withEmail,
    );
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
    final Response<String> res;

    try {
      res = await client.delete<String>('/accounts?isDelete=true');
    } catch (e) {
      throw e.exceptionFromDio;
    }

    if (res.data == null) throw ServerException();
    return res.data!;
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
    final Response<String> res;

    try {
      res = await client.put<String>(
        '/accounts/mobileverified?OTP=$otp',
      );
    } catch (e) {
      throw e.exceptionFromDio;
    }

    if (res.data == null) throw ServerException();
    return res.data!;
  }

  @override
  Future<List<Review>> getReviews() async {
    final Response res;

    try {
      res = await client.get(
        '/accounts/review',
      );
    } catch (e) {
      throw e.exceptionFromDio;
    }

    if (res.data?['data'] == null) throw ServerException();
    final List<Review> reviews = res.data['data'].map<Review>((e) => Review.fromJson(e)).toList();

    return reviews;
  }

  @override
  Future<String> resetPasswordByEmail(String email) async {
    final Response res;

    try {
      res = await client.post(
        '/accounts/password?mail=$email',
      );
    } catch (e) {
      throw e.exceptionFromDio;
    }

    if (res.data?['message'] == null) throw ServerException();
    return res.data['message'] as String;
  }

  @override
  Future<String> resetPasswordByMobile(String mobile) async {
    final Response res;

    try {
      res = await client.post(
        '/accounts/password/mobile?mobile=$mobile',
      );
    } catch (e) {
      throw e.exceptionFromDio;
    }

    if (res.data?['message'] == null) throw ServerException();
    return res.data['message'] as String;
  }

  @override
  Future<String> verifyResetPasswordByEmailOTP(
    String email,
    String otp,
    String password,
  ) async {
    final Response<String> res;

    try {
      res = await client.put<String>(
        '/accounts/password',
        data: {
          'OTP': otp,
          'password': password,
          'mail': email,
        },
      );
    } catch (e) {
      throw e.exceptionFromDio;
    }

    if (res.data == null) throw ServerException();
    return res.data!;
  }

  @override
  Future<String> verifyResetPasswordByMobileOTP(
    String mobile,
    String otp,
    String password,
  ) async {
    final Response<dynamic> res;

    try {
      res = await client.put<dynamic>(
        '/accounts/password/mobile',
        data: {
          'OTP': otp,
          'password': password,
          'mobile': mobile,
        },
      );
    } catch (e) {
      throw e.exceptionFromDio;
    }

    if (res.data == null) throw ServerException();
    return res.data!;
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

      return res.data.toString();
    } catch (e) {
      throw e.exceptionFromDio;
    }
  }
}
