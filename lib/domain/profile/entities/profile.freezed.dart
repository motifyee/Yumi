// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Profile _$ProfileFromJson(Map<String, dynamic> json) {
  return _Profile.fromJson(json);
}

/// @nodoc
mixin _$Profile {
  @JsonKey(includeToJson: false, includeFromJson: false)
  EntityStatus get entityStatus => throw _privateConstructorUsedError; //
  String get code => throw _privateConstructorUsedError;
  String get branchId => throw _privateConstructorUsedError;
  String get guid => throw _privateConstructorUsedError;
  int get id => throw _privateConstructorUsedError;
  String get fullName => throw _privateConstructorUsedError;
  String get userName => throw _privateConstructorUsedError;
  String get bio => throw _privateConstructorUsedError;
  @JsonKey(name: 'image_Profile')
  String? get profileImage => throw _privateConstructorUsedError; //
  String get mobile => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get address => throw _privateConstructorUsedError;
  String get about => throw _privateConstructorUsedError;
  double get rate => throw _privateConstructorUsedError;
  @JsonKey(name: 'pickup_Allowed')
  bool get pickup => throw _privateConstructorUsedError;
  @JsonKey(name: 'pickup_Only')
  bool get pickupOnly => throw _privateConstructorUsedError; //
  int get signupType => throw _privateConstructorUsedError;
  String get registerDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'status')
  bool get userStatus => throw _privateConstructorUsedError;
  @JsonKey(includeToJson: false)
  Country get country => throw _privateConstructorUsedError;
  String get updatedBy => throw _privateConstructorUsedError; // Event Photos
  @JsonKey(name: 'image_Profile_1')
  String? get eventPhoto0 => throw _privateConstructorUsedError;
  @JsonKey(name: 'image_Profile_2')
  String? get eventPhoto1 => throw _privateConstructorUsedError;
  @JsonKey(name: 'image_Profile_3')
  String? get eventPhoto2 => throw _privateConstructorUsedError;
  @JsonKey(name: 'image_Profile_4')
  String? get eventPhoto3 => throw _privateConstructorUsedError;
  @JsonKey(name: 'image_Profile_5')
  String? get eventPhoto4 => throw _privateConstructorUsedError; //
  @JsonKey(name: 'account_Approved')
  bool get accountApproved => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_Hygiene')
  bool get isHygiene => throw _privateConstructorUsedError; // Documents
// chef
  @JsonKey(name: 'image_Hygiene_Cert')
  String? get hygienePhoto => throw _privateConstructorUsedError;
  @JsonKey(name: 'image_Risk_Assessment')
  String? get riskPhoto => throw _privateConstructorUsedError;
  @JsonKey(name: 'image_Authority_Reg')
  String? get registerationPhoto => throw _privateConstructorUsedError; //driver
  @JsonKey(name: 'image_Driver_License')
  String? get driverLicensePhoto => throw _privateConstructorUsedError;
  @JsonKey(name: 'image_Driver_License_Code')
  String? get driverLicenseCodePhoto => throw _privateConstructorUsedError;
  @JsonKey(name: 'image_Food_Delivery_Insurance')
  String? get foodDeliveryInsurancePhoto => throw _privateConstructorUsedError;
  @JsonKey(name: 'image_Evidence_Of_Residence')
  String? get evidenceOfResidencePhoto =>
      throw _privateConstructorUsedError; //common
  @JsonKey(name: 'image_Passport')
  String? get passportPhoto => throw _privateConstructorUsedError;
  @JsonKey(name: 'image_Id')
  String? get nidPhoto => throw _privateConstructorUsedError; //
  @JsonKey(name: 'image_Contract')
  String? get contractPhoto => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProfileCopyWith<Profile> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfileCopyWith<$Res> {
  factory $ProfileCopyWith(Profile value, $Res Function(Profile) then) =
      _$ProfileCopyWithImpl<$Res, Profile>;
  @useResult
  $Res call(
      {@JsonKey(includeToJson: false, includeFromJson: false)
      EntityStatus entityStatus,
      String code,
      String branchId,
      String guid,
      int id,
      String fullName,
      String userName,
      String bio,
      @JsonKey(name: 'image_Profile') String? profileImage,
      String mobile,
      String email,
      String address,
      String about,
      double rate,
      @JsonKey(name: 'pickup_Allowed') bool pickup,
      @JsonKey(name: 'pickup_Only') bool pickupOnly,
      int signupType,
      String registerDate,
      @JsonKey(name: 'status') bool userStatus,
      @JsonKey(includeToJson: false) Country country,
      String updatedBy,
      @JsonKey(name: 'image_Profile_1') String? eventPhoto0,
      @JsonKey(name: 'image_Profile_2') String? eventPhoto1,
      @JsonKey(name: 'image_Profile_3') String? eventPhoto2,
      @JsonKey(name: 'image_Profile_4') String? eventPhoto3,
      @JsonKey(name: 'image_Profile_5') String? eventPhoto4,
      @JsonKey(name: 'account_Approved') bool accountApproved,
      @JsonKey(name: 'is_Hygiene') bool isHygiene,
      @JsonKey(name: 'image_Hygiene_Cert') String? hygienePhoto,
      @JsonKey(name: 'image_Risk_Assessment') String? riskPhoto,
      @JsonKey(name: 'image_Authority_Reg') String? registerationPhoto,
      @JsonKey(name: 'image_Driver_License') String? driverLicensePhoto,
      @JsonKey(name: 'image_Driver_License_Code')
      String? driverLicenseCodePhoto,
      @JsonKey(name: 'image_Food_Delivery_Insurance')
      String? foodDeliveryInsurancePhoto,
      @JsonKey(name: 'image_Evidence_Of_Residence')
      String? evidenceOfResidencePhoto,
      @JsonKey(name: 'image_Passport') String? passportPhoto,
      @JsonKey(name: 'image_Id') String? nidPhoto,
      @JsonKey(name: 'image_Contract') String? contractPhoto});
}

