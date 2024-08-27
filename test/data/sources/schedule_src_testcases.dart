import 'package:common_code/domain/schedule/data/sources/remote/schedule_remote_source.dart';
import 'package:common_code/domain/schedule/entities/schedule.dart';

import 'testcase.dart';

final scheduleSrc = ScheduleRemoteSrc(client: mockClient);

final scheduleTestSrc = TestCaseSrc(
  title: 'ScheduleRemoteSrc',
  testCases: [
    TestCase(
      title: 'getMySchedule',
      entityType: Schedule,
      call: () => scheduleSrc.getMySchedule(),
    ),
    TestCase(
      title: 'getMySchedule',
      entityType: String,
      call: () => scheduleSrc.saveMySchedule(const Schedule()),
    ),
  ],
);
