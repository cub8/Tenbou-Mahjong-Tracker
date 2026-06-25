// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'winning_hand.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$WinningHand {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WinningHand);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'WinningHand()';
}


}

/// @nodoc
class $WinningHandCopyWith<$Res>  {
$WinningHandCopyWith(WinningHand _, $Res Function(WinningHand) __);
}


/// Adds pattern-matching-related methods to [WinningHand].
extension WinningHandPatterns on WinningHand {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( WinningHandStandard value)?  standard,TResult Function( WinningHandYakuman value)?  yakuman,required TResult orElse(),}){
final _that = this;
switch (_that) {
case WinningHandStandard() when standard != null:
return standard(_that);case WinningHandYakuman() when yakuman != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( WinningHandStandard value)  standard,required TResult Function( WinningHandYakuman value)  yakuman,}){
final _that = this;
switch (_that) {
case WinningHandStandard():
return standard(_that);case WinningHandYakuman():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( WinningHandStandard value)?  standard,TResult? Function( WinningHandYakuman value)?  yakuman,}){
final _that = this;
switch (_that) {
case WinningHandStandard() when standard != null:
return standard(_that);case WinningHandYakuman() when yakuman != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( int han,  int fu)?  standard,TResult Function( int multiplier)?  yakuman,required TResult orElse(),}) {final _that = this;
switch (_that) {
case WinningHandStandard() when standard != null:
return standard(_that.han,_that.fu);case WinningHandYakuman() when yakuman != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( int han,  int fu)  standard,required TResult Function( int multiplier)  yakuman,}) {final _that = this;
switch (_that) {
case WinningHandStandard():
return standard(_that.han,_that.fu);case WinningHandYakuman():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( int han,  int fu)?  standard,TResult? Function( int multiplier)?  yakuman,}) {final _that = this;
switch (_that) {
case WinningHandStandard() when standard != null:
return standard(_that.han,_that.fu);case WinningHandYakuman() when yakuman != null:
return yakuman(_that.multiplier);case _:
  return null;

}
}

}

/// @nodoc


class WinningHandStandard implements WinningHand {
  const WinningHandStandard({required this.han, required this.fu});
  

 final  int han;
 final  int fu;

/// Create a copy of WinningHand
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WinningHandStandardCopyWith<WinningHandStandard> get copyWith => _$WinningHandStandardCopyWithImpl<WinningHandStandard>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WinningHandStandard&&(identical(other.han, han) || other.han == han)&&(identical(other.fu, fu) || other.fu == fu));
}


@override
int get hashCode => Object.hash(runtimeType,han,fu);

@override
String toString() {
  return 'WinningHand.standard(han: $han, fu: $fu)';
}


}

/// @nodoc
abstract mixin class $WinningHandStandardCopyWith<$Res> implements $WinningHandCopyWith<$Res> {
  factory $WinningHandStandardCopyWith(WinningHandStandard value, $Res Function(WinningHandStandard) _then) = _$WinningHandStandardCopyWithImpl;
@useResult
$Res call({
 int han, int fu
});




}
/// @nodoc
class _$WinningHandStandardCopyWithImpl<$Res>
    implements $WinningHandStandardCopyWith<$Res> {
  _$WinningHandStandardCopyWithImpl(this._self, this._then);

  final WinningHandStandard _self;
  final $Res Function(WinningHandStandard) _then;

/// Create a copy of WinningHand
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? han = null,Object? fu = null,}) {
  return _then(WinningHandStandard(
han: null == han ? _self.han : han // ignore: cast_nullable_to_non_nullable
as int,fu: null == fu ? _self.fu : fu // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class WinningHandYakuman implements WinningHand {
  const WinningHandYakuman({required this.multiplier});
  

 final  int multiplier;

/// Create a copy of WinningHand
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WinningHandYakumanCopyWith<WinningHandYakuman> get copyWith => _$WinningHandYakumanCopyWithImpl<WinningHandYakuman>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WinningHandYakuman&&(identical(other.multiplier, multiplier) || other.multiplier == multiplier));
}


@override
int get hashCode => Object.hash(runtimeType,multiplier);

@override
String toString() {
  return 'WinningHand.yakuman(multiplier: $multiplier)';
}


}

/// @nodoc
abstract mixin class $WinningHandYakumanCopyWith<$Res> implements $WinningHandCopyWith<$Res> {
  factory $WinningHandYakumanCopyWith(WinningHandYakuman value, $Res Function(WinningHandYakuman) _then) = _$WinningHandYakumanCopyWithImpl;
@useResult
$Res call({
 int multiplier
});




}
/// @nodoc
class _$WinningHandYakumanCopyWithImpl<$Res>
    implements $WinningHandYakumanCopyWith<$Res> {
  _$WinningHandYakumanCopyWithImpl(this._self, this._then);

  final WinningHandYakuman _self;
  final $Res Function(WinningHandYakuman) _then;

/// Create a copy of WinningHand
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? multiplier = null,}) {
  return _then(WinningHandYakuman(
multiplier: null == multiplier ? _self.multiplier : multiplier // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
