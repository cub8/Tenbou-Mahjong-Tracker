// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_game_use_case.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(createGameUseCase)
final createGameUseCaseProvider = CreateGameUseCaseProvider._();

final class CreateGameUseCaseProvider
    extends
        $FunctionalProvider<
          CreateGameUseCase,
          CreateGameUseCase,
          CreateGameUseCase
        >
    with $Provider<CreateGameUseCase> {
  CreateGameUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'createGameUseCaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$createGameUseCaseHash();

  @$internal
  @override
  $ProviderElement<CreateGameUseCase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  CreateGameUseCase create(Ref ref) {
    return createGameUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(CreateGameUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<CreateGameUseCase>(value),
    );
  }
}

String _$createGameUseCaseHash() => r'9cf48f71cafc220d3e3371c541a64a7b4f42ee3a';
