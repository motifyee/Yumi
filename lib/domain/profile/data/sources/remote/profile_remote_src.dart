import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
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
    final Response res = await DioClient.dio
        .get('${ApiKeys.getApiKeyString(apiKey: ApiKeys.profile)}/$id')
        .then((value) => value.data)
        .catchError((_) => false);

    if (res.statusCode != 200) throw ApiException();

    return Profile.fromJson(res.data).copyWith(
      updatedBy: '366',
      email: G.read<UserBloc>().state.user.email,
    );
  }

  @override
  Future<String> updateProfile(Profile profile) async {
    final data = profile.toJson();
    final Response<String> res;

    try {
      res = await DioClient.dio.put<String>(
        '${ApiKeys.getApiKeyString(apiKey: ApiKeys.profile)}?id=${data['guid']}',
        data: data,
      );
    } catch (e) {
      throw ApiException();
    }

    if (res.data == null) throw ApiException();
    return res.data!;
  }

  @override
  Future<String> deleteProfile() async {
    final Response<String> res;

    try {
      res = await DioClient.dio.delete<String>('/accounts?isDelete=true');
    } catch (e) {
      throw ApiException();
    }

    if (res.data == null) throw ApiException();
    return res.data!;
  }

  @override
  Future<String> getOTP() async {
    try {
      final call =
          await DioClient.dio.post<dynamic>('/accounts/mobileverified');

      return call.data['otp'];
    } catch (e) {
      throw ApiException();
    }
  }

  @override
  Future<String> verifyOTP(String otp) async {
    final Response<String> res;

    try {
      res = await DioClient.dio.put<String>(
        '/accounts/mobileverified?OTP=$otp',
      );
    } catch (e) {
      throw ApiException();
    }

    if (res.data == null) throw ApiException();
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
      throw ApiException();
    }

    if (res.data?['data'] == null) throw ApiException();
    final List<Review> reviews =
        res.data['data'].map<Review>((e) => Review.fromJson(e)).toList();

    return reviews;
  }

  @override
  Future<String> resetPassword(String email) async {
    final Response res;

    try {
      res = await DioClient.dio.post(
        '/accounts/password?mail=$email',
      );
    } catch (e) {
      throw ApiException();
    }

    if (res.data?['message'] == null) throw ApiException();
    return res.data['message'] as String;
  }
}