/// @nodoc
class _$ProfileCopyWithImpl<$Res, $Val extends Profile>
    implements $ProfileCopyWith<$Res> {
  _$ProfileCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? entityStatus = null,
    Object? code = null,
    Object? branchId = null,
    Object? guid = null,
    Object? id = null,
    Object? fullName = null,
    Object? userName = null,
    Object? bio = null,
    Object? profileImage = freezed,
    Object? mobile = null,
    Object? email = null,
    Object? address = null,
    Object? about = null,
    Object? rate = null,
    Object? pickup = null,
    Object? pickupOnly = null,
    Object? signupType = null,
    Object? registerDate = null,
    Object? userStatus = null,
    Object? country = null,
    Object? updatedBy = null,
    Object? eventPhoto0 = freezed,
    Object? eventPhoto1 = freezed,
    Object? eventPhoto2 = freezed,
    Object? eventPhoto3 = freezed,
    Object? eventPhoto4 = freezed,
    Object? accountApproved = null,
    Object? isHygiene = null,
    Object? hygienePhoto = freezed,
    Object? riskPhoto = freezed,
    Object? registerationPhoto = freezed,
    Object? driverLicensePhoto = freezed,
    Object? driverLicenseCodePhoto = freezed,
    Object? foodDeliveryInsurancePhoto = freezed,
    Object? evidenceOfResidencePhoto = freezed,
    Object? passportPhoto = freezed,
    Object? nidPhoto = freezed,
    Object? contractPhoto = freezed,
  }) {
    return _then(_value.copyWith(
      entityStatus: null == entityStatus
          ? _value.entityStatus
          : entityStatus // ignore: cast_nullable_to_non_nullable
              as EntityStatus,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      branchId: null == branchId
          ? _value.branchId
          : branchId // ignore: cast_nullable_to_non_nullable
              as String,
      guid: null == guid
          ? _value.guid
          : guid // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      fullName: null == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String,
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      bio: null == bio
          ? _value.bio
          : bio // ignore: cast_nullable_to_non_nullable
              as String,
      profileImage: freezed == profileImage
          ? _value.profileImage
          : profileImage // ignore: cast_nullable_to_non_nullable
              as String?,
      mobile: null == mobile
          ? _value.mobile
          : mobile // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      about: null == about
          ? _value.about
          : about // ignore: cast_nullable_to_non_nullable
              as String,
      rate: null == rate
          ? _value.rate
          : rate // ignore: cast_nullable_to_non_nullable
              as double,
      pickup: null == pickup
          ? _value.pickup
          : pickup // ignore: cast_nullable_to_non_nullable
              as bool,
      pickupOnly: null == pickupOnly
          ? _value.pickupOnly
          : pickupOnly // ignore: cast_nullable_to_non_nullable
              as bool,
      signupType: null == signupType
          ? _value.signupType
          : signupType // ignore: cast_nullable_to_non_nullable
              as int,
      registerDate: null == registerDate
          ? _value.registerDate
          : registerDate // ignore: cast_nullable_to_non_nullable
              as String,
      userStatus: null == userStatus
          ? _value.userStatus
          : userStatus // ignore: cast_nullable_to_non_nullable
              as bool,
      country: null == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as Country,
      updatedBy: null == updatedBy
          ? _value.updatedBy
          : updatedBy // ignore: cast_nullable_to_non_nullable
              as String,
      eventPhoto0: freezed == eventPhoto0
          ? _value.eventPhoto0
          : eventPhoto0 // ignore: cast_nullable_to_non_nullable
              as String?,
      eventPhoto1: freezed == eventPhoto1
          ? _value.eventPhoto1
          : eventPhoto1 // ignore: cast_nullable_to_non_nullable
              as String?,
      eventPhoto2: freezed == eventPhoto2
          ? _value.eventPhoto2
          : eventPhoto2 // ignore: cast_nullable_to_non_nullable
              as String?,
      eventPhoto3: freezed == eventPhoto3
          ? _value.eventPhoto3
          : eventPhoto3 // ignore: cast_nullable_to_non_nullable
              as String?,
      eventPhoto4: freezed == eventPhoto4
          ? _value.eventPhoto4
          : eventPhoto4 // ignore: cast_nullable_to_non_nullable
              as String?,
      accountApproved: null == accountApproved
          ? _value.accountApproved
          : accountApproved // ignore: cast_nullable_to_non_nullable
              as bool,
      isHygiene: null == isHygiene
          ? _value.isHygiene
          : isHygiene // ignore: cast_nullable_to_non_nullable
              as bool,
      hygienePhoto: freezed == hygienePhoto
          ? _value.hygienePhoto
          : hygienePhoto // ignore: cast_nullable_to_non_nullable
              as String?,
      riskPhoto: freezed == riskPhoto
          ? _value.riskPhoto
          : riskPhoto // ignore: cast_nullable_to_non_nullable
              as String?,
      registerationPhoto: freezed == registerationPhoto
          ? _value.registerationPhoto
          : registerationPhoto // ignore: cast_nullable_to_non_nullable
              as String?,
      driverLicensePhoto: freezed == driverLicensePhoto
          ? _value.driverLicensePhoto
          : driverLicensePhoto // ignore: cast_nullable_to_non_nullable
              as String?,
      driverLicenseCodePhoto: freezed == driverLicenseCodePhoto
          ? _value.driverLicenseCodePhoto
          : driverLicenseCodePhoto // ignore: cast_nullable_to_non_nullable
              as String?,
      foodDeliveryInsurancePhoto: freezed == foodDeliveryInsurancePhoto
          ? _value.foodDeliveryInsurancePhoto
          : foodDeliveryInsurancePhoto // ignore: cast_nullable_to_non_nullable
              as String?,
      evidenceOfResidencePhoto: freezed == evidenceOfResidencePhoto
          ? _value.evidenceOfResidencePhoto
          : evidenceOfResidencePhoto // ignore: cast_nullable_to_non_nullable
              as String?,
      passportPhoto: freezed == passportPhoto
          ? _value.passportPhoto
          : passportPhoto // ignore: cast_nullable_to_non_nullable
              as String?,
      nidPhoto: freezed == nidPhoto
          ? _value.nidPhoto
          : nidPhoto // ignore: cast_nullable_to_non_nullable
              as String?,
      contractPhoto: freezed == contractPhoto
          ? _value.contractPhoto
          : contractPhoto // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProfileImplCopyWith<$Res> implements $ProfileCopyWith<$Res> {
  factory _$$ProfileImplCopyWith(
          _$ProfileImpl value, $Res Function(_$ProfileImpl) then) =
      __$$ProfileImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(includeToJson: false, includeFromJson: false)
      EntityStatus entityStatus,
      String code,
      String branchId,
      String guid,
      int id,
      String fullName,
      String userName,
      String bio,
      @JsonKey(name: 'image_Profile') String? profileImage,
      String mobile,
      String email,
      String address,
      String about,
      double rate,
      @JsonKey(name: 'pickup_Allowed') bool pickup,
      @JsonKey(name: 'pickup_Only') bool pickupOnly,
      int signupType,
      String registerDate,
      @JsonKey(name: 'status') bool userStatus,
      @JsonKey(includeToJson: false) Country country,
      String updatedBy,
      @JsonKey(name: 'image_Profile_1') String? eventPhoto0,
      @JsonKey(name: 'image_Profile_2') String? eventPhoto1,
      @JsonKey(name: 'image_Profile_3') String? eventPhoto2,
      @JsonKey(name: 'image_Profile_4') String? eventPhoto3,
      @JsonKey(name: 'image_Profile_5') String? eventPhoto4,
      @JsonKey(name: 'account_Approved') bool accountApproved,
      @JsonKey(name: 'is_Hygiene') bool isHygiene,
      @JsonKey(name: 'image_Hygiene_Cert') String? hygienePhoto,
      @JsonKey(name: 'image_Risk_Assessment') String? riskPhoto,
      @JsonKey(name: 'image_Authority_Reg') String? registerationPhoto,
      @JsonKey(name: 'image_Driver_License') String? driverLicensePhoto,
      @JsonKey(name: 'image_Driver_License_Code')
      String? driverLicenseCodePhoto,
      @JsonKey(name: 'image_Food_Delivery_Insurance')
      String? foodDeliveryInsurancePhoto,
      @JsonKey(name: 'image_Evidence_Of_Residence')
      String? evidenceOfResidencePhoto,
      @JsonKey(name: 'image_Passport') String? passportPhoto,
      @JsonKey(name: 'image_Id') String? nidPhoto,
      @JsonKey(name: 'image_Contract') String? contractPhoto});
}

