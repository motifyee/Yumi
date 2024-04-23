import 'package:yumi/domain/profile/entities/profile.dart';

final List chefDocsInfo = [
  {
    'color': '#F4F4F4',
    "title": 'Hygiene Certificate',
    "desc": 'You must obtain level two',
    "update": (Profile profile, String value) =>
        profile.copyWith(hygienePhoto: value),
    "getdata": (Profile profile) => profile.hygienePhoto,
  },
  {
    'color': '#EDEDED',
    "title": 'Local Authority Registration',
    "desc": '',
    "update": (Profile profile, String value) =>
        profile.copyWith(registerationPhoto: value),
    "getdata": (Profile profile) => profile.registerationPhoto,
  },
  {
    'color': '#F4F4F4',
    "title": 'Risk Assessment',
    "desc": '',
    "update": (Profile profile, String value) =>
        profile.copyWith(riskPhoto: value),
    "getdata": (Profile profile) => profile.riskPhoto,
  },
  {
    'color': '#EDEDED',
    "title": 'ID/Passport copy',
    "desc":
        'The passport must be of British or Irish nationality and valid for at least 6 months',
    "targets": [
      {
        'option': 'Passport',
        "update": (Profile profile, String value) =>
            profile.copyWith(passportPhoto: value)
      },
      {
        'option': 'ID',
        "update": (Profile profile, String value) =>
            profile.copyWith(nidPhoto: value)
      }
    ],
    "getdata": (Profile profile) => profile.idPhoto,
  },
];

final List driverDocsInfo = [
  {
    'color': '#F4F4F4',
    "title": 'Driving License',
    "update": (Profile profile, String value) =>
        profile.copyWith(driverLicensePhoto: value),
    "getdata": (Profile profile) => profile.driverLicensePhoto,
  },
  {
    'color': '#EDEDED',
    "title": 'Driving License\'s Check Code',
    "update": (Profile profile, String value) =>
        profile.copyWith(driverLicenseCodePhoto: value),
    "getdata": (Profile profile) => profile.driverLicenseCodePhoto,
  },
  {
    'color': '#F4F4F4',
    "title": 'Food Delivery (H&R) Insurance',
    "update": (Profile profile, String value) =>
        profile.copyWith(foodDeliveryInsurancePhoto: value),
    "getdata": (Profile profile) => profile.foodDeliveryInsurancePhoto,
  },
  chefDocsInfo[3],
  {
    'color': '#687C8E',
    "desc": 'For normal and electric bikes, you will only need to provide us with ID/Passport copy '
        '(The passport should be a British/Irish passport '
        '(for non-British/Irish passport accompanied by evidence of residence)).',
    "update": (Profile profile, String value) =>
        profile.copyWith(evidenceOfResidencePhoto: value),
    "getdata": (Profile profile) => profile.evidenceOfResidencePhoto,
  },
];
