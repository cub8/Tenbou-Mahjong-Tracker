// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'round_history_entry.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$RoundHistoryEntry {

 Wind get roundWind; int get round; int get honba; EndType get endType; Map<PlayerRole, int> get handDeltas; Map<PlayerRole, int> get sideDeltas; Map<PlayerRole, int> get totals; List<PlayerRole> get chonbo;
/// Create a copy of RoundHistoryEntry
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RoundHistoryEntryCopyWith<RoundHistoryEntry> get copyWith => _$RoundHistoryEntryCopyWithImpl<RoundHistoryEntry>(this as RoundHistoryEntry, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RoundHistoryEntry&&(identical(other.roundWind, roundWind) || other.roundWind == roundWind)&&(identical(other.round, round) || other.round == round)&&(identical(other.honba, honba) || other.honba == honba)&&(identical(other.endType, endType) || other.endType == endType)&&const DeepCollectionEquality().equals(other.handDeltas, handDeltas)&&const DeepCollectionEquality().equals(other.sideDeltas, sideDeltas)&&const DeepCollectionEquality().equals(other.totals, totals)&&const DeepCollectionEquality().equals(other.chonbo, chonbo));
}


@override
int get hashCode => Object.hash(runtimeType,roundWind,round,honba,endType,const DeepCollectionEquality().hash(handDeltas),const DeepCollectionEquality().hash(sideDeltas),const DeepCollectionEquality().hash(totals),const DeepCollectionEquality().hash(chonbo));

@override
String toString() {
  return 'RoundHistoryEntry(roundWind: $roundWind, round: $round, honba: $honba, endType: $endType, handDeltas: $handDeltas, sideDeltas: $sideDeltas, totals: $totals, chonbo: $chonbo)';
}


}

/// @nodoc
abstract mixin class $RoundHistoryEntryCopyWith<$Res>  {
  factory $RoundHistoryEntryCopyWith(RoundHistoryEntry value, $Res Function(RoundHistoryEntry) _then) = _$RoundHistoryEntryCopyWithImpl;
@useResult
$Res call({
 Wind roundWind, int round, int honba, EndType endType, Map<PlayerRole, int> handDeltas, Map<PlayerRole, int> sideDeltas, Map<PlayerRole, int> totals, List<PlayerRole> chonbo
});




}
/// @nodoc
class _$RoundHistoryEntryCopyWithImpl<$Res>
    implements $RoundHistoryEntryCopyWith<$Res> {
  _$RoundHistoryEntryCopyWithImpl(this._self, this._then);

  final RoundHistoryEntry _self;
  final $Res Function(RoundHistoryEntry) _then;

/// Create a copy of RoundHistoryEntry
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? roundWind = null,Object? round = null,Object? honba = null,Object? endType = null,Object? handDeltas = null,Object? sideDeltas = null,Object? totals = null,Object? chonbo = null,}) {
  return _then(_self.copyWith(
roundWind: null == roundWind ? _self.roundWind : roundWind // ignore: cast_nullable_to_non_nullable
as Wind,round: null == round ? _self.round : round // ignore: cast_nullable_to_non_nullable
as int,honba: null == honba ? _self.honba : honba // ignore: cast_nullable_to_non_nullable
as int,endType: null == endType ? _self.endType : endType // ignore: cast_nullable_to_non_nullable
as EndType,handDeltas: null == handDeltas ? _self.handDeltas : handDeltas // ignore: cast_nullable_to_non_nullable
as Map<PlayerRole, int>,sideDeltas: null == sideDeltas ? _self.sideDeltas : sideDeltas // ignore: cast_nullable_to_non_nullable
as Map<PlayerRole, int>,totals: null == totals ? _self.totals : totals // ignore: cast_nullable_to_non_nullable
as Map<PlayerRole, int>,chonbo: null == chonbo ? _self.chonbo : chonbo // ignore: cast_nullable_to_non_nullable
as List<PlayerRole>,
  ));
}

}


/// Adds pattern-matching-related methods to [RoundHistoryEntry].
extension RoundHistoryEntryPatterns on RoundHistoryEntry {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RoundHistoryEntry value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RoundHistoryEntry() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RoundHistoryEntry value)  $default,){
final _that = this;
switch (_that) {
case _RoundHistoryEntry():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RoundHistoryEntry value)?  $default,){
final _that = this;
switch (_that) {
case _RoundHistoryEntry() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Wind roundWind,  int round,  int honba,  EndType endType,  Map<PlayerRole, int> handDeltas,  Map<PlayerRole, int> sideDeltas,  Map<PlayerRole, int> totals,  List<PlayerRole> chonbo)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RoundHistoryEntry() when $default != null:
return $default(_that.roundWind,_that.round,_that.honba,_that.endType,_that.handDeltas,_that.sideDeltas,_that.totals,_that.chonbo);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Wind roundWind,  int round,  int honba,  EndType endType,  Map<PlayerRole, int> handDeltas,  Map<PlayerRole, int> sideDeltas,  Map<PlayerRole, int> totals,  List<PlayerRole> chonbo)  $default,) {final _that = this;
switch (_that) {
case _RoundHistoryEntry():
return $default(_that.roundWind,_that.round,_that.honba,_that.endType,_that.handDeltas,_that.sideDeltas,_that.totals,_that.chonbo);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Wind roundWind,  int round,  int honba,  EndType endType,  Map<PlayerRole, int> handDeltas,  Map<PlayerRole, int> sideDeltas,  Map<PlayerRole, int> totals,  List<PlayerRole> chonbo)?  $default,) {final _that = this;
switch (_that) {
case _RoundHistoryEntry() when $default != null:
return $default(_that.roundWind,_that.round,_that.honba,_that.endType,_that.handDeltas,_that.sideDeltas,_that.totals,_that.chonbo);case _:
  return null;

}
}

}

