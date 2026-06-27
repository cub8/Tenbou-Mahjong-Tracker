// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'build_score_history_use_case.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(buildScoreHistoryUseCase)
final buildScoreHistoryUseCaseProvider = BuildScoreHistoryUseCaseProvider._();

final class BuildScoreHistoryUseCaseProvider
    extends
        $FunctionalProvider<
          BuildScoreHistoryUseCase,
          BuildScoreHistoryUseCase,
          BuildScoreHistoryUseCase
        >
    with $Provider<BuildScoreHistoryUseCase> {
  BuildScoreHistoryUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'buildScoreHistoryUseCaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$buildScoreHistoryUseCaseHash();

  @$internal
  @override
  $ProviderElement<BuildScoreHistoryUseCase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  BuildScoreHistoryUseCase create(Ref ref) {
    return buildScoreHistoryUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(BuildScoreHistoryUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<BuildScoreHistoryUseCase>(value),
    );
  }
}

String _$buildScoreHistoryUseCaseHash() =>
    r'25d0487e76010290cda7ca329b03f3348147f096';
