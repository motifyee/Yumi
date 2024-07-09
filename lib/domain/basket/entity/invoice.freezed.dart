// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'invoice.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Invoice _$InvoiceFromJson(Map<String, dynamic> json) {
  return _Invoice.fromJson(json);
}

/// @nodoc
mixin _$Invoice {
  int? get createdBy => throw _privateConstructorUsedError;
  String? get createdDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'chef_ID')
  String? get chefID => throw _privateConstructorUsedError;
  String get clientNote => throw _privateConstructorUsedError;
  String get preparationNotes => throw _privateConstructorUsedError;
  String get employeeNote => throw _privateConstructorUsedError;
  double get deliveryCostPrice => throw _privateConstructorUsedError;
  double get deliveryAreaPrice => throw _privateConstructorUsedError;
  double get invoiceDiscount => throw _privateConstructorUsedError;
  double get invoiceTax => throw _privateConstructorUsedError;
  double get finalPrice => throw _privateConstructorUsedError;
  double get totalPrice => throw _privateConstructorUsedError;
  @JsonKey(name: 'schedule_Date')
  @DateTimeToIso8601StringConverter()
  DateTime? get scheduleDate => throw _privateConstructorUsedError;
  String? get invoiceCode => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $InvoiceCopyWith<Invoice> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InvoiceCopyWith<$Res> {
  factory $InvoiceCopyWith(Invoice value, $Res Function(Invoice) then) =
      _$InvoiceCopyWithImpl<$Res, Invoice>;
  @useResult
  $Res call(
      {int? createdBy,
      String? createdDate,
      @JsonKey(name: 'chef_ID') String? chefID,
      String clientNote,
      String preparationNotes,
      String employeeNote,
      double deliveryCostPrice,
      double deliveryAreaPrice,
      double invoiceDiscount,
      double invoiceTax,
      double finalPrice,
      double totalPrice,
      @JsonKey(name: 'schedule_Date')
      @DateTimeToIso8601StringConverter()
      DateTime? scheduleDate,
      String? invoiceCode});
}

/// @nodoc
class _$InvoiceCopyWithImpl<$Res, $Val extends Invoice>
    implements $InvoiceCopyWith<$Res> {
  _$InvoiceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createdBy = freezed,
    Object? createdDate = freezed,
    Object? chefID = freezed,
    Object? clientNote = null,
    Object? preparationNotes = null,
    Object? employeeNote = null,
    Object? deliveryCostPrice = null,
    Object? deliveryAreaPrice = null,
    Object? invoiceDiscount = null,
    Object? invoiceTax = null,
    Object? finalPrice = null,
    Object? totalPrice = null,
    Object? scheduleDate = freezed,
    Object? invoiceCode = freezed,
  }) {
    return _then(_value.copyWith(
      createdBy: freezed == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as int?,
      createdDate: freezed == createdDate
          ? _value.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as String?,
      chefID: freezed == chefID
          ? _value.chefID
          : chefID // ignore: cast_nullable_to_non_nullable
              as String?,
      clientNote: null == clientNote
          ? _value.clientNote
          : clientNote // ignore: cast_nullable_to_non_nullable
              as String,
      preparationNotes: null == preparationNotes
          ? _value.preparationNotes
          : preparationNotes // ignore: cast_nullable_to_non_nullable
              as String,
      employeeNote: null == employeeNote
          ? _value.employeeNote
          : employeeNote // ignore: cast_nullable_to_non_nullable
              as String,
      deliveryCostPrice: null == deliveryCostPrice
          ? _value.deliveryCostPrice
          : deliveryCostPrice // ignore: cast_nullable_to_non_nullable
              as double,
      deliveryAreaPrice: null == deliveryAreaPrice
          ? _value.deliveryAreaPrice
          : deliveryAreaPrice // ignore: cast_nullable_to_non_nullable
              as double,
      invoiceDiscount: null == invoiceDiscount
          ? _value.invoiceDiscount
          : invoiceDiscount // ignore: cast_nullable_to_non_nullable
              as double,
      invoiceTax: null == invoiceTax
          ? _value.invoiceTax
          : invoiceTax // ignore: cast_nullable_to_non_nullable
              as double,
      finalPrice: null == finalPrice
          ? _value.finalPrice
          : finalPrice // ignore: cast_nullable_to_non_nullable
              as double,
      totalPrice: null == totalPrice
          ? _value.totalPrice
          : totalPrice // ignore: cast_nullable_to_non_nullable
              as double,
      scheduleDate: freezed == scheduleDate
          ? _value.scheduleDate
          : scheduleDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      invoiceCode: freezed == invoiceCode
          ? _value.invoiceCode
          : invoiceCode // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InvoiceImplCopyWith<$Res> implements $InvoiceCopyWith<$Res> {
  factory _$$InvoiceImplCopyWith(
          _$InvoiceImpl value, $Res Function(_$InvoiceImpl) then) =
      __$$InvoiceImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? createdBy,
      String? createdDate,
      @JsonKey(name: 'chef_ID') String? chefID,
      String clientNote,
      String preparationNotes,
      String employeeNote,
      double deliveryCostPrice,
      double deliveryAreaPrice,
      double invoiceDiscount,
      double invoiceTax,
      double finalPrice,
      double totalPrice,
      @JsonKey(name: 'schedule_Date')
      @DateTimeToIso8601StringConverter()
      DateTime? scheduleDate,
      String? invoiceCode});
}