/// @nodoc
class __$$ProfileImplCopyWithImpl<$Res>
    extends _$ProfileCopyWithImpl<$Res, _$ProfileImpl>
    implements _$$ProfileImplCopyWith<$Res> {
  __$$ProfileImplCopyWithImpl(
      _$ProfileImpl _value, $Res Function(_$ProfileImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? entityStatus = null,
    Object? code = null,
    Object? branchId = null,
    Object? guid = null,
    Object? id = null,
    Object? fullName = null,
    Object? userName = null,
    Object? bio = null,
    Object? profileImage = freezed,
    Object? mobile = null,
    Object? email = null,
    Object? address = null,
    Object? about = null,
    Object? rate = null,
    Object? pickup = null,
    Object? pickupOnly = null,
    Object? signupType = null,
    Object? registerDate = null,
    Object? userStatus = null,
    Object? country = null,
    Object? updatedBy = null,
    Object? eventPhoto0 = freezed,
    Object? eventPhoto1 = freezed,
    Object? eventPhoto2 = freezed,
    Object? eventPhoto3 = freezed,
    Object? eventPhoto4 = freezed,
    Object? accountApproved = null,
    Object? isHygiene = null,
    Object? hygienePhoto = freezed,
    Object? riskPhoto = freezed,
    Object? registerationPhoto = freezed,
    Object? driverLicensePhoto = freezed,
    Object? driverLicenseCodePhoto = freezed,
    Object? foodDeliveryInsurancePhoto = freezed,
    Object? evidenceOfResidencePhoto = freezed,
    Object? passportPhoto = freezed,
    Object? nidPhoto = freezed,
    Object? contractPhoto = freezed,
  }) {
    return _then(_$ProfileImpl(
      entityStatus: null == entityStatus
          ? _value.entityStatus
          : entityStatus // ignore: cast_nullable_to_non_nullable
              as EntityStatus,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      branchId: null == branchId
          ? _value.branchId
          : branchId // ignore: cast_nullable_to_non_nullable
              as String,
      guid: null == guid
          ? _value.guid
          : guid // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      fullName: null == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String,
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      bio: null == bio
          ? _value.bio
          : bio // ignore: cast_nullable_to_non_nullable
              as String,
      profileImage: freezed == profileImage
          ? _value.profileImage
          : profileImage // ignore: cast_nullable_to_non_nullable
              as String?,
      mobile: null == mobile
          ? _value.mobile
          : mobile // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      about: null == about
          ? _value.about
          : about // ignore: cast_nullable_to_non_nullable
              as String,
      rate: null == rate
          ? _value.rate
          : rate // ignore: cast_nullable_to_non_nullable
              as double,
      pickup: null == pickup
          ? _value.pickup
          : pickup // ignore: cast_nullable_to_non_nullable
              as bool,
      pickupOnly: null == pickupOnly
          ? _value.pickupOnly
          : pickupOnly // ignore: cast_nullable_to_non_nullable
              as bool,
      signupType: null == signupType
          ? _value.signupType
          : signupType // ignore: cast_nullable_to_non_nullable
              as int,
      registerDate: null == registerDate
          ? _value.registerDate
          : registerDate // ignore: cast_nullable_to_non_nullable
              as String,
      userStatus: null == userStatus
          ? _value.userStatus
          : userStatus // ignore: cast_nullable_to_non_nullable
              as bool,
      country: null == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as Country,
      updatedBy: null == updatedBy
          ? _value.updatedBy
          : updatedBy // ignore: cast_nullable_to_non_nullable
              as String,
      eventPhoto0: freezed == eventPhoto0
          ? _value.eventPhoto0
          : eventPhoto0 // ignore: cast_nullable_to_non_nullable
              as String?,
      eventPhoto1: freezed == eventPhoto1
          ? _value.eventPhoto1
          : eventPhoto1 // ignore: cast_nullable_to_non_nullable
              as String?,
      eventPhoto2: freezed == eventPhoto2
          ? _value.eventPhoto2
          : eventPhoto2 // ignore: cast_nullable_to_non_nullable
              as String?,
      eventPhoto3: freezed == eventPhoto3
          ? _value.eventPhoto3
          : eventPhoto3 // ignore: cast_nullable_to_non_nullable
              as String?,
      eventPhoto4: freezed == eventPhoto4
          ? _value.eventPhoto4
          : eventPhoto4 // ignore: cast_nullable_to_non_nullable
              as String?,
      accountApproved: null == accountApproved
          ? _value.accountApproved
          : accountApproved // ignore: cast_nullable_to_non_nullable
              as bool,
      isHygiene: null == isHygiene
          ? _value.isHygiene
          : isHygiene // ignore: cast_nullable_to_non_nullable
              as bool,
      hygienePhoto: freezed == hygienePhoto
          ? _value.hygienePhoto
          : hygienePhoto // ignore: cast_nullable_to_non_nullable
              as String?,
      riskPhoto: freezed == riskPhoto
          ? _value.riskPhoto
          : riskPhoto // ignore: cast_nullable_to_non_nullable
              as String?,
      registerationPhoto: freezed == registerationPhoto
          ? _value.registerationPhoto
          : registerationPhoto // ignore: cast_nullable_to_non_nullable
              as String?,
      driverLicensePhoto: freezed == driverLicensePhoto
          ? _value.driverLicensePhoto
          : driverLicensePhoto // ignore: cast_nullable_to_non_nullable
              as String?,
      driverLicenseCodePhoto: freezed == driverLicenseCodePhoto
          ? _value.driverLicenseCodePhoto
          : driverLicenseCodePhoto // ignore: cast_nullable_to_non_nullable
              as String?,
      foodDeliveryInsurancePhoto: freezed == foodDeliveryInsurancePhoto
          ? _value.foodDeliveryInsurancePhoto
          : foodDeliveryInsurancePhoto // ignore: cast_nullable_to_non_nullable
              as String?,
      evidenceOfResidencePhoto: freezed == evidenceOfResidencePhoto
          ? _value.evidenceOfResidencePhoto
          : evidenceOfResidencePhoto // ignore: cast_nullable_to_non_nullable
              as String?,
      passportPhoto: freezed == passportPhoto
          ? _value.passportPhoto
          : passportPhoto // ignore: cast_nullable_to_non_nullable
              as String?,
      nidPhoto: freezed == nidPhoto
          ? _value.nidPhoto
          : nidPhoto // ignore: cast_nullable_to_non_nullable
              as String?,
      contractPhoto: freezed == contractPhoto
          ? _value.contractPhoto
          : contractPhoto // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProfileImpl extends _Profile {
  const _$ProfileImpl(
      {@JsonKey(includeToJson: false, includeFromJson: false)
      this.entityStatus = const EntityStatus(status: Status.idle),
      this.code = '',
      this.branchId = '',
      this.guid = '',
      this.id = 0,
      this.fullName = '',
      this.userName = '',
      this.bio = '',
      @JsonKey(name: 'image_Profile') this.profileImage,
      this.mobile = '',
      this.email = '',
      this.address = '',
      this.about = '',
      this.rate = 0.0,
      @JsonKey(name: 'pickup_Allowed') this.pickup = false,
      @JsonKey(name: 'pickup_Only') this.pickupOnly = false,
      this.signupType = 0,
      this.registerDate = '',
      @JsonKey(name: 'status') this.userStatus = false,
      @JsonKey(includeToJson: false) this.country = const Country(),
      this.updatedBy = '',
      @JsonKey(name: 'image_Profile_1') this.eventPhoto0,
      @JsonKey(name: 'image_Profile_2') this.eventPhoto1,
      @JsonKey(name: 'image_Profile_3') this.eventPhoto2,
      @JsonKey(name: 'image_Profile_4') this.eventPhoto3,
      @JsonKey(name: 'image_Profile_5') this.eventPhoto4,
      @JsonKey(name: 'account_Approved') this.accountApproved = false,
      @JsonKey(name: 'is_Hygiene') this.isHygiene = false,
      @JsonKey(name: 'image_Hygiene_Cert') this.hygienePhoto,
      @JsonKey(name: 'image_Risk_Assessment') this.riskPhoto,
      @JsonKey(name: 'image_Authority_Reg') this.registerationPhoto,
      @JsonKey(name: 'image_Driver_License') this.driverLicensePhoto,
      @JsonKey(name: 'image_Driver_License_Code') this.driverLicenseCodePhoto,
      @JsonKey(name: 'image_Food_Delivery_Insurance')
      this.foodDeliveryInsurancePhoto,
      @JsonKey(name: 'image_Evidence_Of_Residence')
      this.evidenceOfResidencePhoto,
      @JsonKey(name: 'image_Passport') this.passportPhoto,
      @JsonKey(name: 'image_Id') this.nidPhoto,
      @JsonKey(name: 'image_Contract') this.contractPhoto})
      : super._();

  factory _$ProfileImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProfileImplFromJson(json);

  @override
  @JsonKey(includeToJson: false, includeFromJson: false)
  final EntityStatus entityStatus;
//
  @override
  @JsonKey()
  final String code;
  @override
  @JsonKey()
  final String branchId;
  @override
  @JsonKey()
  final String guid;
  @override
  @JsonKey()
  final int id;
  @override
  @JsonKey()
  final String fullName;
  @override
  @JsonKey()
  final String userName;
  @override
  @JsonKey()
  final String bio;
  @override
  @JsonKey(name: 'image_Profile')
  final String? profileImage;
//
  @override
  @JsonKey()
  final String mobile;
  @override
  @JsonKey()
  final String email;
  @override
  @JsonKey()
  final String address;
  @override
  @JsonKey()
  final String about;
  @override
  @JsonKey()
  final double rate;
  @override
  @JsonKey(name: 'pickup_Allowed')
  final bool pickup;
  @override
  @JsonKey(name: 'pickup_Only')
  final bool pickupOnly;
//
  @override
  @JsonKey()
  final int signupType;
  @override
  @JsonKey()
  final String registerDate;
  @override
  @JsonKey(name: 'status')
  final bool userStatus;
  @override
  @JsonKey(includeToJson: false)
  final Country country;
  @override
  @JsonKey()
  final String updatedBy;
// Event Photos
  @override
  @JsonKey(name: 'image_Profile_1')
  final String? eventPhoto0;
  @override
  @JsonKey(name: 'image_Profile_2')
  final String? eventPhoto1;
  @override
  @JsonKey(name: 'image_Profile_3')
  final String? eventPhoto2;
  @override
  @JsonKey(name: 'image_Profile_4')
  final String? eventPhoto3;
  @override
  @JsonKey(name: 'image_Profile_5')
  final String? eventPhoto4;
//
  @override
  @JsonKey(name: 'account_Approved')
  final bool accountApproved;
  @override
  @JsonKey(name: 'is_Hygiene')
  final bool isHygiene;
// Documents
// chef
  @override
  @JsonKey(name: 'image_Hygiene_Cert')
  final String? hygienePhoto;
  @override
  @JsonKey(name: 'image_Risk_Assessment')
  final String? riskPhoto;
  @override
  @JsonKey(name: 'image_Authority_Reg')
  final String? registerationPhoto;
//driver
  @override
  @JsonKey(name: 'image_Driver_License')
  final String? driverLicensePhoto;
  @override
  @JsonKey(name: 'image_Driver_License_Code')
  final String? driverLicenseCodePhoto;
  @override
  @JsonKey(name: 'image_Food_Delivery_Insurance')
  final String? foodDeliveryInsurancePhoto;
  @override
  @JsonKey(name: 'image_Evidence_Of_Residence')
  final String? evidenceOfResidencePhoto;
//common
  @override
  @JsonKey(name: 'image_Passport')
  final String? passportPhoto;
  @override
  @JsonKey(name: 'image_Id')
  final String? nidPhoto;
//
  @override
  @JsonKey(name: 'image_Contract')
  final String? contractPhoto;

  @override
  String toString() {
    return 'Profile(entityStatus: $entityStatus, code: $code, branchId: $branchId, guid: $guid, id: $id, fullName: $fullName, userName: $userName, bio: $bio, profileImage: $profileImage, mobile: $mobile, email: $email, address: $address, about: $about, rate: $rate, pickup: $pickup, pickupOnly: $pickupOnly, signupType: $signupType, registerDate: $registerDate, userStatus: $userStatus, country: $country, updatedBy: $updatedBy, eventPhoto0: $eventPhoto0, eventPhoto1: $eventPhoto1, eventPhoto2: $eventPhoto2, eventPhoto3: $eventPhoto3, eventPhoto4: $eventPhoto4, accountApproved: $accountApproved, isHygiene: $isHygiene, hygienePhoto: $hygienePhoto, riskPhoto: $riskPhoto, registerationPhoto: $registerationPhoto, driverLicensePhoto: $driverLicensePhoto, driverLicenseCodePhoto: $driverLicenseCodePhoto, foodDeliveryInsurancePhoto: $foodDeliveryInsurancePhoto, evidenceOfResidencePhoto: $evidenceOfResidencePhoto, passportPhoto: $passportPhoto, nidPhoto: $nidPhoto, contractPhoto: $contractPhoto)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProfileImpl &&
            (identical(other.entityStatus, entityStatus) ||
                other.entityStatus == entityStatus) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.branchId, branchId) ||
                other.branchId == branchId) &&
            (identical(other.guid, guid) || other.guid == guid) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName) &&
            (identical(other.userName, userName) ||
                other.userName == userName) &&
            (identical(other.bio, bio) || other.bio == bio) &&
            (identical(other.profileImage, profileImage) ||
                other.profileImage == profileImage) &&
            (identical(other.mobile, mobile) || other.mobile == mobile) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.about, about) || other.about == about) &&
            (identical(other.rate, rate) || other.rate == rate) &&
            (identical(other.pickup, pickup) || other.pickup == pickup) &&
            (identical(other.pickupOnly, pickupOnly) ||
                other.pickupOnly == pickupOnly) &&
            (identical(other.signupType, signupType) ||
                other.signupType == signupType) &&
            (identical(other.registerDate, registerDate) ||
                other.registerDate == registerDate) &&
            (identical(other.userStatus, userStatus) ||
                other.userStatus == userStatus) &&
            (identical(other.country, country) || other.country == country) &&
            (identical(other.updatedBy, updatedBy) ||
                other.updatedBy == updatedBy) &&
            (identical(other.eventPhoto0, eventPhoto0) ||
                other.eventPhoto0 == eventPhoto0) &&
            (identical(other.eventPhoto1, eventPhoto1) ||
                other.eventPhoto1 == eventPhoto1) &&
            (identical(other.eventPhoto2, eventPhoto2) ||
                other.eventPhoto2 == eventPhoto2) &&
            (identical(other.eventPhoto3, eventPhoto3) ||
                other.eventPhoto3 == eventPhoto3) &&
            (identical(other.eventPhoto4, eventPhoto4) ||
                other.eventPhoto4 == eventPhoto4) &&
            (identical(other.accountApproved, accountApproved) ||
                other.accountApproved == accountApproved) &&
            (identical(other.isHygiene, isHygiene) ||
                other.isHygiene == isHygiene) &&
            (identical(other.hygienePhoto, hygienePhoto) ||
                other.hygienePhoto == hygienePhoto) &&
            (identical(other.riskPhoto, riskPhoto) ||
                other.riskPhoto == riskPhoto) &&
            (identical(other.registerationPhoto, registerationPhoto) ||
                other.registerationPhoto == registerationPhoto) &&
            (identical(other.driverLicensePhoto, driverLicensePhoto) ||
                other.driverLicensePhoto == driverLicensePhoto) &&
            (identical(other.driverLicenseCodePhoto, driverLicenseCodePhoto) ||
                other.driverLicenseCodePhoto == driverLicenseCodePhoto) &&
            (identical(other.foodDeliveryInsurancePhoto,
                    foodDeliveryInsurancePhoto) ||
                other.foodDeliveryInsurancePhoto ==
                    foodDeliveryInsurancePhoto) &&
            (identical(
                    other.evidenceOfResidencePhoto, evidenceOfResidencePhoto) ||
                other.evidenceOfResidencePhoto == evidenceOfResidencePhoto) &&
            (identical(other.passportPhoto, passportPhoto) ||
                other.passportPhoto == passportPhoto) &&
            (identical(other.nidPhoto, nidPhoto) ||
                other.nidPhoto == nidPhoto) &&
            (identical(other.contractPhoto, contractPhoto) ||
                other.contractPhoto == contractPhoto));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        entityStatus,
        code,
        branchId,
        guid,
        id,
        fullName,
        userName,
        bio,
        profileImage,
        mobile,
        email,
        address,
        about,
        rate,
        pickup,
        pickupOnly,
        signupType,
        registerDate,
        userStatus,
        country,
        updatedBy,
        eventPhoto0,
        eventPhoto1,
        eventPhoto2,
        eventPhoto3,
        eventPhoto4,
        accountApproved,
        isHygiene,
        hygienePhoto,
        riskPhoto,
        registerationPhoto,
        driverLicensePhoto,
        driverLicenseCodePhoto,
        foodDeliveryInsurancePhoto,
        evidenceOfResidencePhoto,
        passportPhoto,
        nidPhoto,
        contractPhoto
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProfileImplCopyWith<_$ProfileImpl> get copyWith =>
      __$$ProfileImplCopyWithImpl<_$ProfileImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProfileImplToJson(
      this,
    );
  }
}

