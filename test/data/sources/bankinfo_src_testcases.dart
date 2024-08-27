import 'package:common_code/domain/bank_info/data/sources/remote/bank_info_remote_src.dart';
import 'package:common_code/domain/bank_info/entities/bankinfo_model.dart';
import 'package:mocktail/mocktail.dart';

import 'testcase.dart';

final bankinfoSrc = BankInfoRemoteSrc(
  client: mockClient,
  endpoints: mockEndpoints,
);

final bankinfoTestSrc = TestCaseSrc(
  title: 'BankInfoRemoteSrc',
  whens: () {
    when(() => mockEndpoints.info).thenReturn('');
  },
  testCases: [
    TestCase(
      title: 'addBankInfo',
      entityType: String,
      call: () => bankinfoSrc.addBankInfo(const BankInfo()),
    ),
    TestCase(
      title: 'getBankInfo',
      entityType: BankInfo,
      entity: {'data': []},
      call: () => bankinfoSrc.getBankInfo(),
    ),
    TestCase(
      title: 'updateBankInfo',
      entityType: String,
      call: () => bankinfoSrc.updateBankInfo(const BankInfo()),
    ),
  ],
);
