// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'yaku_record.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$YakuRecord {

 String get id; String get originalJapaneseName; String get romanizedJapaneseName; String get englishName; String get description; YakuScoring get scoring; List<String> get conditions; List<MahjongTileSet> get indexTiles; List<List<MahjongTileSet>> get variants;
/// Create a copy of YakuRecord
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$YakuRecordCopyWith<YakuRecord> get copyWith => _$YakuRecordCopyWithImpl<YakuRecord>(this as YakuRecord, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is YakuRecord&&(identical(other.id, id) || other.id == id)&&(identical(other.originalJapaneseName, originalJapaneseName) || other.originalJapaneseName == originalJapaneseName)&&(identical(other.romanizedJapaneseName, romanizedJapaneseName) || other.romanizedJapaneseName == romanizedJapaneseName)&&(identical(other.englishName, englishName) || other.englishName == englishName)&&(identical(other.description, description) || other.description == description)&&(identical(other.scoring, scoring) || other.scoring == scoring)&&const DeepCollectionEquality().equals(other.conditions, conditions)&&const DeepCollectionEquality().equals(other.indexTiles, indexTiles)&&const DeepCollectionEquality().equals(other.variants, variants));
}


@override
int get hashCode => Object.hash(runtimeType,id,originalJapaneseName,romanizedJapaneseName,englishName,description,scoring,const DeepCollectionEquality().hash(conditions),const DeepCollectionEquality().hash(indexTiles),const DeepCollectionEquality().hash(variants));

@override
String toString() {
  return 'YakuRecord(id: $id, originalJapaneseName: $originalJapaneseName, romanizedJapaneseName: $romanizedJapaneseName, englishName: $englishName, description: $description, scoring: $scoring, conditions: $conditions, indexTiles: $indexTiles, variants: $variants)';
}


}

/// @nodoc
abstract mixin class $YakuRecordCopyWith<$Res>  {
  factory $YakuRecordCopyWith(YakuRecord value, $Res Function(YakuRecord) _then) = _$YakuRecordCopyWithImpl;
@useResult
$Res call({
 String id, String originalJapaneseName, String romanizedJapaneseName, String englishName, String description, YakuScoring scoring, List<String> conditions, List<MahjongTileSet> indexTiles, List<List<MahjongTileSet>> variants
});


$YakuScoringCopyWith<$Res> get scoring;

}
/// @nodoc
class _$YakuRecordCopyWithImpl<$Res>
    implements $YakuRecordCopyWith<$Res> {
  _$YakuRecordCopyWithImpl(this._self, this._then);

  final YakuRecord _self;
  final $Res Function(YakuRecord) _then;

/// Create a copy of YakuRecord
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? originalJapaneseName = null,Object? romanizedJapaneseName = null,Object? englishName = null,Object? description = null,Object? scoring = null,Object? conditions = null,Object? indexTiles = null,Object? variants = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,originalJapaneseName: null == originalJapaneseName ? _self.originalJapaneseName : originalJapaneseName // ignore: cast_nullable_to_non_nullable
as String,romanizedJapaneseName: null == romanizedJapaneseName ? _self.romanizedJapaneseName : romanizedJapaneseName // ignore: cast_nullable_to_non_nullable
as String,englishName: null == englishName ? _self.englishName : englishName // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,scoring: null == scoring ? _self.scoring : scoring // ignore: cast_nullable_to_non_nullable
as YakuScoring,conditions: null == conditions ? _self.conditions : conditions // ignore: cast_nullable_to_non_nullable
as List<String>,indexTiles: null == indexTiles ? _self.indexTiles : indexTiles // ignore: cast_nullable_to_non_nullable
as List<MahjongTileSet>,variants: null == variants ? _self.variants : variants // ignore: cast_nullable_to_non_nullable
as List<List<MahjongTileSet>>,
  ));
}
/// Create a copy of YakuRecord
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$YakuScoringCopyWith<$Res> get scoring {
  
  return $YakuScoringCopyWith<$Res>(_self.scoring, (value) {
    return _then(_self.copyWith(scoring: value));
  });
}
}


/// Adds pattern-matching-related methods to [YakuRecord].
extension YakuRecordPatterns on YakuRecord {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _YakuRecord value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _YakuRecord() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _YakuRecord value)  $default,){
final _that = this;
switch (_that) {
case _YakuRecord():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _YakuRecord value)?  $default,){
final _that = this;
switch (_that) {
case _YakuRecord() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String originalJapaneseName,  String romanizedJapaneseName,  String englishName,  String description,  YakuScoring scoring,  List<String> conditions,  List<MahjongTileSet> indexTiles,  List<List<MahjongTileSet>> variants)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _YakuRecord() when $default != null:
return $default(_that.id,_that.originalJapaneseName,_that.romanizedJapaneseName,_that.englishName,_that.description,_that.scoring,_that.conditions,_that.indexTiles,_that.variants);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String originalJapaneseName,  String romanizedJapaneseName,  String englishName,  String description,  YakuScoring scoring,  List<String> conditions,  List<MahjongTileSet> indexTiles,  List<List<MahjongTileSet>> variants)  $default,) {final _that = this;
switch (_that) {
case _YakuRecord():
return $default(_that.id,_that.originalJapaneseName,_that.romanizedJapaneseName,_that.englishName,_that.description,_that.scoring,_that.conditions,_that.indexTiles,_that.variants);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String originalJapaneseName,  String romanizedJapaneseName,  String englishName,  String description,  YakuScoring scoring,  List<String> conditions,  List<MahjongTileSet> indexTiles,  List<List<MahjongTileSet>> variants)?  $default,) {final _that = this;
switch (_that) {
case _YakuRecord() when $default != null:
return $default(_that.id,_that.originalJapaneseName,_that.romanizedJapaneseName,_that.englishName,_that.description,_that.scoring,_that.conditions,_that.indexTiles,_that.variants);case _:
  return null;

}
}

}