/// @nodoc
class __$$InvoiceImplCopyWithImpl<$Res>
    extends _$InvoiceCopyWithImpl<$Res, _$InvoiceImpl>
    implements _$$InvoiceImplCopyWith<$Res> {
  __$$InvoiceImplCopyWithImpl(
      _$InvoiceImpl _value, $Res Function(_$InvoiceImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createdBy = freezed,
    Object? createdDate = freezed,
    Object? chefID = freezed,
    Object? clientNote = null,
    Object? preparationNotes = null,
    Object? employeeNote = null,
    Object? deliveryCostPrice = null,
    Object? deliveryAreaPrice = null,
    Object? invoiceDiscount = null,
    Object? invoiceTax = null,
    Object? finalPrice = null,
    Object? totalPrice = null,
    Object? scheduleDate = freezed,
    Object? invoiceCode = freezed,
  }) {
    return _then(_$InvoiceImpl(
      createdBy: freezed == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as int?,
      createdDate: freezed == createdDate
          ? _value.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as String?,
      chefID: freezed == chefID
          ? _value.chefID
          : chefID // ignore: cast_nullable_to_non_nullable
              as String?,
      clientNote: null == clientNote
          ? _value.clientNote
          : clientNote // ignore: cast_nullable_to_non_nullable
              as String,
      preparationNotes: null == preparationNotes
          ? _value.preparationNotes
          : preparationNotes // ignore: cast_nullable_to_non_nullable
              as String,
      employeeNote: null == employeeNote
          ? _value.employeeNote
          : employeeNote // ignore: cast_nullable_to_non_nullable
              as String,
      deliveryCostPrice: null == deliveryCostPrice
          ? _value.deliveryCostPrice
          : deliveryCostPrice // ignore: cast_nullable_to_non_nullable
              as double,
      deliveryAreaPrice: null == deliveryAreaPrice
          ? _value.deliveryAreaPrice
          : deliveryAreaPrice // ignore: cast_nullable_to_non_nullable
              as double,
      invoiceDiscount: null == invoiceDiscount
          ? _value.invoiceDiscount
          : invoiceDiscount // ignore: cast_nullable_to_non_nullable
              as double,
      invoiceTax: null == invoiceTax
          ? _value.invoiceTax
          : invoiceTax // ignore: cast_nullable_to_non_nullable
              as double,
      finalPrice: null == finalPrice
          ? _value.finalPrice
          : finalPrice // ignore: cast_nullable_to_non_nullable
              as double,
      totalPrice: null == totalPrice
          ? _value.totalPrice
          : totalPrice // ignore: cast_nullable_to_non_nullable
              as double,
      scheduleDate: freezed == scheduleDate
          ? _value.scheduleDate
          : scheduleDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      invoiceCode: freezed == invoiceCode
          ? _value.invoiceCode
          : invoiceCode // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(anyMap: true)
class _$InvoiceImpl extends _Invoice {
  const _$InvoiceImpl(
      {this.createdBy,
      this.createdDate,
      @JsonKey(name: 'chef_ID') this.chefID,
      this.clientNote = '',
      this.preparationNotes = '',
      this.employeeNote = '',
      this.deliveryCostPrice = 4.5,
      this.deliveryAreaPrice = 4.5,
      this.invoiceDiscount = 0.0,
      this.invoiceTax = 0.0,
      this.finalPrice = 0.0,
      this.totalPrice = 0.0,
      @JsonKey(name: 'schedule_Date')
      @DateTimeToIso8601StringConverter()
      this.scheduleDate,
      this.invoiceCode})
      : super._();

  factory _$InvoiceImpl.fromJson(Map<String, dynamic> json) =>
      _$$InvoiceImplFromJson(json);

  @override
  final int? createdBy;
  @override
  final String? createdDate;
  @override
  @JsonKey(name: 'chef_ID')
  final String? chefID;
  @override
  @JsonKey()
  final String clientNote;
  @override
  @JsonKey()
  final String preparationNotes;
  @override
  @JsonKey()
  final String employeeNote;
  @override
  @JsonKey()
  final double deliveryCostPrice;
  @override
  @JsonKey()
  final double deliveryAreaPrice;
  @override
  @JsonKey()
  final double invoiceDiscount;
  @override
  @JsonKey()
  final double invoiceTax;
  @override
  @JsonKey()
  final double finalPrice;
  @override
  @JsonKey()
  final double totalPrice;
  @override
  @JsonKey(name: 'schedule_Date')
  @DateTimeToIso8601StringConverter()
  final DateTime? scheduleDate;
  @override
  final String? invoiceCode;

  @override
  String toString() {
    return 'Invoice(createdBy: $createdBy, createdDate: $createdDate, chefID: $chefID, clientNote: $clientNote, preparationNotes: $preparationNotes, employeeNote: $employeeNote, deliveryCostPrice: $deliveryCostPrice, deliveryAreaPrice: $deliveryAreaPrice, invoiceDiscount: $invoiceDiscount, invoiceTax: $invoiceTax, finalPrice: $finalPrice, totalPrice: $totalPrice, scheduleDate: $scheduleDate, invoiceCode: $invoiceCode)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InvoiceImpl &&
            (identical(other.createdBy, createdBy) ||
                other.createdBy == createdBy) &&
            (identical(other.createdDate, createdDate) ||
                other.createdDate == createdDate) &&
            (identical(other.chefID, chefID) || other.chefID == chefID) &&
            (identical(other.clientNote, clientNote) ||
                other.clientNote == clientNote) &&
            (identical(other.preparationNotes, preparationNotes) ||
                other.preparationNotes == preparationNotes) &&
            (identical(other.employeeNote, employeeNote) ||
                other.employeeNote == employeeNote) &&
            (identical(other.deliveryCostPrice, deliveryCostPrice) ||
                other.deliveryCostPrice == deliveryCostPrice) &&
            (identical(other.deliveryAreaPrice, deliveryAreaPrice) ||
                other.deliveryAreaPrice == deliveryAreaPrice) &&
            (identical(other.invoiceDiscount, invoiceDiscount) ||
                other.invoiceDiscount == invoiceDiscount) &&
            (identical(other.invoiceTax, invoiceTax) ||
                other.invoiceTax == invoiceTax) &&
            (identical(other.finalPrice, finalPrice) ||
                other.finalPrice == finalPrice) &&
            (identical(other.totalPrice, totalPrice) ||
                other.totalPrice == totalPrice) &&
            (identical(other.scheduleDate, scheduleDate) ||
                other.scheduleDate == scheduleDate) &&
            (identical(other.invoiceCode, invoiceCode) ||
                other.invoiceCode == invoiceCode));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      createdBy,
      createdDate,
      chefID,
      clientNote,
      preparationNotes,
      employeeNote,
      deliveryCostPrice,
      deliveryAreaPrice,
      invoiceDiscount,
      invoiceTax,
      finalPrice,
      totalPrice,
      scheduleDate,
      invoiceCode);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InvoiceImplCopyWith<_$InvoiceImpl> get copyWith =>
      __$$InvoiceImplCopyWithImpl<_$InvoiceImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$InvoiceImplToJson(
      this,
    );
  }
}

abstract class _Invoice extends Invoice {
  const factory _Invoice(
      {final int? createdBy,
      final String? createdDate,
      @JsonKey(name: 'chef_ID') final String? chefID,
      final String clientNote,
      final String preparationNotes,
      final String employeeNote,
      final double deliveryCostPrice,
      final double deliveryAreaPrice,
      final double invoiceDiscount,
      final double invoiceTax,
      final double finalPrice,
      final double totalPrice,
      @JsonKey(name: 'schedule_Date')
      @DateTimeToIso8601StringConverter()
      final DateTime? scheduleDate,
      final String? invoiceCode}) = _$InvoiceImpl;
  const _Invoice._() : super._();

  factory _Invoice.fromJson(Map<String, dynamic> json) = _$InvoiceImpl.fromJson;

  @override
  int? get createdBy;
  @override
  String? get createdDate;
  @override
  @JsonKey(name: 'chef_ID')
  String? get chefID;
  @override
  String get clientNote;
  @override
  String get preparationNotes;
  @override
  String get employeeNote;
  @override
  double get deliveryCostPrice;
  @override
  double get deliveryAreaPrice;
  @override
  double get invoiceDiscount;
  @override
  double get invoiceTax;
  @override
  double get finalPrice;
  @override
  double get totalPrice;
  @override
  @JsonKey(name: 'schedule_Date')
  @DateTimeToIso8601StringConverter()
  DateTime? get scheduleDate;
  @override
  String? get invoiceCode;
  @override
  @JsonKey(ignore: true)
  _$$InvoiceImplCopyWith<_$InvoiceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
