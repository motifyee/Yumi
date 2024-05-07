part of 'documentation_bloc.dart';

class DocsState {
  final Profile profile;
  final Status status;

  final Status hygieneStatus;
  final Status registerationStatus;
  final Status riskStatus;
  final Status idStatus;

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
    this.hygieneStatus = Status.init,
    this.registerationStatus = Status.init,
    this.riskStatus = Status.init,
    this.idStatus = Status.init,
    this.status = Status.init,
  });

  DocsState copyWith({
    Profile? profile,
    Status? hygieneStatus,
    Status? registerationStatus,
    Status? riskStatus,
    Status? idStatus,
    Status? status,
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
