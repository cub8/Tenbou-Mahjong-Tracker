// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'game_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$GameState {

 List<PlayerState> get players;// always 4, in role order A, B, C, D
 Wind get roundWind; int get round; int get honba; int get riichiSticks;
/// Create a copy of GameState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GameStateCopyWith<GameState> get copyWith => _$GameStateCopyWithImpl<GameState>(this as GameState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GameState&&const DeepCollectionEquality().equals(other.players, players)&&(identical(other.roundWind, roundWind) || other.roundWind == roundWind)&&(identical(other.round, round) || other.round == round)&&(identical(other.honba, honba) || other.honba == honba)&&(identical(other.riichiSticks, riichiSticks) || other.riichiSticks == riichiSticks));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(players),roundWind,round,honba,riichiSticks);

@override
String toString() {
  return 'GameState(players: $players, roundWind: $roundWind, round: $round, honba: $honba, riichiSticks: $riichiSticks)';
}


}

/// @nodoc
abstract mixin class $GameStateCopyWith<$Res>  {
  factory $GameStateCopyWith(GameState value, $Res Function(GameState) _then) = _$GameStateCopyWithImpl;
@useResult
$Res call({
 List<PlayerState> players, Wind roundWind, int round, int honba, int riichiSticks
});




}
/// @nodoc
class _$GameStateCopyWithImpl<$Res>
    implements $GameStateCopyWith<$Res> {
  _$GameStateCopyWithImpl(this._self, this._then);

  final GameState _self;
  final $Res Function(GameState) _then;

/// Create a copy of GameState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? players = null,Object? roundWind = null,Object? round = null,Object? honba = null,Object? riichiSticks = null,}) {
  return _then(_self.copyWith(
players: null == players ? _self.players : players // ignore: cast_nullable_to_non_nullable
as List<PlayerState>,roundWind: null == roundWind ? _self.roundWind : roundWind // ignore: cast_nullable_to_non_nullable
as Wind,round: null == round ? _self.round : round // ignore: cast_nullable_to_non_nullable
as int,honba: null == honba ? _self.honba : honba // ignore: cast_nullable_to_non_nullable
as int,riichiSticks: null == riichiSticks ? _self.riichiSticks : riichiSticks // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [GameState].
extension GameStatePatterns on GameState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GameState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GameState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GameState value)  $default,){
final _that = this;
switch (_that) {
case _GameState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GameState value)?  $default,){
final _that = this;
switch (_that) {
case _GameState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<PlayerState> players,  Wind roundWind,  int round,  int honba,  int riichiSticks)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GameState() when $default != null:
return $default(_that.players,_that.roundWind,_that.round,_that.honba,_that.riichiSticks);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<PlayerState> players,  Wind roundWind,  int round,  int honba,  int riichiSticks)  $default,) {final _that = this;
switch (_that) {
case _GameState():
return $default(_that.players,_that.roundWind,_that.round,_that.honba,_that.riichiSticks);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<PlayerState> players,  Wind roundWind,  int round,  int honba,  int riichiSticks)?  $default,) {final _that = this;
switch (_that) {
case _GameState() when $default != null:
return $default(_that.players,_that.roundWind,_that.round,_that.honba,_that.riichiSticks);case _:
  return null;

}
}

}

/// @nodoc


class _GameState extends GameState {
  const _GameState({required final  List<PlayerState> players, required this.roundWind, required this.round, required this.honba, required this.riichiSticks}): _players = players,super._();
  

 final  List<PlayerState> _players;
@override List<PlayerState> get players {
  if (_players is EqualUnmodifiableListView) return _players;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_players);
}

// always 4, in role order A, B, C, D
@override final  Wind roundWind;
@override final  int round;
@override final  int honba;
@override final  int riichiSticks;

/// Create a copy of GameState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GameStateCopyWith<_GameState> get copyWith => __$GameStateCopyWithImpl<_GameState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GameState&&const DeepCollectionEquality().equals(other._players, _players)&&(identical(other.roundWind, roundWind) || other.roundWind == roundWind)&&(identical(other.round, round) || other.round == round)&&(identical(other.honba, honba) || other.honba == honba)&&(identical(other.riichiSticks, riichiSticks) || other.riichiSticks == riichiSticks));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_players),roundWind,round,honba,riichiSticks);

@override
String toString() {
  return 'GameState(players: $players, roundWind: $roundWind, round: $round, honba: $honba, riichiSticks: $riichiSticks)';
}


}

/// @nodoc
abstract mixin class _$GameStateCopyWith<$Res> implements $GameStateCopyWith<$Res> {
  factory _$GameStateCopyWith(_GameState value, $Res Function(_GameState) _then) = __$GameStateCopyWithImpl;
@override @useResult
$Res call({
 List<PlayerState> players, Wind roundWind, int round, int honba, int riichiSticks
});




}
/// @nodoc
class __$GameStateCopyWithImpl<$Res>
    implements _$GameStateCopyWith<$Res> {
  __$GameStateCopyWithImpl(this._self, this._then);

  final _GameState _self;
  final $Res Function(_GameState) _then;

/// Create a copy of GameState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? players = null,Object? roundWind = null,Object? round = null,Object? honba = null,Object? riichiSticks = null,}) {
  return _then(_GameState(
players: null == players ? _self._players : players // ignore: cast_nullable_to_non_nullable
as List<PlayerState>,roundWind: null == roundWind ? _self.roundWind : roundWind // ignore: cast_nullable_to_non_nullable
as Wind,round: null == round ? _self.round : round // ignore: cast_nullable_to_non_nullable
as int,honba: null == honba ? _self.honba : honba // ignore: cast_nullable_to_non_nullable
as int,riichiSticks: null == riichiSticks ? _self.riichiSticks : riichiSticks // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
