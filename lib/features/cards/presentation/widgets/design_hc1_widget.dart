import 'package:famcards/core/utils/hex_to_color.dart';
import 'package:famcards/features/cards/data/models/card_model.dart' as card;
import 'package:flutter/material.dart';
import '../../data/models/hc_group_model.dart';

class DesignHC1Widget extends StatelessWidget {
  final HcGroup hcGroup;

  const DesignHC1Widget({super.key, required this.hcGroup});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: SizedBox(
        height: hcGroup.height,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: hcGroup.cards.length,
          itemBuilder: (context, index) {
            final card = hcGroup.cards[index];
            return _buildHc1Card(context, card);
          },
        ),
      ),
    );
  }

  Widget _buildHc1Card(BuildContext context, card.Card card) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: SizedBox(
        height: 64,
        width: MediaQuery.sizeOf(context).width - 16,
        child: ListTile(
          contentPadding: const EdgeInsets.symmetric(
            vertical: 4,
            horizontal: 24,
          ),
          tileColor: convertHexToColor(card.bgColor),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          leading: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              card.icon?.imageUrl ?? "",
              fit: BoxFit.cover,
              width: ((card.iconSize)?.toDouble() ?? 16) * 2,
              height: (card.iconSize?.toDouble() ?? 16) * 2,
            ),
          ),
          title: card.formattedTitle != null
              ? Text(
                  card.formattedTitle?.entities.first.text ?? "",
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                )
              : null,
          subtitle: card.formattedDescription != null
              ? Text(
                  card.formattedDescription?.entities.first.text ?? "",
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                )
              : null,
          trailing: const Icon(Icons.arrow_forward_ios_rounded),
        ),
      ),
    );
  }
}
