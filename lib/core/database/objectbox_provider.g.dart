// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'objectbox_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(objectBox)
final objectBoxProvider = ObjectBoxProvider._();

final class ObjectBoxProvider
    extends $FunctionalProvider<ObjectBox, ObjectBox, ObjectBox>
    with $Provider<ObjectBox> {
  ObjectBoxProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'objectBoxProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$objectBoxHash();

  @$internal
  @override
  $ProviderElement<ObjectBox> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  ObjectBox create(Ref ref) {
    return objectBox(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ObjectBox value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ObjectBox>(value),
    );
  }
}

String _$objectBoxHash() => r'a2e1050d44935d84b4bee74e30cb26971a192f79';
