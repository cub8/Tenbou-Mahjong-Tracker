// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'game.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Game {

 int? get id; String get eastPlayer;// equivalent of PlayerRole.a
 String get southPlayer;// equivalent of PlayerRole.b
 String get westPlayer;// equivalent of PlayerRole.c
 String get northPlayer;// equivalent of PlayerRole.d
 int get startingPoints; GameLength get gameLength; bool get endAtZeroPoints; DateTime get createdAt; bool get isFinished;
/// Create a copy of Game
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GameCopyWith<Game> get copyWith => _$GameCopyWithImpl<Game>(this as Game, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Game&&(identical(other.id, id) || other.id == id)&&(identical(other.eastPlayer, eastPlayer) || other.eastPlayer == eastPlayer)&&(identical(other.southPlayer, southPlayer) || other.southPlayer == southPlayer)&&(identical(other.westPlayer, westPlayer) || other.westPlayer == westPlayer)&&(identical(other.northPlayer, northPlayer) || other.northPlayer == northPlayer)&&(identical(other.startingPoints, startingPoints) || other.startingPoints == startingPoints)&&(identical(other.gameLength, gameLength) || other.gameLength == gameLength)&&(identical(other.endAtZeroPoints, endAtZeroPoints) || other.endAtZeroPoints == endAtZeroPoints)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.isFinished, isFinished) || other.isFinished == isFinished));
}


@override
int get hashCode => Object.hash(runtimeType,id,eastPlayer,southPlayer,westPlayer,northPlayer,startingPoints,gameLength,endAtZeroPoints,createdAt,isFinished);

@override
String toString() {
  return 'Game(id: $id, eastPlayer: $eastPlayer, southPlayer: $southPlayer, westPlayer: $westPlayer, northPlayer: $northPlayer, startingPoints: $startingPoints, gameLength: $gameLength, endAtZeroPoints: $endAtZeroPoints, createdAt: $createdAt, isFinished: $isFinished)';
}


}

/// @nodoc
abstract mixin class $GameCopyWith<$Res>  {
  factory $GameCopyWith(Game value, $Res Function(Game) _then) = _$GameCopyWithImpl;
@useResult
$Res call({
 int? id, String eastPlayer, String southPlayer, String westPlayer, String northPlayer, int startingPoints, GameLength gameLength, bool endAtZeroPoints, DateTime createdAt, bool isFinished
});




}
/// @nodoc
class _$GameCopyWithImpl<$Res>
    implements $GameCopyWith<$Res> {
  _$GameCopyWithImpl(this._self, this._then);

  final Game _self;
  final $Res Function(Game) _then;

/// Create a copy of Game
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? eastPlayer = null,Object? southPlayer = null,Object? westPlayer = null,Object? northPlayer = null,Object? startingPoints = null,Object? gameLength = null,Object? endAtZeroPoints = null,Object? createdAt = null,Object? isFinished = null,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,eastPlayer: null == eastPlayer ? _self.eastPlayer : eastPlayer // ignore: cast_nullable_to_non_nullable
as String,southPlayer: null == southPlayer ? _self.southPlayer : southPlayer // ignore: cast_nullable_to_non_nullable
as String,westPlayer: null == westPlayer ? _self.westPlayer : westPlayer // ignore: cast_nullable_to_non_nullable
as String,northPlayer: null == northPlayer ? _self.northPlayer : northPlayer // ignore: cast_nullable_to_non_nullable
as String,startingPoints: null == startingPoints ? _self.startingPoints : startingPoints // ignore: cast_nullable_to_non_nullable
as int,gameLength: null == gameLength ? _self.gameLength : gameLength // ignore: cast_nullable_to_non_nullable
as GameLength,endAtZeroPoints: null == endAtZeroPoints ? _self.endAtZeroPoints : endAtZeroPoints // ignore: cast_nullable_to_non_nullable
as bool,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,isFinished: null == isFinished ? _self.isFinished : isFinished // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [Game].
extension GamePatterns on Game {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Game value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Game() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Game value)  $default,){
final _that = this;
switch (_that) {
case _Game():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Game value)?  $default,){
final _that = this;
switch (_that) {
case _Game() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? id,  String eastPlayer,  String southPlayer,  String westPlayer,  String northPlayer,  int startingPoints,  GameLength gameLength,  bool endAtZeroPoints,  DateTime createdAt,  bool isFinished)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Game() when $default != null:
return $default(_that.id,_that.eastPlayer,_that.southPlayer,_that.westPlayer,_that.northPlayer,_that.startingPoints,_that.gameLength,_that.endAtZeroPoints,_that.createdAt,_that.isFinished);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? id,  String eastPlayer,  String southPlayer,  String westPlayer,  String northPlayer,  int startingPoints,  GameLength gameLength,  bool endAtZeroPoints,  DateTime createdAt,  bool isFinished)  $default,) {final _that = this;
switch (_that) {
case _Game():
return $default(_that.id,_that.eastPlayer,_that.southPlayer,_that.westPlayer,_that.northPlayer,_that.startingPoints,_that.gameLength,_that.endAtZeroPoints,_that.createdAt,_that.isFinished);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? id,  String eastPlayer,  String southPlayer,  String westPlayer,  String northPlayer,  int startingPoints,  GameLength gameLength,  bool endAtZeroPoints,  DateTime createdAt,  bool isFinished)?  $default,) {final _that = this;
switch (_that) {
case _Game() when $default != null:
return $default(_that.id,_that.eastPlayer,_that.southPlayer,_that.westPlayer,_that.northPlayer,_that.startingPoints,_that.gameLength,_that.endAtZeroPoints,_that.createdAt,_that.isFinished);case _:
  return null;

}
}

}

