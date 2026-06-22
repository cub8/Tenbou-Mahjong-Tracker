import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tenbou_mahjong/features/yaku/data/models/mahjong_tile.dart';
import 'package:tenbou_mahjong/features/yaku/data/models/mahjong_tile_set.dart';
import 'package:tenbou_mahjong/features/yaku/data/models/yaku_record.dart';

const _tileAssetBasePath = "assets/images/yaku";

String _assetPathFor(MahjongTile tile) {
  return "$_tileAssetBasePath/${tile.name.toLowerCase()}.svg";
}

class MahjongTilesWidget extends StatelessWidget {
  final List<MahjongTileSet> sets;
  final double tileSize;
  final TileDisplayMode displayMode;
  static const _setGap = 6.0;

  const MahjongTilesWidget({
    super.key,
    required this.sets,
    this.tileSize = 32,
    this.displayMode = TileDisplayMode.grouped,
  });

  @override
  Widget build(BuildContext context) {
    final gap = displayMode == TileDisplayMode.contiguous ? 0.0 : _setGap;

    return Wrap(
      spacing: gap,
      runSpacing: gap,
      children: sets.map((set) => _buildSet(set)).toList(),
    );
  }

  Widget _buildSet(MahjongTileSet set) {
    return Wrap(children: set.tiles.map((tile) => _buildTile(tile)).toList());
  }

  Widget _buildTile(MahjongTile tile) {
    final width = tileSize;
    final height = tileSize * 1.4;

    return SizedBox(
      width: width,
      height: height,
      child: SvgPicture.asset(_assetPathFor(tile), fit: BoxFit.contain),
    );
  }
}
