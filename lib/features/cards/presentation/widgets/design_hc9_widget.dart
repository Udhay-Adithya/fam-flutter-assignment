import 'package:famcards/features/cards/data/models/card_model.dart' as card;
import 'package:flutter/material.dart';
import '../../data/models/hc_group_model.dart';

class DesignHC9Widget extends StatelessWidget {
  final HcGroup hcGroup;

  const DesignHC9Widget({super.key, required this.hcGroup});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: hcGroup.height,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: hcGroup.cards.length,
        itemBuilder: (context, index) {
          final card = hcGroup.cards[index];
          return _buildHc9Card(context, card);
        },
      ),
    );
  }

  Widget _buildHc9Card(BuildContext context, card.Card card) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: Image.network(
        card.bgImage?.imageUrl ?? "",
        fit: BoxFit.cover,
        width: MediaQuery.sizeOf(context).width - 16,
      ),
    );
  }
}
