import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tenbou_mahjong/features/game_engine/domain/models/game_length.dart';
import 'package:tenbou_mahjong/features/game_session/domain/usecases/create_game_use_case.dart';

const _startingPointsOptions = [0, 15000, 25000, 29000, 30000];

const _gameLengthLabels = {
  GameLength.east: 'East',
  GameLength.south: 'South',
  GameLength.west: 'West',
  GameLength.north: 'North',
};

class CreateGameDialog extends ConsumerStatefulWidget {
  const CreateGameDialog({super.key});

  @override
  ConsumerState<CreateGameDialog> createState() => _CreateGameDialogState();
}

class _CreateGameDialogState extends ConsumerState<CreateGameDialog>
    with SingleTickerProviderStateMixin {
  final _formKey = GlobalKey<FormState>();
  final _eastController = TextEditingController();
  final _southController = TextEditingController();
  final _westController = TextEditingController();
  final _northController = TextEditingController();

  late final TabController _tabController = TabController(
    length: 2,
    vsync: this,
  );

  int _startingPoints = 25000;
  GameLength _gameLength = GameLength.south;
  bool _endAtZeroPoints = true;

  @override
  void dispose() {
    _tabController.dispose();
    _eastController.dispose();
    _southController.dispose();
    _westController.dispose();
    _northController.dispose();
    super.dispose();
  }

  Future<void> _onCreate() async {
    if (!_formKey.currentState!.validate()) {
      _tabController.animateTo(0);
      return;
    }

    await ref
        .read(createGameUseCaseProvider)
        .call(
          eastPlayer: _eastController.text,
          southPlayer: _southController.text,
          westPlayer: _westController.text,
          northPlayer: _northController.text,
          startingPoints: _startingPoints,
          gameLength: _gameLength,
          endAtZeroPoints: _endAtZeroPoints,
        );

    // TODO: nawigacja na widok gry po jego utworzeniu
    if (mounted) Navigator.pop(context, true);
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TabBar(
            controller: _tabController,
            tabs: const [
              Tab(text: 'Players'),
              Tab(text: 'Settings'),
            ],
          ),
          Flexible(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxHeight: 420),
              child: TabBarView(
                controller: _tabController,
                children: [_buildPlayersTab(), _buildSettingsTab()],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Cancel'),
                ),
                const SizedBox(width: 8),
                FilledButton(onPressed: _onCreate, child: const Text('Create')),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPlayersTab() {
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            _buildPlayerField('East', _eastController),
            const SizedBox(height: 12),
            _buildPlayerField('South', _southController),
            const SizedBox(height: 12),
            _buildPlayerField('West', _westController),
            const SizedBox(height: 12),
            _buildPlayerField('North', _northController),
          ],
        ),
      ),
    );
  }

  Widget _buildPlayerField(String label, TextEditingController controller) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        border: const OutlineInputBorder(),
      ),
      validator: (value) =>
          (value == null || value.trim().isEmpty) ? 'Required' : null,
    );
  }

  Widget _buildSettingsTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Starting points'),
          const SizedBox(height: 4),
          _buildStartingPointsStepper(),
          const SizedBox(height: 16),
          const Text('Game length'),
          const SizedBox(height: 4),
          _buildGameLengthStepper(),
          const SizedBox(height: 8),
          CheckboxListTile(
            contentPadding: EdgeInsets.zero,
            controlAffinity: ListTileControlAffinity.leading,
            title: const Text('End at 0 points'),
            value: _endAtZeroPoints,
            onChanged: (value) =>
                setState(() => _endAtZeroPoints = value ?? false),
          ),
        ],
      ),
    );
  }

  Widget _buildStartingPointsStepper() {
    final index = _startingPointsOptions.indexOf(_startingPoints);
    return _buildStepper(
      label: '$_startingPoints',
      onPrevious: index > 0
          ? () => setState(
              () => _startingPoints = _startingPointsOptions[index - 1],
            )
          : null,
      onNext: index < _startingPointsOptions.length - 1
          ? () => setState(
              () => _startingPoints = _startingPointsOptions[index + 1],
            )
          : null,
    );
  }

  Widget _buildGameLengthStepper() {
    final index = GameLength.values.indexOf(_gameLength);
    return _buildStepper(
      label: _gameLengthLabels[_gameLength]!,
      onPrevious: index > 0
          ? () => setState(() => _gameLength = GameLength.values[index - 1])
          : null,
      onNext: index < GameLength.values.length - 1
          ? () => setState(() => _gameLength = GameLength.values[index + 1])
          : null,
    );
  }

  Widget _buildStepper({
    required String label,
    required VoidCallback? onPrevious,
    required VoidCallback? onNext,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(icon: const Icon(Icons.chevron_left), onPressed: onPrevious),
        Text(
          label,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        IconButton(icon: const Icon(Icons.chevron_right), onPressed: onNext),
      ],
    );
  }
}