/// @nodoc


class _Game implements Game {
  const _Game({this.id, required this.eastPlayer, required this.southPlayer, required this.westPlayer, required this.northPlayer, required this.startingPoints, required this.gameLength, required this.endAtZeroPoints, required this.createdAt, this.isFinished = false});
  

@override final  int? id;
@override final  String eastPlayer;
// equivalent of PlayerRole.a
@override final  String southPlayer;
// equivalent of PlayerRole.b
@override final  String westPlayer;
// equivalent of PlayerRole.c
@override final  String northPlayer;
// equivalent of PlayerRole.d
@override final  int startingPoints;
@override final  GameLength gameLength;
@override final  bool endAtZeroPoints;
@override final  DateTime createdAt;
@override@JsonKey() final  bool isFinished;

/// Create a copy of Game
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GameCopyWith<_Game> get copyWith => __$GameCopyWithImpl<_Game>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Game&&(identical(other.id, id) || other.id == id)&&(identical(other.eastPlayer, eastPlayer) || other.eastPlayer == eastPlayer)&&(identical(other.southPlayer, southPlayer) || other.southPlayer == southPlayer)&&(identical(other.westPlayer, westPlayer) || other.westPlayer == westPlayer)&&(identical(other.northPlayer, northPlayer) || other.northPlayer == northPlayer)&&(identical(other.startingPoints, startingPoints) || other.startingPoints == startingPoints)&&(identical(other.gameLength, gameLength) || other.gameLength == gameLength)&&(identical(other.endAtZeroPoints, endAtZeroPoints) || other.endAtZeroPoints == endAtZeroPoints)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.isFinished, isFinished) || other.isFinished == isFinished));
}


@override
int get hashCode => Object.hash(runtimeType,id,eastPlayer,southPlayer,westPlayer,northPlayer,startingPoints,gameLength,endAtZeroPoints,createdAt,isFinished);

@override
String toString() {
  return 'Game(id: $id, eastPlayer: $eastPlayer, southPlayer: $southPlayer, westPlayer: $westPlayer, northPlayer: $northPlayer, startingPoints: $startingPoints, gameLength: $gameLength, endAtZeroPoints: $endAtZeroPoints, createdAt: $createdAt, isFinished: $isFinished)';
}


}

/// @nodoc
abstract mixin class _$GameCopyWith<$Res> implements $GameCopyWith<$Res> {
  factory _$GameCopyWith(_Game value, $Res Function(_Game) _then) = __$GameCopyWithImpl;
@override @useResult
$Res call({
 int? id, String eastPlayer, String southPlayer, String westPlayer, String northPlayer, int startingPoints, GameLength gameLength, bool endAtZeroPoints, DateTime createdAt, bool isFinished
});




}
/// @nodoc
class __$GameCopyWithImpl<$Res>
    implements _$GameCopyWith<$Res> {
  __$GameCopyWithImpl(this._self, this._then);

  final _Game _self;
  final $Res Function(_Game) _then;

/// Create a copy of Game
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? eastPlayer = null,Object? southPlayer = null,Object? westPlayer = null,Object? northPlayer = null,Object? startingPoints = null,Object? gameLength = null,Object? endAtZeroPoints = null,Object? createdAt = null,Object? isFinished = null,}) {
  return _then(_Game(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,eastPlayer: null == eastPlayer ? _self.eastPlayer : eastPlayer // ignore: cast_nullable_to_non_nullable
as String,southPlayer: null == southPlayer ? _self.southPlayer : southPlayer // ignore: cast_nullable_to_non_nullable
as String,westPlayer: null == westPlayer ? _self.westPlayer : westPlayer // ignore: cast_nullable_to_non_nullable
as String,northPlayer: null == northPlayer ? _self.northPlayer : northPlayer // ignore: cast_nullable_to_non_nullable
as String,startingPoints: null == startingPoints ? _self.startingPoints : startingPoints // ignore: cast_nullable_to_non_nullable
as int,gameLength: null == gameLength ? _self.gameLength : gameLength // ignore: cast_nullable_to_non_nullable
as GameLength,endAtZeroPoints: null == endAtZeroPoints ? _self.endAtZeroPoints : endAtZeroPoints // ignore: cast_nullable_to_non_nullable
as bool,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,isFinished: null == isFinished ? _self.isFinished : isFinished // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