abstract class _Profile extends Profile {
  const factory _Profile(
      {@JsonKey(includeToJson: false, includeFromJson: false)
      final EntityStatus entityStatus,
      final String code,
      final String branchId,
      final String guid,
      final int id,
      final String fullName,
      final String userName,
      final String bio,
      @JsonKey(name: 'image_Profile') final String? profileImage,
      final String mobile,
      final String email,
      final String address,
      final String about,
      final double rate,
      @JsonKey(name: 'pickup_Allowed') final bool pickup,
      @JsonKey(name: 'pickup_Only') final bool pickupOnly,
      final int signupType,
      final String registerDate,
      @JsonKey(name: 'status') final bool userStatus,
      @JsonKey(includeToJson: false) final Country country,
      final String updatedBy,
      @JsonKey(name: 'image_Profile_1') final String? eventPhoto0,
      @JsonKey(name: 'image_Profile_2') final String? eventPhoto1,
      @JsonKey(name: 'image_Profile_3') final String? eventPhoto2,
      @JsonKey(name: 'image_Profile_4') final String? eventPhoto3,
      @JsonKey(name: 'image_Profile_5') final String? eventPhoto4,
      @JsonKey(name: 'account_Approved') final bool accountApproved,
      @JsonKey(name: 'is_Hygiene') final bool isHygiene,
      @JsonKey(name: 'image_Hygiene_Cert') final String? hygienePhoto,
      @JsonKey(name: 'image_Risk_Assessment') final String? riskPhoto,
      @JsonKey(name: 'image_Authority_Reg') final String? registerationPhoto,
      @JsonKey(name: 'image_Driver_License') final String? driverLicensePhoto,
      @JsonKey(name: 'image_Driver_License_Code')
      final String? driverLicenseCodePhoto,
      @JsonKey(name: 'image_Food_Delivery_Insurance')
      final String? foodDeliveryInsurancePhoto,
      @JsonKey(name: 'image_Evidence_Of_Residence')
      final String? evidenceOfResidencePhoto,
      @JsonKey(name: 'image_Passport') final String? passportPhoto,
      @JsonKey(name: 'image_Id') final String? nidPhoto,
      @JsonKey(name: 'image_Contract')
      final String? contractPhoto}) = _$ProfileImpl;
  const _Profile._() : super._();

