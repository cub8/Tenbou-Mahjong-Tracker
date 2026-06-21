// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'yaku_scoring.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$YakuScoring {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is YakuScoring);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'YakuScoring()';
}


}

/// @nodoc
class $YakuScoringCopyWith<$Res>  {
$YakuScoringCopyWith(YakuScoring _, $Res Function(YakuScoring) __);
}


/// Adds pattern-matching-related methods to [YakuScoring].
extension YakuScoringPatterns on YakuScoring {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( YakuScoringStandard value)?  standard,TResult Function( YakuScoringYakuman value)?  yakuman,required TResult orElse(),}){
final _that = this;
switch (_that) {
case YakuScoringStandard() when standard != null:
return standard(_that);case YakuScoringYakuman() when yakuman != null:
return yakuman(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( YakuScoringStandard value)  standard,required TResult Function( YakuScoringYakuman value)  yakuman,}){
final _that = this;
switch (_that) {
case YakuScoringStandard():
return standard(_that);case YakuScoringYakuman():
return yakuman(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( YakuScoringStandard value)?  standard,TResult? Function( YakuScoringYakuman value)?  yakuman,}){
final _that = this;
switch (_that) {
case YakuScoringStandard() when standard != null:
return standard(_that);case YakuScoringYakuman() when yakuman != null:
return yakuman(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( int han)?  standard,TResult Function( int multiplier)?  yakuman,required TResult orElse(),}) {final _that = this;
switch (_that) {
case YakuScoringStandard() when standard != null:
return standard(_that.han);case YakuScoringYakuman() when yakuman != null:
return yakuman(_that.multiplier);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( int han)  standard,required TResult Function( int multiplier)  yakuman,}) {final _that = this;
switch (_that) {
case YakuScoringStandard():
return standard(_that.han);case YakuScoringYakuman():
return yakuman(_that.multiplier);}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( int han)?  standard,TResult? Function( int multiplier)?  yakuman,}) {final _that = this;
switch (_that) {
case YakuScoringStandard() when standard != null:
return standard(_that.han);case YakuScoringYakuman() when yakuman != null:
return yakuman(_that.multiplier);case _:
  return null;

}
}

}

/// @nodoc


class YakuScoringStandard implements YakuScoring {
  const YakuScoringStandard(this.han);
  

 final  int han;

/// Create a copy of YakuScoring
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$YakuScoringStandardCopyWith<YakuScoringStandard> get copyWith => _$YakuScoringStandardCopyWithImpl<YakuScoringStandard>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is YakuScoringStandard&&(identical(other.han, han) || other.han == han));
}


@override
int get hashCode => Object.hash(runtimeType,han);

@override
String toString() {
  return 'YakuScoring.standard(han: $han)';
}


}

/// @nodoc
abstract mixin class $YakuScoringStandardCopyWith<$Res> implements $YakuScoringCopyWith<$Res> {
  factory $YakuScoringStandardCopyWith(YakuScoringStandard value, $Res Function(YakuScoringStandard) _then) = _$YakuScoringStandardCopyWithImpl;
@useResult
$Res call({
 int han
});




}
/// @nodoc
class _$YakuScoringStandardCopyWithImpl<$Res>
    implements $YakuScoringStandardCopyWith<$Res> {
  _$YakuScoringStandardCopyWithImpl(this._self, this._then);

  final YakuScoringStandard _self;
  final $Res Function(YakuScoringStandard) _then;

/// Create a copy of YakuScoring
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? han = null,}) {
  return _then(YakuScoringStandard(
null == han ? _self.han : han // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class YakuScoringYakuman implements YakuScoring {
  const YakuScoringYakuman(this.multiplier);
  

 final  int multiplier;

/// Create a copy of YakuScoring
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$YakuScoringYakumanCopyWith<YakuScoringYakuman> get copyWith => _$YakuScoringYakumanCopyWithImpl<YakuScoringYakuman>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is YakuScoringYakuman&&(identical(other.multiplier, multiplier) || other.multiplier == multiplier));
}


@override
int get hashCode => Object.hash(runtimeType,multiplier);

@override
String toString() {
  return 'YakuScoring.yakuman(multiplier: $multiplier)';
}


}

/// @nodoc
abstract mixin class $YakuScoringYakumanCopyWith<$Res> implements $YakuScoringCopyWith<$Res> {
  factory $YakuScoringYakumanCopyWith(YakuScoringYakuman value, $Res Function(YakuScoringYakuman) _then) = _$YakuScoringYakumanCopyWithImpl;
@useResult
$Res call({
 int multiplier
});




}
/// @nodoc
class _$YakuScoringYakumanCopyWithImpl<$Res>
    implements $YakuScoringYakumanCopyWith<$Res> {
  _$YakuScoringYakumanCopyWithImpl(this._self, this._then);

  final YakuScoringYakuman _self;
  final $Res Function(YakuScoringYakuman) _then;

/// Create a copy of YakuScoring
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? multiplier = null,}) {
  return _then(YakuScoringYakuman(
null == multiplier ? _self.multiplier : multiplier // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
