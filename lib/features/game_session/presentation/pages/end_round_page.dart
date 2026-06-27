import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:tenbou_mahjong/core/theme/app_colors.dart';
import 'package:tenbou_mahjong/features/game_engine/domain/models/end_type.dart';
import 'package:tenbou_mahjong/features/game_engine/domain/models/player_role.dart';
import 'package:tenbou_mahjong/features/game_engine/domain/models/winning_hand.dart';
import 'package:tenbou_mahjong/features/game_session/domain/usecases/end_round_use_case.dart';
import 'package:tenbou_mahjong/features/game_session/presentation/providers/game_state_provider.dart';
import 'package:tenbou_mahjong/features/game_session/presentation/widgets/game_board_scaffold.dart';

const _endTypeLabels = {
  EndType.tsumo: 'Tsumo',
  EndType.ron: 'Ron',
  EndType.ryuukyoku: 'Ryuukyoku',
  EndType.chonbo: 'Chonbo',
};

const _typePickerOrder = [
  EndType.tsumo,
  EndType.ron,
  EndType.ryuukyoku,
  EndType.chonbo,
];

enum _Phase { winner, loser, tenpai, riichi, chonbo }

List<_Phase> _phasesFor(EndType type) => switch (type) {
  EndType.tsumo => const [_Phase.winner, _Phase.riichi],
  EndType.ron => const [_Phase.loser, _Phase.winner, _Phase.riichi],
  EndType.ryuukyoku => const [_Phase.tenpai, _Phase.riichi],
  EndType.chonbo => const [_Phase.chonbo],
};

class EndRoundPage extends ConsumerStatefulWidget {
  final int gameId;

  const EndRoundPage({super.key, required this.gameId});

  @override
  ConsumerState<EndRoundPage> createState() => _EndRoundPageState();
}

class _EndRoundPageState extends ConsumerState<EndRoundPage> {
  EndType? _selectedType;
  int _step = 0;

  PlayerRole? _loser;
  final Map<PlayerRole, WinningHand> _winners = {};
  final Set<PlayerRole> _tenpai = {};
  final Set<PlayerRole> _riichi = {};
  final Set<PlayerRole> _chonbo = {};

  _Phase get _currentPhase => _phasesFor(_selectedType!)[_step];

  bool get _stepSatisfied {
    switch (_currentPhase) {
      case _Phase.winner:
        return _selectedType == EndType.tsumo
            ? _winners.length == 1
            : _winners.isNotEmpty;
      case _Phase.loser:
        return _loser != null;
      case _Phase.tenpai:
      case _Phase.riichi:
        return true;
      case _Phase.chonbo:
        return _chonbo.isNotEmpty;
    }
  }

  Color _cornerColor(PlayerRole role) {
    if (_loser == role || _chonbo.contains(role)) return AppColors.loserRed;
    if (_winners.containsKey(role) || _tenpai.contains(role)) {
      return AppColors.selectedGreen;
    }
    return Colors.black;
  }

  String? _handLabel(PlayerRole role) {
    final hand = _winners[role];
    return switch (hand) {
      WinningHandStandard(:final han, :final fu) => '$han Han, $fu Fu',
      WinningHandYakuman(:final multiplier) => 'Yakuman ×$multiplier',
      null => null,
    };
  }

  Future<void> _onCornerTap(PlayerRole role) async {
    switch (_currentPhase) {
      case _Phase.winner:
        if (_winners.containsKey(role)) {
          setState(() => _winners.remove(role));
          return;
        }
        if (_selectedType == EndType.ron && _loser == role) return;
        if (_selectedType == EndType.tsumo && _winners.isNotEmpty) return;
        if (_selectedType == EndType.ron && _winners.length >= 3) return;
        final hand = await _showResultDialog();
        if (hand != null && mounted) setState(() => _winners[role] = hand);
      case _Phase.loser:
        setState(() => _loser = _loser == role ? null : role);
      case _Phase.tenpai:
        setState(() {
          if (!_tenpai.add(role)) _tenpai.remove(role);
        });
      case _Phase.riichi:
        setState(() {
          if (!_riichi.add(role)) _riichi.remove(role);
        });
      case _Phase.chonbo:
        setState(() {
          if (!_chonbo.add(role)) _chonbo.remove(role);
        });
    }
  }

  Future<WinningHand?> _showResultDialog() => showDialog<WinningHand>(
    context: context,
    builder: (context) => const _ResultDialog(),
  );

  void _onNext() {
    final phases = _phasesFor(_selectedType!);
    if (_step >= phases.length - 1) {
      _save();
    } else {
      setState(() => _step++);
    }
  }

  Future<void> _save() async {
    final bundle = ref.read(gameStateProvider(widget.gameId)).value;
    if (bundle == null) return;
    try {
      await ref
          .read(endRoundUseCaseProvider)
          .call(
            currentState: bundle.state,
            gameId: widget.gameId,
            eventCount: bundle.eventCount,
            endType: _selectedType!,
            winners: _winners,
            loser: _loser,
            tenpai: _tenpai,
            riichiDeclarers: _riichi,
            chonbo: _chonbo,
          );
      if (mounted) context.pop(true);
    } catch (error) {
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('$error')));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final bundleAsync = ref.watch(gameStateProvider(widget.gameId));

