import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tenbou_mahjong/core/theme/app_colors.dart';
import 'package:tenbou_mahjong/core/utils/string_utils.dart';
import 'package:tenbou_mahjong/features/game_engine/domain/models/game.dart';
import 'package:tenbou_mahjong/features/game_engine/domain/models/end_type.dart';
import 'package:tenbou_mahjong/features/game_engine/domain/models/player_role.dart';
import 'package:tenbou_mahjong/features/game_engine/domain/models/round_history_entry.dart';
import 'package:tenbou_mahjong/features/game_engine/domain/models/wind.dart';
import 'package:tenbou_mahjong/features/game_session/presentation/providers/game_state_provider.dart';

class ScoreboardWidget extends ConsumerWidget {
  final int gameId;

  const ScoreboardWidget({super.key, required this.gameId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bundleAsync = ref.watch(scoreHistoryProvider(gameId));

    return bundleAsync.when(
      data: (bundle) {
        if (bundle.history.isEmpty) {
          return const Center(child: Text('No rounds played yet'));
        }
        return SingleChildScrollView(
          child: _ScoreTable(game: bundle.game, history: bundle.history),
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stackTrace) => Center(child: Text('Error: $error')),
    );
  }
}

class _ScoreTable extends StatelessWidget {
  final Game game;
  final List<RoundHistoryEntry> history;

  const _ScoreTable({required this.game, required this.history});

  @override
  Widget build(BuildContext context) {
    final neutral = Theme.of(context).hintColor;
    final border = BorderSide(color: Theme.of(context).dividerColor);

    return Table(
      border: TableBorder.symmetric(inside: border),
      columnWidths: const {0: FlexColumnWidth(1.2)},
      defaultVerticalAlignment: TableCellVerticalAlignment.middle,
      children: [
        _headerRow(),
        for (final entry in history) ..._entryRows(context, entry, neutral),
      ],
    );
  }

  TableRow _headerRow() {
    final names = [
      game.eastPlayer,
      game.southPlayer,
      game.westPlayer,
      game.northPlayer,
    ];
    return TableRow(
      children: [
        const _Cell(child: SizedBox.shrink()),
        for (final name in names)
          _Cell(
            child: Text(
              truncateWithEllipsis(name, maxLength: 6),
              textAlign: TextAlign.center,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
      ],
    );
  }

  List<TableRow> _entryRows(
    BuildContext context,
    RoundHistoryEntry entry,
    Color neutral,
  ) {
    if (entry.endType == EndType.chonbo) {
      return [
        _chonboRow(entry, neutral),
        _totalsRow(entry),
      ];
    }
    return [
      _deltaRow(entry.handDeltas, _roundLabel(entry), neutral),
      _deltaRow(entry.sideDeltas, '', neutral),
      _totalsRow(entry),
    ];
  }

  TableRow _deltaRow(
    Map<PlayerRole, int> deltas,
    String label,
    Color neutral,
  ) {
    return TableRow(
      children: [
        _Cell(
          child: Text(
            label,
            textAlign: TextAlign.center,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        for (final role in PlayerRole.values)
          _Cell(child: _deltaText(deltas[role] ?? 0, neutral)),
      ],
    );
  }

  TableRow _totalsRow(RoundHistoryEntry entry) {
    return TableRow(
      decoration: BoxDecoration(color: Colors.grey.withValues(alpha: 0.15)),
      children: [
        const _Cell(child: SizedBox.shrink()),
        for (final role in PlayerRole.values)
          _Cell(
            child: Text(
              '${entry.totals[role] ?? 0}',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: _totalColor(
                  (entry.handDeltas[role] ?? 0) + (entry.sideDeltas[role] ?? 0),
                ),
              ),
            ),
          ),
      ],
    );
  }

  TableRow _chonboRow(RoundHistoryEntry entry, Color neutral) {
    return TableRow(
      children: [
        _Cell(
          child: Text(
            'Chonbo',
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.bold, color: neutral),
          ),
        ),
        for (final role in PlayerRole.values)
          _Cell(
            child: entry.chonbo.contains(role)
                ? const Text(
                    'X',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: AppColors.loserRed,
                    ),
                  )
                : const SizedBox.shrink(),
          ),
      ],
    );
  }

  Widget _deltaText(int value, Color neutral) {
    if (value == 0) {
      return Text('-', textAlign: TextAlign.center, style: TextStyle(color: neutral));
    }
    return Text(
      '$value',
      textAlign: TextAlign.center,
      style: TextStyle(
        color: value > 0 ? AppColors.selectedGreen : AppColors.loserRed,
      ),
    );
  }

  Color _totalColor(int roundDelta) {
    if (roundDelta > 0) return AppColors.selectedGreen;
    if (roundDelta < 0) return AppColors.loserRed;
    return Colors.black;
  }

  String _roundLabel(RoundHistoryEntry entry) {
    final kanji = switch (entry.roundWind) {
      Wind.east => '東',
      Wind.south => '南',
      Wind.west => '西',
      Wind.north => '北',
    };
    final base = '$kanji${entry.round}';
    return entry.honba > 0 ? '$base-${entry.honba}' : base;
  }
}

class _Cell extends StatelessWidget {
  final Widget child;

  const _Cell({required this.child});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 4),
      child: child,
    );
  }
}
