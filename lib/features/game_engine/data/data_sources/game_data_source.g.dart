// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_data_source.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(gameDataSource)
final gameDataSourceProvider = GameDataSourceProvider._();

final class GameDataSourceProvider
    extends $FunctionalProvider<GameDataSource, GameDataSource, GameDataSource>
    with $Provider<GameDataSource> {
  GameDataSourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'gameDataSourceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$gameDataSourceHash();

  @$internal
  @override
  $ProviderElement<GameDataSource> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  GameDataSource create(Ref ref) {
    return gameDataSource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GameDataSource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GameDataSource>(value),
    );
  }
}

String _$gameDataSourceHash() => r'eb373e7e24a319e5f845daa7c0b916748c21560b';
