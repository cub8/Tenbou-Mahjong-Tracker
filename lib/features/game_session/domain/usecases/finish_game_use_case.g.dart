// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'finish_game_use_case.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(finishGameUseCase)
final finishGameUseCaseProvider = FinishGameUseCaseProvider._();

final class FinishGameUseCaseProvider
    extends
        $FunctionalProvider<
          FinishGameUseCase,
          FinishGameUseCase,
          FinishGameUseCase
        >
    with $Provider<FinishGameUseCase> {
  FinishGameUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'finishGameUseCaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$finishGameUseCaseHash();

  @$internal
  @override
  $ProviderElement<FinishGameUseCase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  FinishGameUseCase create(Ref ref) {
    return finishGameUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(FinishGameUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<FinishGameUseCase>(value),
    );
  }
}

String _$finishGameUseCaseHash() => r'4868601b4a9b34ad14486b5762f0815ca68436af';
