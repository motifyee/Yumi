import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:yumi/bloc/user/user_bloc.dart';
import 'package:yumi/core/exceptions.dart';
import 'package:yumi/domain/profile/data/sources/profile_source.dart';
import 'package:yumi/domain/profile/entities/profile.dart';
import 'package:yumi/domain/profile/entities/review.dart';
import 'package:yumi/global.dart';
import 'package:yumi/statics/api_statics.dart';

class ProfileRemoteSrc extends ProfileSrc {
  @override
  Future<Profile> loadProfile(String id) async {
    if (id.isEmpty) throw GenericException();

    final Response res = await DioClient.dio
        .get('${ApiKeys.getApiKeyString(apiKey: ApiKeys.profile)}/$id');

    if (res.statusCode != 200) throw ServerException();

    return Profile.fromJson(res.data).copyWith(
      updatedBy: '366',
      email: G.read<UserBloc>().state.user.email,
    );
  }

  @override
  Future<String> updateProfile(Profile profile) async {
    final data = profile.toJson();
    final String? res;
    final id = profile.guid;

    if (id.isEmpty) throw GenericException();
    try {
      res = (await DioClient.dio.put<dynamic>(
              '${ApiKeys.getApiKeyString(apiKey: ApiKeys.profile)}?id=$id',
              data: data))
          .data;
    } catch (e) {
      throw ServerException(e);
    }

    if (res == null) throw ServerException();
    return res;
  }

  @override
  Future<String> deleteProfile() async {
    final Response<String> res;

    try {
      res = await DioClient.dio.delete<String>('/accounts?isDelete=true');
    } catch (e) {
      throw ServerException();
    }

    if (res.data == null) throw ServerException();
    return res.data!;
  }

  @override
  Future<String> getMobileOTP() async {
    try {
      final call =
          await DioClient.dio.post<dynamic>('/accounts/mobileverified');

      return call.data['otp'];
    } catch (e) {
      throw ServerException(e);
    }
  }

  @override
  Future<String> verifyAddMobileOTP(String otp) async {
    final Response<String> res;

    try {
      res = await DioClient.dio.put<String>(
        '/accounts/mobileverified?OTP=$otp',
      );
    } catch (e) {
      throw ServerException(e);
    }

    if (res.data == null) throw ServerException();
    return res.data!;
  }

  @override
  Future<List<Review>> getReviews() async {
    final Response res;

    try {
      res = await DioClient.dio.get(
        '/accounts/review',
      );
    } catch (e) {
      throw ServerException();
    }

    if (res.data?['data'] == null) throw ServerException();
    final List<Review> reviews =
        res.data['data'].map<Review>((e) => Review.fromJson(e)).toList();

    return reviews;
  }

  @override
  Future<String> resetPasswordByEmail(String email) async {
    final Response res;

    try {
      res = await DioClient.dio.post(
        '/accounts/password?mail=$email',
      );
    } catch (e) {
      throw ServerException();
    }

    if (res.data?['message'] == null) throw ServerException();
    return res.data['message'] as String;
  }

  @override
  Future<String> resetPasswordByMobile(String mobile) async {
    final Response res;

    try {
      res = await DioClient.dio.post(
        '/accounts/password/mobile?mobile=$mobile',
      );
    } catch (e) {
      throw ServerException(e);
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
      res = await DioClient.dio.put<String>(
        '/accounts/password',
        data: {
          'OTP': otp,
          'password': password,
          'mail': email,
        },
      );
    } catch (e) {
      throw ServerException(
          (jsonDecode((e as dynamic).response.data as String))['message']);
    }

    if (res.data == null) throw ServerException('Something went wrong!');
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
      res = await DioClient.dio.put<dynamic>(
        '/accounts/password/mobile',
        data: {
          'OTP': otp,
          'password': password,
          'mobile': mobile,
        },
      );
    } catch (e) {
      throw ServerException(e);
    }

    if (res.data == null) throw ServerException('Something went wrong!');
    return res.data!;
  }

  @override
  Future<String> verifyEmail(String email) async {
    final Response res;

    try {
      res = await DioClient.dio.post(
        '/accounts/emailverified?email=$email',
      );
    } catch (e) {
      throw ServerException(e);
    }

    if (res.data == null) throw ServerException('Something went wrong!');
    return res.data!['otp'];
  }
}
