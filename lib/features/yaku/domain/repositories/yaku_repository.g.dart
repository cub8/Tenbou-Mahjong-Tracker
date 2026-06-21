// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'yaku_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(yakuRepository)
final yakuRepositoryProvider = YakuRepositoryProvider._();

final class YakuRepositoryProvider
    extends
        $FunctionalProvider<
          AsyncValue<YakuRepository>,
          YakuRepository,
          FutureOr<YakuRepository>
        >
    with $FutureModifier<YakuRepository>, $FutureProvider<YakuRepository> {
  YakuRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'yakuRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$yakuRepositoryHash();

  @$internal
  @override
  $FutureProviderElement<YakuRepository> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<YakuRepository> create(Ref ref) {
    return yakuRepository(ref);
  }
}

String _$yakuRepositoryHash() => r'714dc0f3acdca18862b8652fb98c635dcdc7f26e';
