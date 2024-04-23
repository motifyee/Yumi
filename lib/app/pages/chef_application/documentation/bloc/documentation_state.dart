part of 'documentation_bloc.dart';

class DocsState {
  final Profile profile;
  final ObseleteStatusEnum status;

  final ObseleteStatusEnum hygieneStatus;
  final ObseleteStatusEnum registerationStatus;
  final ObseleteStatusEnum riskStatus;
  final ObseleteStatusEnum idStatus;

  // @override
  // List<Object> get props => [
  //       finished,
  //       uploadedCount,
  //       status,
  //       hygieneStatus,
  //       registerationStatus,
  //       riskStatus,
  //       idStatus
  //     ];

  // get finished =>
  //     profile.hygienePhoto != null &&
  //     profile.registerationPhoto != null &&
  //     profile.riskPhoto != null &&
  //     profile.nidPhoto != null;

  // get uploadedCount => [
  //       profile.hygienePhoto,
  //       profile.registerationPhoto,
  //       profile.riskPhoto,
  //       profile.contractPhoto,
  //       profile.nidPhoto,
  //     ].where((e) => e != null).length;

  // get isUploadingAPhoto =>
  //     hygieneStatus.isLoading ||
  //     registerationStatus.isLoading ||
  //     riskStatus.isLoading ||
  //     idStatus.isLoading;

  const DocsState({
    this.profile = const Profile(),
    this.hygieneStatus = ObseleteStatusEnum.init,
    this.registerationStatus = ObseleteStatusEnum.init,
    this.riskStatus = ObseleteStatusEnum.init,
    this.idStatus = ObseleteStatusEnum.init,
    this.status = ObseleteStatusEnum.init,
  });

  DocsState copyWith({
    Profile? profile,
    ObseleteStatusEnum? hygieneStatus,
    ObseleteStatusEnum? registerationStatus,
    ObseleteStatusEnum? riskStatus,
    ObseleteStatusEnum? idStatus,
    ObseleteStatusEnum? status,
  }) =>
      DocsState(
        profile: profile ?? this.profile,
        hygieneStatus: hygieneStatus ?? this.hygieneStatus,
        registerationStatus: registerationStatus ?? this.registerationStatus,
        riskStatus: riskStatus ?? this.riskStatus,
        idStatus: idStatus ?? this.idStatus,
        status: status ?? this.status,
      );
}