    return Scaffold(
      appBar: AppBar(
        title: Text(_selectedType == null ? 'End round' : _promptText()),
      ),
      body: bundleAsync.when(
        data: (bundle) => GameBoardScaffold(
          cornerBuilder: (role) {
            final player = bundle.state.players.firstWhere(
              (p) => p.role == role,
            );
            return _FormCorner(
              windAsset: bundle.state.seatWindFor(role).name,
              name: player.name,
              color: _cornerColor(role),
              handLabel: _handLabel(role),
              showRiichi: _riichi.contains(role),
              onTap: _selectedType == null ? null : () => _onCornerTap(role),
            );
          },
          center: _buildCenter(),
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, _) => Center(child: Text('Error: $error')),
      ),
      floatingActionButton: (_selectedType != null && _stepSatisfied)
          ? FloatingActionButton(
              tooltip: 'Next',
              onPressed: _onNext,
              child: const Icon(Icons.arrow_forward),
            )
          : null,
    );
  }

  String _promptText() => switch (_currentPhase) {
    _Phase.winner => 'Who won?',
    _Phase.loser => 'Who lost?',
    _Phase.tenpai => 'Who was tenpai?',
    _Phase.riichi => 'Who declared riichi?',
    _Phase.chonbo => 'Who made the mistake?',
  };

  Widget _buildCenter() {
    if (_selectedType == null) return _buildTypePicker();
    return const SizedBox.shrink();
  }

  Widget _buildTypePicker() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        for (final type in _typePickerOrder)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: SizedBox(
              width: 160,
              child: FilledButton(
                onPressed: () => setState(() {
                  _selectedType = type;
                  _step = 0;
                }),
                child: Text(_endTypeLabels[type]!),
              ),
            ),
          ),
      ],
    );
  }
}

class _FormCorner extends StatelessWidget {
  final String windAsset;
  final String name;
  final Color color;
  final String? handLabel;
  final bool showRiichi;
  final VoidCallback? onTap;

  const _FormCorner({
    required this.windAsset,
    required this.name,
    required this.color,
    required this.handLabel,
    required this.showRiichi,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (showRiichi) ...[
              SvgPicture.asset(
                'assets/images/game/riichi_stick.svg',
                width: 110,
              ),
              const SizedBox(height: 6),
            ],
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                SvgPicture.asset(
                  'assets/images/game/$windAsset.svg',
                  width: 56,
                  colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
                ),
                const SizedBox(width: 12),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    if (handLabel != null) ...[
                      const SizedBox(height: 2),
                      Text(
                        handLabel!,
                        style: const TextStyle(
                          fontSize: 14,
                          color: AppColors.selectedGreen,
                        ),
                      ),
                    ],
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

const _fuOptions = [20, 25, 30, 40, 50, 60, 70, 80, 90, 100, 110];

class _ResultDialog extends StatefulWidget {
  const _ResultDialog();

  @override
  State<_ResultDialog> createState() => _ResultDialogState();
}

class _ResultDialogState extends State<_ResultDialog> {
  int _han = 1;
  int _fuIndex = _fuOptions.indexOf(30);
  bool _yakuman = false;
  int _multiplier = 1;

  int get _fu => _fuOptions[_fuIndex];
  bool get _fuEnabled => _han < 5;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Result'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (!_yakuman) ...[
            const Text('Han'),
            _buildStepper(
              label: '$_han',
              onPrevious: _han > 1 ? () => setState(() => _han--) : null,
              onNext: _han < 13 ? () => setState(() => _han++) : null,
            ),
            const SizedBox(height: 8),
            const Text('Fu'),
            _buildStepper(
              label: '$_fu',
              enabled: _fuEnabled,
              onPrevious: _fuEnabled && _fuIndex > 0
                  ? () => setState(() => _fuIndex--)
                  : null,
              onNext: _fuEnabled && _fuIndex < _fuOptions.length - 1
                  ? () => setState(() => _fuIndex++)
                  : null,
            ),
            const SizedBox(height: 8),
          ],
          CheckboxListTile(
            contentPadding: EdgeInsets.zero,
            controlAffinity: ListTileControlAffinity.leading,
            title: const Text('Yakuman'),
            value: _yakuman,
            onChanged: (value) => setState(() => _yakuman = value ?? false),
          ),
          if (_yakuman) ...[
            const Text('Multiplier'),
            _buildStepper(
              label: '×$_multiplier',
              onPrevious: _multiplier > 1
                  ? () => setState(() => _multiplier--)
                  : null,
              onNext: _multiplier < 6
                  ? () => setState(() => _multiplier++)
                  : null,
            ),
          ],
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Cancel'),
        ),
        FilledButton(
          onPressed: () {
            final hand = _yakuman
                ? WinningHand.yakuman(multiplier: _multiplier)
                : WinningHand.standard(han: _han, fu: _fu);
            Navigator.pop(context, hand);
          },
          child: const Text('OK'),
        ),
      ],
    );
  }

  Widget _buildStepper({
    required String label,
    required VoidCallback? onPrevious,
    required VoidCallback? onNext,
    bool enabled = true,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(icon: const Icon(Icons.chevron_left), onPressed: onPrevious),
        Text(
          label,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: enabled ? null : Colors.grey,
          ),
        ),
        IconButton(icon: const Icon(Icons.chevron_right), onPressed: onNext),
      ],
    );
  }
}
