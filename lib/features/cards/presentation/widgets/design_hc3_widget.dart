import 'package:flutter/material.dart';
import '../../data/models/hc_group_model.dart';

class DesignHC3Widget extends StatelessWidget {
  final HcGroup hcGroup;

  const DesignHC3Widget({super.key, required this.hcGroup});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: hcGroup.height, // Set the height of the parent container
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: hcGroup.cards.length,
        itemBuilder: (context, index) {
          final card = hcGroup.cards[index];
          return Stack(
            children: [
              // Background Image
              Container(
                height: hcGroup.height,
                width: MediaQuery.of(context).size.width - 10,
                margin: const EdgeInsets.all(12.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(9),
                  image: DecorationImage(
                    image: NetworkImage(
                      card.bgImage?.imageUrl ?? "",
                      scale: 1,
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              // Text Overlay
              Positioned(
                bottom: 20,
                child: Text(
                  card.formattedTitle?.text ?? "",
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black, // Make the text visible
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
