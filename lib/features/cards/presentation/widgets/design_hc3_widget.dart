import 'package:famcards/core/utils/hex_to_color.dart';
import 'package:famcards/core/utils/launch_url.dart';
import 'package:famcards/features/cards/data/models/card_model.dart' as card;
import 'package:famcards/features/cards/presentation/widgets/dynamic_formatted_text.dart';
import 'package:flutter/material.dart';

import '../../data/models/hc_group_model.dart';

class DesignHC3Widget extends StatelessWidget {
  final HcGroup hcGroup;

  const DesignHC3Widget({super.key, required this.hcGroup});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: hcGroup.height.toDouble(),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: hcGroup.cards.length,
        itemBuilder: (context, index) {
          final card = hcGroup.cards[index];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0), // Add spacing
            child: _buildHc3Card(context, card),
          );
        },
      ),
    );
  }

  Widget _buildHc3Card(BuildContext context, card.Card card) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(15), // Rounded corners
          child: Image.network(
            card.bgImage?.imageUrl ?? "",
            fit: BoxFit.cover,
            width: MediaQuery.sizeOf(context).width - 16,
          ),
        ),
        // Text Overlay with Padding
        Positioned(
          left: 50,
          right: 10,
          top: 200,
          child: DynamicFormattedText(
            formattedTitle: card.formattedTitle!,
          ),
        ),
        ...card.cta.map((cta) {
          return Positioned(
            left: 50,
            bottom: 180,
            child: ElevatedButton(
              onPressed: () async {
                await urlLauncher(card.url ?? "https://google.com");
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: convertHexToColor(cta.bgColor),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text(
                cta.text,
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          );
        }),
      ],
    );
  }
}
