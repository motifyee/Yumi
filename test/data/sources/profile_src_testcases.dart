import 'package:common_code/common_code.dart';
import 'package:common_code/domain/profile/data/sources/remote/profile_remote_src.dart';
import 'package:mocktail/mocktail.dart';

import 'testcase.dart';

final profileSrc =
    ProfileRemoteSrc(client: mockClient, endpoints: mockEndpoints);

final profileTestSrc = TestCaseSrc(
  title: 'ProfileRemoteSrc',
  whens: () {
    when(() => mockEndpoints.profile).thenAnswer((_) => '');
    when(() => mockEndpoints.userStatus).thenAnswer((_) => '');
  },
  testCases: [
    TestCase(
      title: 'loadProfile',
      entityType: Profile,
      call: () => profileSrc.loadProfile('abc', 'any@email.com'),
    ),
    TestCase(
      title: 'deleteProfile',
      entityType: String,
      entity: 'account deleted',
      call: () => profileSrc.deleteProfile(),
    ),
    // call: () => profileSrc.updateProfile(const Profile(guid: 'abc')),
    TestCase(
      title: 'getMobileOTP',
      entityType: String,
      entity: {'otp': '123'},
      call: () => profileSrc.getMobileOTP(),
    ),
    TestCase(
      title: 'verifyAddMobileOTP',
      entityType: String,
      call: () => profileSrc.verifyAddMobileOTP('1234'),
    ),
    TestCase(
      title: 'verifyAddMobileOTP',
      entityType: String,
      call: () => profileSrc.verifyAddMobileOTP('1234'),
    ),
    TestCase(
      title: 'getReviews',
      entityType: List<Review>,
      entity: {'data': []},
      call: () => profileSrc.getReviews(),
    ),
    TestCase(
      title: 'resetPasswordByEmail',
      entityType: String,
      entity: {'message': 'zolo'},
      call: () => profileSrc.resetPasswordByEmail('email@domain.com'),
    ),
    TestCase(
      title: 'resetPasswordByMobile',
      entityType: String,
      entity: {'message': 'zolo'},
      call: () => profileSrc.resetPasswordByMobile('1234'),
    ),
    TestCase(
      title: 'verifyResetPasswordByEmailOTP',
      entityType: String,
      call: () =>
          profileSrc.verifyResetPasswordByEmailOTP('email', 'otp', 'pwd'),
    ),
    TestCase(
      title: 'verifyResetPasswordByMobileOTP',
      entityType: String,
      call: () =>
          profileSrc.verifyResetPasswordByMobileOTP('mobile', 'otp', 'pwd'),
    ),
    TestCase(
      title: 'updateStatus',
      entityType: String,
      call: () => profileSrc.updateStatus(0),
    ),
  ],
);