/// @nodoc


class _YakuRecord implements YakuRecord {
  const _YakuRecord({required this.id, required this.originalJapaneseName, required this.romanizedJapaneseName, required this.englishName, required this.description, required this.scoring, required final  List<String> conditions, required final  List<MahjongTileSet> indexTiles, required final  List<List<MahjongTileSet>> variants}): _conditions = conditions,_indexTiles = indexTiles,_variants = variants;
  

@override final  String id;
@override final  String originalJapaneseName;
@override final  String romanizedJapaneseName;
@override final  String englishName;
@override final  String description;
@override final  YakuScoring scoring;
 final  List<String> _conditions;
@override List<String> get conditions {
  if (_conditions is EqualUnmodifiableListView) return _conditions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_conditions);
}

 final  List<MahjongTileSet> _indexTiles;
@override List<MahjongTileSet> get indexTiles {
  if (_indexTiles is EqualUnmodifiableListView) return _indexTiles;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_indexTiles);
}

 final  List<List<MahjongTileSet>> _variants;
@override List<List<MahjongTileSet>> get variants {
  if (_variants is EqualUnmodifiableListView) return _variants;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_variants);
}


/// Create a copy of YakuRecord
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$YakuRecordCopyWith<_YakuRecord> get copyWith => __$YakuRecordCopyWithImpl<_YakuRecord>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _YakuRecord&&(identical(other.id, id) || other.id == id)&&(identical(other.originalJapaneseName, originalJapaneseName) || other.originalJapaneseName == originalJapaneseName)&&(identical(other.romanizedJapaneseName, romanizedJapaneseName) || other.romanizedJapaneseName == romanizedJapaneseName)&&(identical(other.englishName, englishName) || other.englishName == englishName)&&(identical(other.description, description) || other.description == description)&&(identical(other.scoring, scoring) || other.scoring == scoring)&&const DeepCollectionEquality().equals(other._conditions, _conditions)&&const DeepCollectionEquality().equals(other._indexTiles, _indexTiles)&&const DeepCollectionEquality().equals(other._variants, _variants));
}


@override
int get hashCode => Object.hash(runtimeType,id,originalJapaneseName,romanizedJapaneseName,englishName,description,scoring,const DeepCollectionEquality().hash(_conditions),const DeepCollectionEquality().hash(_indexTiles),const DeepCollectionEquality().hash(_variants));

@override
String toString() {
  return 'YakuRecord(id: $id, originalJapaneseName: $originalJapaneseName, romanizedJapaneseName: $romanizedJapaneseName, englishName: $englishName, description: $description, scoring: $scoring, conditions: $conditions, indexTiles: $indexTiles, variants: $variants)';
}


}

/// @nodoc
abstract mixin class _$YakuRecordCopyWith<$Res> implements $YakuRecordCopyWith<$Res> {
  factory _$YakuRecordCopyWith(_YakuRecord value, $Res Function(_YakuRecord) _then) = __$YakuRecordCopyWithImpl;
@override @useResult
$Res call({
 String id, String originalJapaneseName, String romanizedJapaneseName, String englishName, String description, YakuScoring scoring, List<String> conditions, List<MahjongTileSet> indexTiles, List<List<MahjongTileSet>> variants
});


@override $YakuScoringCopyWith<$Res> get scoring;

}
/// @nodoc
class __$YakuRecordCopyWithImpl<$Res>
    implements _$YakuRecordCopyWith<$Res> {
  __$YakuRecordCopyWithImpl(this._self, this._then);

  final _YakuRecord _self;
  final $Res Function(_YakuRecord) _then;

/// Create a copy of YakuRecord
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? originalJapaneseName = null,Object? romanizedJapaneseName = null,Object? englishName = null,Object? description = null,Object? scoring = null,Object? conditions = null,Object? indexTiles = null,Object? variants = null,}) {
  return _then(_YakuRecord(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,originalJapaneseName: null == originalJapaneseName ? _self.originalJapaneseName : originalJapaneseName // ignore: cast_nullable_to_non_nullable
as String,romanizedJapaneseName: null == romanizedJapaneseName ? _self.romanizedJapaneseName : romanizedJapaneseName // ignore: cast_nullable_to_non_nullable
as String,englishName: null == englishName ? _self.englishName : englishName // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,scoring: null == scoring ? _self.scoring : scoring // ignore: cast_nullable_to_non_nullable
as YakuScoring,conditions: null == conditions ? _self._conditions : conditions // ignore: cast_nullable_to_non_nullable
as List<String>,indexTiles: null == indexTiles ? _self._indexTiles : indexTiles // ignore: cast_nullable_to_non_nullable
as List<MahjongTileSet>,variants: null == variants ? _self._variants : variants // ignore: cast_nullable_to_non_nullable
as List<List<MahjongTileSet>>,
  ));
}

/// Create a copy of YakuRecord
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$YakuScoringCopyWith<$Res> get scoring {
  
  return $YakuScoringCopyWith<$Res>(_self.scoring, (value) {
    return _then(_self.copyWith(scoring: value));
  });
}
}

// dart format on
