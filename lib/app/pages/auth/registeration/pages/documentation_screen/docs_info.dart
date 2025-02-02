import 'package:common_code/domain/profile/entities/profile.dart';

final List<DocInfo> chefDocsInfo = [
  DocInfo(
    color: '#F4F4F4',
    title: 'Hygiene Certificate',
    desc: 'You must obtain level two',
    update: (Profile profile, String value) =>
        profile.copyWith(hygienePhoto: value),
    getdata: (Profile profile) => profile.hygienePhoto,
  ),
  DocInfo(
    color: '#EDEDED',
    title: 'Local Authority Registration',
    update: (Profile profile, String value) =>
        profile.copyWith(registerationPhoto: value),
    getdata: (Profile profile) => profile.registerationPhoto,
  ),
  DocInfo(
    color: '#F4F4F4',
    title: 'Risk Assessment',
    update: (Profile profile, String value) =>
        profile.copyWith(riskPhoto: value),
    getdata: (Profile profile) => profile.riskPhoto,
  ),
  DocInfo(
    color: '#EDEDED',
    title: 'ID/Passport copy',
    desc:
        'The passport must be of British or Irish nationality and valid for at least 6 months',
    targets: [
      DocumentTarget(
        option: 'Passport',
        update: (Profile profile, String value) =>
            profile.copyWith(passportPhoto: value),
      ),
      DocumentTarget(
        option: 'ID',
        update: (Profile profile, String value) =>
            profile.copyWith(nidPhoto: value),
      ),
    ],
    getdata: (Profile profile) => profile.idPhoto,
  ),
];

final List<DocInfo> driverDocsInfo = [
  DocInfo(
    color: '#F4F4F4',
    title: 'Driving License',
    update: (Profile profile, String value) =>
        profile.copyWith(driverLicensePhoto: value),
    getdata: (Profile profile) => profile.driverLicensePhoto,
  ),
  DocInfo(
    color: '#EDEDED',
    title: 'Driving License\'s Check Code',
    update: (Profile profile, String value) =>
        profile.copyWith(driverLicenseCodePhoto: value),
    getdata: (Profile profile) => profile.driverLicenseCodePhoto,
  ),
  DocInfo(
    color: '#F4F4F4',
    title: 'Food Delivery (H&R) Insurance',
    update: (Profile profile, String value) =>
        profile.copyWith(foodDeliveryInsurancePhoto: value),
    getdata: (Profile profile) => profile.foodDeliveryInsurancePhoto,
  ),
  chefDocsInfo[3],
  DocInfo(
    title: 'Evidence of Residence',
    showTitle: false,
    color: '#687C8E',
    desc:
        'For normal and electric bikes, you will only need to provide us with ID/Passport copy '
        '(The passport should be a British/Irish passport '
        '(for non-British/Irish passport accompanied by evidence of residence)).',
    update: (Profile profile, String value) =>
        profile.copyWith(evidenceOfResidencePhoto: value),
    getdata: (Profile profile) => profile.evidenceOfResidencePhoto,
  ),
];

class DocumentTarget {
  final String option;

  /// a method to set the value of current document in profile
  final Function(Profile profile, String value) update;

  DocumentTarget({required this.option, required this.update});
}

class DocInfo {
  final String color;
  final String title;
  final bool? showTitle;
  final String? desc;

  /// a list of target options for the document (e.g. passport, nid)
  final List<DocumentTarget>? targets;

  /// a method to set the value of current document in profile
  final Profile Function(Profile profile, String value)? update;

  /// return document image data from profile
  final String? Function(Profile) getdata;

  DocInfo({
    required this.color,
    required this.title,
    this.showTitle,
    this.desc,
    this.targets,
    this.update,
    required this.getdata,
  });
}
