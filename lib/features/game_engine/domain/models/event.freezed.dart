// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Event {

 int? get id; int get gameId; int get index; Wind get wind; int get round; int get honba; EndType get endType; List<Winner> get winners; PlayerRole? get loser; List<PlayerRole> get tenpai; List<PlayerRole> get riichiDeclarers; List<PlayerRole> get chonbo;
/// Create a copy of Event
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EventCopyWith<Event> get copyWith => _$EventCopyWithImpl<Event>(this as Event, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Event&&(identical(other.id, id) || other.id == id)&&(identical(other.gameId, gameId) || other.gameId == gameId)&&(identical(other.index, index) || other.index == index)&&(identical(other.wind, wind) || other.wind == wind)&&(identical(other.round, round) || other.round == round)&&(identical(other.honba, honba) || other.honba == honba)&&(identical(other.endType, endType) || other.endType == endType)&&const DeepCollectionEquality().equals(other.winners, winners)&&(identical(other.loser, loser) || other.loser == loser)&&const DeepCollectionEquality().equals(other.tenpai, tenpai)&&const DeepCollectionEquality().equals(other.riichiDeclarers, riichiDeclarers)&&const DeepCollectionEquality().equals(other.chonbo, chonbo));
}


@override
int get hashCode => Object.hash(runtimeType,id,gameId,index,wind,round,honba,endType,const DeepCollectionEquality().hash(winners),loser,const DeepCollectionEquality().hash(tenpai),const DeepCollectionEquality().hash(riichiDeclarers),const DeepCollectionEquality().hash(chonbo));

@override
String toString() {
  return 'Event(id: $id, gameId: $gameId, index: $index, wind: $wind, round: $round, honba: $honba, endType: $endType, winners: $winners, loser: $loser, tenpai: $tenpai, riichiDeclarers: $riichiDeclarers, chonbo: $chonbo)';
}


}

/// @nodoc
abstract mixin class $EventCopyWith<$Res>  {
  factory $EventCopyWith(Event value, $Res Function(Event) _then) = _$EventCopyWithImpl;
@useResult
$Res call({
 int? id, int gameId, int index, Wind wind, int round, int honba, EndType endType, List<Winner> winners, PlayerRole? loser, List<PlayerRole> tenpai, List<PlayerRole> riichiDeclarers, List<PlayerRole> chonbo
});




}
/// @nodoc
class _$EventCopyWithImpl<$Res>
    implements $EventCopyWith<$Res> {
  _$EventCopyWithImpl(this._self, this._then);

  final Event _self;
  final $Res Function(Event) _then;

/// Create a copy of Event
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? gameId = null,Object? index = null,Object? wind = null,Object? round = null,Object? honba = null,Object? endType = null,Object? winners = null,Object? loser = freezed,Object? tenpai = null,Object? riichiDeclarers = null,Object? chonbo = null,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,gameId: null == gameId ? _self.gameId : gameId // ignore: cast_nullable_to_non_nullable
as int,index: null == index ? _self.index : index // ignore: cast_nullable_to_non_nullable
as int,wind: null == wind ? _self.wind : wind // ignore: cast_nullable_to_non_nullable
as Wind,round: null == round ? _self.round : round // ignore: cast_nullable_to_non_nullable
as int,honba: null == honba ? _self.honba : honba // ignore: cast_nullable_to_non_nullable
as int,endType: null == endType ? _self.endType : endType // ignore: cast_nullable_to_non_nullable
as EndType,winners: null == winners ? _self.winners : winners // ignore: cast_nullable_to_non_nullable
as List<Winner>,loser: freezed == loser ? _self.loser : loser // ignore: cast_nullable_to_non_nullable
as PlayerRole?,tenpai: null == tenpai ? _self.tenpai : tenpai // ignore: cast_nullable_to_non_nullable
as List<PlayerRole>,riichiDeclarers: null == riichiDeclarers ? _self.riichiDeclarers : riichiDeclarers // ignore: cast_nullable_to_non_nullable
as List<PlayerRole>,chonbo: null == chonbo ? _self.chonbo : chonbo // ignore: cast_nullable_to_non_nullable
as List<PlayerRole>,
  ));
}

}


/// Adds pattern-matching-related methods to [Event].
extension EventPatterns on Event {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Event value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Event() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Event value)  $default,){
final _that = this;
switch (_that) {
case _Event():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Event value)?  $default,){
final _that = this;
switch (_that) {
case _Event() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? id,  int gameId,  int index,  Wind wind,  int round,  int honba,  EndType endType,  List<Winner> winners,  PlayerRole? loser,  List<PlayerRole> tenpai,  List<PlayerRole> riichiDeclarers,  List<PlayerRole> chonbo)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Event() when $default != null:
return $default(_that.id,_that.gameId,_that.index,_that.wind,_that.round,_that.honba,_that.endType,_that.winners,_that.loser,_that.tenpai,_that.riichiDeclarers,_that.chonbo);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? id,  int gameId,  int index,  Wind wind,  int round,  int honba,  EndType endType,  List<Winner> winners,  PlayerRole? loser,  List<PlayerRole> tenpai,  List<PlayerRole> riichiDeclarers,  List<PlayerRole> chonbo)  $default,) {final _that = this;
switch (_that) {
case _Event():
return $default(_that.id,_that.gameId,_that.index,_that.wind,_that.round,_that.honba,_that.endType,_that.winners,_that.loser,_that.tenpai,_that.riichiDeclarers,_that.chonbo);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? id,  int gameId,  int index,  Wind wind,  int round,  int honba,  EndType endType,  List<Winner> winners,  PlayerRole? loser,  List<PlayerRole> tenpai,  List<PlayerRole> riichiDeclarers,  List<PlayerRole> chonbo)?  $default,) {final _that = this;
switch (_that) {
case _Event() when $default != null:
return $default(_that.id,_that.gameId,_that.index,_that.wind,_that.round,_that.honba,_that.endType,_that.winners,_that.loser,_that.tenpai,_that.riichiDeclarers,_that.chonbo);case _:
  return null;

}
}

}

