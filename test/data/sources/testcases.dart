import 'package:common_code/common_code.dart';
import 'package:common_code/domain/profile/data/sources/remote/profile_remote_src.dart';
import 'package:common_code/domain/schedule/data/sources/remote/schedule_remote_source.dart';
import 'package:common_code/domain/schedule/entities/schedule.dart';
import 'package:mocktail/mocktail.dart';

class MockClient extends Mock implements APIClient {}

class MockEndpoints extends Mock implements Endpoints {}

abstract class Functions {
  String getAPI(String api);
  Endpoints endpoints = Endpoints();
}

class MockFunctions extends Mock implements Functions {}

final mockClient = MockClient();
final mockEndpoints = MockEndpoints();

final profileSrc =
    ProfileRemoteSrc(client: mockClient, endpoints: mockEndpoints);

final testCases = [
  TestCase(
    src: ScheduleRemoteSrc,
    entityType: Schedule,
    url: '/accounts/schedule',
    call: () => ScheduleRemoteSrc(client: mockClient).getMySchedule(),
  ),
  TestCase(
    src: ProfileRemoteSrc,
    entityType: Profile,
    url: '/abc',
    call: () => profileSrc.loadProfile('abc', 'any@email.com'),
  ),
  // TestCase(
  //   src: ProfileRemoteSrc,
  //   entityType: String,
  //   entity: 'account deleted',
  //   url: '/accounts?isDelete=true',
  //   call: () => profileSrc.deleteProfile(),
  // ),
  // call: () => profileSrc.updateProfile(const Profile(guid: 'abc')),
  // TestCase(
  //   src: ProfileRemoteSrc,
  //   entityType: String,
  //   url: '/accounts/mobileverified',
  //   call: () => profileSrc.getMobileOTP(),
  // ),
  // TestCase(
  //   src: ProfileRemoteSrc,
  //   entityType: String,
  //   url: '/accounts/mobileverified',
  //   call: () => profileSrc.verifyAddMobileOTP('1234'),
  // ),
  // TestCase(
  //   src: ProfileRemoteSrc,
  //   entityType: String,
  //   url: '/accounts/mobileverified?OTP=1234',
  //   call: () => profileSrc.verifyAddMobileOTP('1234'),
  // ),
  // TestCase(
  //   src: ProfileRemoteSrc,
  //   entityType: List<Review>,
  //   url: '/accounts/review',
  //   call: () => profileSrc.getReviews(),
  // ),
  TestCase(
    src: ProfileRemoteSrc,
    entityType: String,
    url: '/accounts/password?mail=email@domain.com',
    call: () => profileSrc.resetPasswordByEmail('email@domain.com'),
  ),
  // TestCase(
  //   src: ProfileRemoteSrc,
  //   entity: String,
  //   url: '/accounts/password/mobile?mobile=1234',
  //   call: () => profileSrc.resetPasswordByMobile('1234'),
  // ),
  // call: () => profileSrc.verifyResetPasswordByEmailOTP(),
  // call: () => profileSrc.verifyResetPasswordByMobileOTP(),
  // TestCase(
  //   src: ProfileRemoteSrc,
  //   entity: String,
  //   url: Endpoints().userStatus,
  //   call: () => profileSrc.updateStatus(0),
  // ),
];

void runWhen() {
  when(() => mockEndpoints.profile).thenAnswer((_) => '');
}

class TestCase<S, E> {
  Type src;
  Type entityType;
  dynamic entity;
  String url;
  Future<E> Function() call;
  TestCase({
    required this.src,
    required this.entityType,
    this.entity,
    required this.url,
    required this.call,
  });
}
