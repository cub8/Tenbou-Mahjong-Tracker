// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reconstruct_game_state_use_case.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(reconstructGameStateUseCase)
final reconstructGameStateUseCaseProvider =
    ReconstructGameStateUseCaseProvider._();

final class ReconstructGameStateUseCaseProvider
    extends
        $FunctionalProvider<
          ReconstructGameStateUseCase,
          ReconstructGameStateUseCase,
          ReconstructGameStateUseCase
        >
    with $Provider<ReconstructGameStateUseCase> {
  ReconstructGameStateUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'reconstructGameStateUseCaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$reconstructGameStateUseCaseHash();

  @$internal
  @override
  $ProviderElement<ReconstructGameStateUseCase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  ReconstructGameStateUseCase create(Ref ref) {
    return reconstructGameStateUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ReconstructGameStateUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ReconstructGameStateUseCase>(value),
    );
  }
}

String _$reconstructGameStateUseCaseHash() =>
    r'f3effc92b51189e2d7b337f30b73c17a82be5d47';
