import 'package:flutter/material.dart';
import 'package:flutter_markdown_plus/flutter_markdown_plus.dart';
import 'package:tenbou_mahjong/features/yaku/data/models/yaku_record.dart';
import 'package:tenbou_mahjong/features/yaku/presentation/widgets/mahjong_tiles_widget.dart';
import 'package:tenbou_mahjong/features/yaku/presentation/widgets/value_icon_widget.dart';
import 'package:tenbou_mahjong/router/app_router.dart';

class YakuListItemWidget extends StatelessWidget {
  final YakuRecord record;

  const YakuListItemWidget({super.key, required this.record});

  @override
  Widget build(BuildContext context) {
    final hasTiles = record.indexTiles.isNotEmpty;

    return InkWell(
      onTap: () => YakuDetailRoute(id: record.id).push(context),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildFirstRow(context),
            const SizedBox(height: 8),
            _buildSecondRow(context),
            if (hasTiles) ...[
              const SizedBox(height: 8),
              _buildThirdRow(context),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildFirstRow(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ValueIconWidget(scoring: record.scoring),
        const SizedBox(width: 12),
        Expanded(
          child: Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            spacing: 6,
            children: [
              Text(
                record.romanizedJapaneseName,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                record.originalJapaneseName,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                record.englishName,
                style: TextStyle(
                  fontSize: 12,
                  color: Theme.of(context).hintColor,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildSecondRow(BuildContext context) {
    return MarkdownBody(
      data: record.description,
      styleSheet: MarkdownStyleSheet.fromTheme(
        Theme.of(context),
      ).copyWith(p: Theme.of(context).textTheme.bodySmall),
      shrinkWrap: true,
    );
  }

  Widget _buildThirdRow(BuildContext context) {
    return MahjongTilesWidget(sets: record.indexTiles);
  }
}
