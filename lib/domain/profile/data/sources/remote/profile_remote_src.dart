import 'dart:convert';
import 'dart:math';

import 'package:dio/dio.dart';
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
    final Response<String> res;
    final id = profile.guid;

    if (id.isEmpty) throw GenericException();

    try {
      res = await DioClient.dio.put<String>(
        '${ApiKeys.getApiKeyString(apiKey: ApiKeys.profile)}?id=$id',
        data: data,
      );
    } catch (e) {
      throw ServerException();
    }

    if (res.data == null) throw ServerException();
    return res.data!;
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
  Future<String> addMobile() async {
    try {
      final call =
          await DioClient.dio.post<dynamic>('/accounts/mobileverified');

      return call.data['otp'];
    } catch (e) {
      throw ServerException();
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
  Future<String> resetPassword(String email) async {
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
  Future<String> verifyResetPasswordOTP(
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
}