/// @nodoc


class _Event implements Event {
  const _Event({this.id, required this.gameId, required this.index, required this.wind, required this.round, required this.honba, required this.endType, final  List<Winner> winners = const [], this.loser, final  List<PlayerRole> tenpai = const [], final  List<PlayerRole> riichiDeclarers = const [], final  List<PlayerRole> chonbo = const []}): _winners = winners,_tenpai = tenpai,_riichiDeclarers = riichiDeclarers,_chonbo = chonbo;
  

@override final  int? id;
@override final  int gameId;
@override final  int index;
@override final  Wind wind;
@override final  int round;
@override final  int honba;
@override final  EndType endType;
 final  List<Winner> _winners;
@override@JsonKey() List<Winner> get winners {
  if (_winners is EqualUnmodifiableListView) return _winners;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_winners);
}

@override final  PlayerRole? loser;
 final  List<PlayerRole> _tenpai;
@override@JsonKey() List<PlayerRole> get tenpai {
  if (_tenpai is EqualUnmodifiableListView) return _tenpai;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_tenpai);
}

 final  List<PlayerRole> _riichiDeclarers;
@override@JsonKey() List<PlayerRole> get riichiDeclarers {
  if (_riichiDeclarers is EqualUnmodifiableListView) return _riichiDeclarers;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_riichiDeclarers);
}

 final  List<PlayerRole> _chonbo;
@override@JsonKey() List<PlayerRole> get chonbo {
  if (_chonbo is EqualUnmodifiableListView) return _chonbo;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_chonbo);
}


/// Create a copy of Event
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EventCopyWith<_Event> get copyWith => __$EventCopyWithImpl<_Event>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Event&&(identical(other.id, id) || other.id == id)&&(identical(other.gameId, gameId) || other.gameId == gameId)&&(identical(other.index, index) || other.index == index)&&(identical(other.wind, wind) || other.wind == wind)&&(identical(other.round, round) || other.round == round)&&(identical(other.honba, honba) || other.honba == honba)&&(identical(other.endType, endType) || other.endType == endType)&&const DeepCollectionEquality().equals(other._winners, _winners)&&(identical(other.loser, loser) || other.loser == loser)&&const DeepCollectionEquality().equals(other._tenpai, _tenpai)&&const DeepCollectionEquality().equals(other._riichiDeclarers, _riichiDeclarers)&&const DeepCollectionEquality().equals(other._chonbo, _chonbo));
}


@override
int get hashCode => Object.hash(runtimeType,id,gameId,index,wind,round,honba,endType,const DeepCollectionEquality().hash(_winners),loser,const DeepCollectionEquality().hash(_tenpai),const DeepCollectionEquality().hash(_riichiDeclarers),const DeepCollectionEquality().hash(_chonbo));

@override
String toString() {
  return 'Event(id: $id, gameId: $gameId, index: $index, wind: $wind, round: $round, honba: $honba, endType: $endType, winners: $winners, loser: $loser, tenpai: $tenpai, riichiDeclarers: $riichiDeclarers, chonbo: $chonbo)';
}


}

/// @nodoc
abstract mixin class _$EventCopyWith<$Res> implements $EventCopyWith<$Res> {
  factory _$EventCopyWith(_Event value, $Res Function(_Event) _then) = __$EventCopyWithImpl;
@override @useResult
$Res call({
 int? id, int gameId, int index, Wind wind, int round, int honba, EndType endType, List<Winner> winners, PlayerRole? loser, List<PlayerRole> tenpai, List<PlayerRole> riichiDeclarers, List<PlayerRole> chonbo
});




}
/// @nodoc
class __$EventCopyWithImpl<$Res>
    implements _$EventCopyWith<$Res> {
  __$EventCopyWithImpl(this._self, this._then);

  final _Event _self;
  final $Res Function(_Event) _then;

/// Create a copy of Event
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? gameId = null,Object? index = null,Object? wind = null,Object? round = null,Object? honba = null,Object? endType = null,Object? winners = null,Object? loser = freezed,Object? tenpai = null,Object? riichiDeclarers = null,Object? chonbo = null,}) {
  return _then(_Event(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,gameId: null == gameId ? _self.gameId : gameId // ignore: cast_nullable_to_non_nullable
as int,index: null == index ? _self.index : index // ignore: cast_nullable_to_non_nullable
as int,wind: null == wind ? _self.wind : wind // ignore: cast_nullable_to_non_nullable
as Wind,round: null == round ? _self.round : round // ignore: cast_nullable_to_non_nullable
as int,honba: null == honba ? _self.honba : honba // ignore: cast_nullable_to_non_nullable
as int,endType: null == endType ? _self.endType : endType // ignore: cast_nullable_to_non_nullable
as EndType,winners: null == winners ? _self._winners : winners // ignore: cast_nullable_to_non_nullable
as List<Winner>,loser: freezed == loser ? _self.loser : loser // ignore: cast_nullable_to_non_nullable
as PlayerRole?,tenpai: null == tenpai ? _self._tenpai : tenpai // ignore: cast_nullable_to_non_nullable
as List<PlayerRole>,riichiDeclarers: null == riichiDeclarers ? _self._riichiDeclarers : riichiDeclarers // ignore: cast_nullable_to_non_nullable
as List<PlayerRole>,chonbo: null == chonbo ? _self._chonbo : chonbo // ignore: cast_nullable_to_non_nullable
as List<PlayerRole>,
  ));
}


}

// dart format on
