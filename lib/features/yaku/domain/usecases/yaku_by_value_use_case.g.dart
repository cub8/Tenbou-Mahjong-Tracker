// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'yaku_by_value_use_case.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(yakuByValueUseCase)
final yakuByValueUseCaseProvider = YakuByValueUseCaseProvider._();

final class YakuByValueUseCaseProvider
    extends
        $FunctionalProvider<
          AsyncValue<YakuByValueUseCase>,
          YakuByValueUseCase,
          FutureOr<YakuByValueUseCase>
        >
    with
        $FutureModifier<YakuByValueUseCase>,
        $FutureProvider<YakuByValueUseCase> {
  YakuByValueUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'yakuByValueUseCaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$yakuByValueUseCaseHash();

  @$internal
  @override
  $FutureProviderElement<YakuByValueUseCase> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<YakuByValueUseCase> create(Ref ref) {
    return yakuByValueUseCase(ref);
  }
}

String _$yakuByValueUseCaseHash() =>
    r'45c3971d8c0ef670968fadeb4c3b92f70e0aad7a';