  factory _Profile.fromJson(Map<String, dynamic> json) = _$ProfileImpl.fromJson;

  @override
  @JsonKey(includeToJson: false, includeFromJson: false)
  EntityStatus get entityStatus;
  @override //
  String get code;
  @override
  String get branchId;
  @override
  String get guid;
  @override
  int get id;
  @override
  String get fullName;
  @override
  String get userName;
  @override
  String get bio;
  @override
  @JsonKey(name: 'image_Profile')
  String? get profileImage;
  @override //
  String get mobile;
  @override
  String get email;
  @override
  String get address;
  @override
  String get about;
  @override
  double get rate;
  @override
  @JsonKey(name: 'pickup_Allowed')
  bool get pickup;
  @override
  @JsonKey(name: 'pickup_Only')
  bool get pickupOnly;
  @override //
  int get signupType;
  @override
  String get registerDate;
  @override
  @JsonKey(name: 'status')
  bool get userStatus;
  @override
  @JsonKey(includeToJson: false)
  Country get country;
  @override
  String get updatedBy;
  @override // Event Photos
  @JsonKey(name: 'image_Profile_1')
  String? get eventPhoto0;
  @override
  @JsonKey(name: 'image_Profile_2')
  String? get eventPhoto1;
  @override
  @JsonKey(name: 'image_Profile_3')
  String? get eventPhoto2;
  @override
  @JsonKey(name: 'image_Profile_4')
  String? get eventPhoto3;
  @override
  @JsonKey(name: 'image_Profile_5')
  String? get eventPhoto4;
  @override //
  @JsonKey(name: 'account_Approved')
  bool get accountApproved;
  @override
  @JsonKey(name: 'is_Hygiene')
  bool get isHygiene;
  @override // Documents
// chef
  @JsonKey(name: 'image_Hygiene_Cert')
  String? get hygienePhoto;
  @override
  @JsonKey(name: 'image_Risk_Assessment')
  String? get riskPhoto;
  @override
  @JsonKey(name: 'image_Authority_Reg')
  String? get registerationPhoto;
  @override //driver
  @JsonKey(name: 'image_Driver_License')
  String? get driverLicensePhoto;
  @override
  @JsonKey(name: 'image_Driver_License_Code')
  String? get driverLicenseCodePhoto;
  @override
  @JsonKey(name: 'image_Food_Delivery_Insurance')
  String? get foodDeliveryInsurancePhoto;
  @override
  @JsonKey(name: 'image_Evidence_Of_Residence')
  String? get evidenceOfResidencePhoto;
  @override //common
  @JsonKey(name: 'image_Passport')
  String? get passportPhoto;
  @override
  @JsonKey(name: 'image_Id')
  String? get nidPhoto;
  @override //
  @JsonKey(name: 'image_Contract')
  String? get contractPhoto;
  @override
  @JsonKey(ignore: true)
  _$$ProfileImplCopyWith<_$ProfileImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
