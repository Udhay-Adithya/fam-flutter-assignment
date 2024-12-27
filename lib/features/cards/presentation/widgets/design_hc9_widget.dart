import 'package:flutter/material.dart';
import '../../data/models/hc_group_model.dart';

class DesignHC9Widget extends StatelessWidget {
  final HcGroup hcGroup;

  const DesignHC9Widget({super.key, required this.hcGroup});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Text(
            hcGroup.designType.name,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          if (hcGroup.isScrollable)
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: hcGroup.cards.map((card) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(card.title ?? "Untitled"),
                  );
                }).toList(),
              ),
            ),
        ],
      ),
    );
  }
}
