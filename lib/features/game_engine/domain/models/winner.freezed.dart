// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'winner.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Winner {

 PlayerRole get player; WinningHand get hand;
/// Create a copy of Winner
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WinnerCopyWith<Winner> get copyWith => _$WinnerCopyWithImpl<Winner>(this as Winner, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Winner&&(identical(other.player, player) || other.player == player)&&(identical(other.hand, hand) || other.hand == hand));
}


@override
int get hashCode => Object.hash(runtimeType,player,hand);

@override
String toString() {
  return 'Winner(player: $player, hand: $hand)';
}


}

/// @nodoc
abstract mixin class $WinnerCopyWith<$Res>  {
  factory $WinnerCopyWith(Winner value, $Res Function(Winner) _then) = _$WinnerCopyWithImpl;
@useResult
$Res call({
 PlayerRole player, WinningHand hand
});


$WinningHandCopyWith<$Res> get hand;

}
/// @nodoc
class _$WinnerCopyWithImpl<$Res>
    implements $WinnerCopyWith<$Res> {
  _$WinnerCopyWithImpl(this._self, this._then);

  final Winner _self;
  final $Res Function(Winner) _then;

/// Create a copy of Winner
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? player = null,Object? hand = null,}) {
  return _then(_self.copyWith(
player: null == player ? _self.player : player // ignore: cast_nullable_to_non_nullable
as PlayerRole,hand: null == hand ? _self.hand : hand // ignore: cast_nullable_to_non_nullable
as WinningHand,
  ));
}
/// Create a copy of Winner
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$WinningHandCopyWith<$Res> get hand {
  
  return $WinningHandCopyWith<$Res>(_self.hand, (value) {
    return _then(_self.copyWith(hand: value));
  });
}
}


/// Adds pattern-matching-related methods to [Winner].
extension WinnerPatterns on Winner {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Winner value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Winner() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Winner value)  $default,){
final _that = this;
switch (_that) {
case _Winner():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Winner value)?  $default,){
final _that = this;
switch (_that) {
case _Winner() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( PlayerRole player,  WinningHand hand)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Winner() when $default != null:
return $default(_that.player,_that.hand);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( PlayerRole player,  WinningHand hand)  $default,) {final _that = this;
switch (_that) {
case _Winner():
return $default(_that.player,_that.hand);case _:
  throw StateError('Unexpected subclass');

}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( PlayerRole player,  WinningHand hand)?  $default,) {final _that = this;
switch (_that) {
case _Winner() when $default != null:
return $default(_that.player,_that.hand);case _:
  return null;

}
}

}

/// @nodoc


class _Winner implements Winner {
  const _Winner({required this.player, required this.hand});
  

@override final  PlayerRole player;
@override final  WinningHand hand;

/// Create a copy of Winner
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WinnerCopyWith<_Winner> get copyWith => __$WinnerCopyWithImpl<_Winner>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Winner&&(identical(other.player, player) || other.player == player)&&(identical(other.hand, hand) || other.hand == hand));
}


@override
int get hashCode => Object.hash(runtimeType,player,hand);

@override
String toString() {
  return 'Winner(player: $player, hand: $hand)';
}


}

/// @nodoc
abstract mixin class _$WinnerCopyWith<$Res> implements $WinnerCopyWith<$Res> {
  factory _$WinnerCopyWith(_Winner value, $Res Function(_Winner) _then) = __$WinnerCopyWithImpl;
@override @useResult
$Res call({
 PlayerRole player, WinningHand hand
});


@override $WinningHandCopyWith<$Res> get hand;

}
/// @nodoc
class __$WinnerCopyWithImpl<$Res>
    implements _$WinnerCopyWith<$Res> {
  __$WinnerCopyWithImpl(this._self, this._then);

  final _Winner _self;
  final $Res Function(_Winner) _then;

/// Create a copy of Winner
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? player = null,Object? hand = null,}) {
  return _then(_Winner(
player: null == player ? _self.player : player // ignore: cast_nullable_to_non_nullable
as PlayerRole,hand: null == hand ? _self.hand : hand // ignore: cast_nullable_to_non_nullable
as WinningHand,
  ));
}

/// Create a copy of Winner
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$WinningHandCopyWith<$Res> get hand {
  
  return $WinningHandCopyWith<$Res>(_self.hand, (value) {
    return _then(_self.copyWith(hand: value));
  });
}
}

// dart format on