/// @nodoc


class _RoundHistoryEntry implements RoundHistoryEntry {
  const _RoundHistoryEntry({required this.roundWind, required this.round, required this.honba, required this.endType, required final  Map<PlayerRole, int> handDeltas, required final  Map<PlayerRole, int> sideDeltas, required final  Map<PlayerRole, int> totals, final  List<PlayerRole> chonbo = const []}): _handDeltas = handDeltas,_sideDeltas = sideDeltas,_totals = totals,_chonbo = chonbo;
  

@override final  Wind roundWind;
@override final  int round;
@override final  int honba;
@override final  EndType endType;
 final  Map<PlayerRole, int> _handDeltas;
@override Map<PlayerRole, int> get handDeltas {
  if (_handDeltas is EqualUnmodifiableMapView) return _handDeltas;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_handDeltas);
}

 final  Map<PlayerRole, int> _sideDeltas;
@override Map<PlayerRole, int> get sideDeltas {
  if (_sideDeltas is EqualUnmodifiableMapView) return _sideDeltas;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_sideDeltas);
}

 final  Map<PlayerRole, int> _totals;
@override Map<PlayerRole, int> get totals {
  if (_totals is EqualUnmodifiableMapView) return _totals;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_totals);
}

 final  List<PlayerRole> _chonbo;
@override@JsonKey() List<PlayerRole> get chonbo {
  if (_chonbo is EqualUnmodifiableListView) return _chonbo;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_chonbo);
}


/// Create a copy of RoundHistoryEntry
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RoundHistoryEntryCopyWith<_RoundHistoryEntry> get copyWith => __$RoundHistoryEntryCopyWithImpl<_RoundHistoryEntry>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RoundHistoryEntry&&(identical(other.roundWind, roundWind) || other.roundWind == roundWind)&&(identical(other.round, round) || other.round == round)&&(identical(other.honba, honba) || other.honba == honba)&&(identical(other.endType, endType) || other.endType == endType)&&const DeepCollectionEquality().equals(other._handDeltas, _handDeltas)&&const DeepCollectionEquality().equals(other._sideDeltas, _sideDeltas)&&const DeepCollectionEquality().equals(other._totals, _totals)&&const DeepCollectionEquality().equals(other._chonbo, _chonbo));
}


@override
int get hashCode => Object.hash(runtimeType,roundWind,round,honba,endType,const DeepCollectionEquality().hash(_handDeltas),const DeepCollectionEquality().hash(_sideDeltas),const DeepCollectionEquality().hash(_totals),const DeepCollectionEquality().hash(_chonbo));

@override
String toString() {
  return 'RoundHistoryEntry(roundWind: $roundWind, round: $round, honba: $honba, endType: $endType, handDeltas: $handDeltas, sideDeltas: $sideDeltas, totals: $totals, chonbo: $chonbo)';
}


}

/// @nodoc
abstract mixin class _$RoundHistoryEntryCopyWith<$Res> implements $RoundHistoryEntryCopyWith<$Res> {
  factory _$RoundHistoryEntryCopyWith(_RoundHistoryEntry value, $Res Function(_RoundHistoryEntry) _then) = __$RoundHistoryEntryCopyWithImpl;
@override @useResult
$Res call({
 Wind roundWind, int round, int honba, EndType endType, Map<PlayerRole, int> handDeltas, Map<PlayerRole, int> sideDeltas, Map<PlayerRole, int> totals, List<PlayerRole> chonbo
});




}
/// @nodoc
class __$RoundHistoryEntryCopyWithImpl<$Res>
    implements _$RoundHistoryEntryCopyWith<$Res> {
  __$RoundHistoryEntryCopyWithImpl(this._self, this._then);

  final _RoundHistoryEntry _self;
  final $Res Function(_RoundHistoryEntry) _then;

/// Create a copy of RoundHistoryEntry
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? roundWind = null,Object? round = null,Object? honba = null,Object? endType = null,Object? handDeltas = null,Object? sideDeltas = null,Object? totals = null,Object? chonbo = null,}) {
  return _then(_RoundHistoryEntry(
roundWind: null == roundWind ? _self.roundWind : roundWind // ignore: cast_nullable_to_non_nullable
as Wind,round: null == round ? _self.round : round // ignore: cast_nullable_to_non_nullable
as int,honba: null == honba ? _self.honba : honba // ignore: cast_nullable_to_non_nullable
as int,endType: null == endType ? _self.endType : endType // ignore: cast_nullable_to_non_nullable
as EndType,handDeltas: null == handDeltas ? _self._handDeltas : handDeltas // ignore: cast_nullable_to_non_nullable
as Map<PlayerRole, int>,sideDeltas: null == sideDeltas ? _self._sideDeltas : sideDeltas // ignore: cast_nullable_to_non_nullable
as Map<PlayerRole, int>,totals: null == totals ? _self._totals : totals // ignore: cast_nullable_to_non_nullable
as Map<PlayerRole, int>,chonbo: null == chonbo ? _self._chonbo : chonbo // ignore: cast_nullable_to_non_nullable
as List<PlayerRole>,
  ));
}


}

// dart format on
