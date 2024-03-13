part of 'documentation_bloc.dart';

class DocsState extends Equatable {
  final Profile profile;
  final BlocStatus status;

  final BlocStatus hygieneStatus;
  final BlocStatus registerationStatus;
  final BlocStatus riskStatus;
  final BlocStatus idStatus;

  @override
  List<Object> get props => [
        finished,
        uploadedCount,
        status,
        hygieneStatus,
        registerationStatus,
        riskStatus,
        idStatus
      ];

  get finished =>
      profile.hygienePhoto != null &&
      profile.registerationPhoto != null &&
      profile.riskPhoto != null &&
      profile.nidPhoto != null;

  get uploadedCount => [
        profile.hygienePhoto,
        profile.registerationPhoto,
        profile.riskPhoto,
        profile.contractPhoto,
        profile.nidPhoto,
      ].where((e) => e != null).length;

  get isUploadingAPhoto =>
      hygieneStatus.isLoading ||
      registerationStatus.isLoading ||
      riskStatus.isLoading ||
      idStatus.isLoading;

  const DocsState({
    this.profile = const Profile(),
    this.hygieneStatus = BlocStatus.init,
    this.registerationStatus = BlocStatus.init,
    this.riskStatus = BlocStatus.init,
    this.idStatus = BlocStatus.init,
    this.status = BlocStatus.init,
  });

  DocsState copyWith({
    Profile? profile,
    BlocStatus? hygieneStatus,
    BlocStatus? registerationStatus,
    BlocStatus? riskStatus,
    BlocStatus? idStatus,
    BlocStatus? status,
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
