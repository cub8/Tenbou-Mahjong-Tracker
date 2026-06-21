// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'yaku_data_source.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(yakuDataSource)
final yakuDataSourceProvider = YakuDataSourceProvider._();

final class YakuDataSourceProvider
    extends
        $FunctionalProvider<
          AsyncValue<YakuDataSource>,
          YakuDataSource,
          FutureOr<YakuDataSource>
        >
    with $FutureModifier<YakuDataSource>, $FutureProvider<YakuDataSource> {
  YakuDataSourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'yakuDataSourceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$yakuDataSourceHash();

  @$internal
  @override
  $FutureProviderElement<YakuDataSource> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<YakuDataSource> create(Ref ref) {
    return yakuDataSource(ref);
  }
}

String _$yakuDataSourceHash() => r'4ec1b872b4d2bb294d00917ba87fd12d83727481';
